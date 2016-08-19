# Media Suite Emberjs Style Guide

## Prototype over static functions in model Custom Routes

* We should prefer using prototype model methods over static methods when tying to a custom end-point. Consider this static declaration route:

```javascript
 Worksite.remoteMethod('startWork', {
   accepts: [
     {arg: 'id', type: 'number', required: true},
     {arg: 'data', type: 'object', http: {source: 'body'}}
   ],
   returns: {type: 'Worksite', root: true},
   http: {path: '/:id/start-work', verb: 'post', status: 200}
 })
```

* By default this is a going to tie to a static method that would probably look a little like this:

```javascript
 WorksiteSubmission.startWork = function (id, data, cb) {
   WorksiteSubmission.findById(id)
     .then(worksite => {
       if (!worksite) {
         const err = new Error('No worksite found')
         err.status = 404
         cb(err)
       }
       ...
```

* In this example, we are required to look up the target model as one of the first operations of the method, and then check this was a valid model.
* All this can be handled for us if we use prototype methods, in the following structure:

```javascript
 Worksite.remoteMethod('startWork', {
   accepts: [
     {arg: 'id', type: 'number', required: true},
     {arg: 'data', type: 'object', http: {source: 'body'}}
   ],
   isStatic: false,
   returns: {type: 'Worksite', root: true},
   http: {path: '/start-work', verb: 'post', status: 200}
 })

 Worksite.prototype.startWork = function (data, cb) {
   ...
```

* In this example, `this` is the worksite, and a failure to find a worksite matching the supplied Id returns a 404 before it hits this method.
* This mechanism reduces the code required in your Model methods.
* **Note** It is important to use traditional function declarations over ES6 arrow functions when declaring your prototype, otherwise the `this` keyword will not have the correct context.
I.e.
* slc generator is useful here `slc loopback:remote-method`

```javascript
Worksite.prototype.startWork = function (data, cb) {
```

Not

```javascript
Worksite.prototype.startWork = (data, cb) => {
```

## Things to be aware of with Loopback and Postgres
So I ran a sql injection fuzzer https://github.com/sqlmapproject/sqlmap on the search endpoint to see what I could dig up. As far as I can tell there was no successful injection - but I did uncover two crashes at the pg level, so the takeaway is:

> Loopback DOES prepare the statements, passing them to the pg lib, which as far as I can tell passes them over the pg connection and lets pg do the preparing

> Loopback DOES NOT know anything about column types / paramters. So '1a' gets passed as a string literal in .id = clause

> PostgreSQL DOES NOT implicitly cast '1a' to 1 and instead throws an exception invalid input syntax for integer

So we have to manually ensure we only pass integers down the chain

> Loopback DOES NOT correctly escape / remove invalid data from the parameters (null byte not allowed in a string)

So we have to manually remove null characters from strings

> Loopback DOES NOT handle errors from the pg adapter - it bounces them all the way back to the top of the stack including postgres .c file names and line numbers :rage4:

So we have to be pretty damn vigilant with fuzzing / testing any SQL statements we make
