# Media Suite Emberjs Style Guide

## Why this exists

I think it's high time (number of developers, number of projects, adding new team members, we are all pretty comfortable with Ember) to agree on some standard style practices for our Ember projects.

This will help reduce friction:

1. Whenever new team member joins
2. If/when we move between teams or pair with someone on a different team
3. When we review PRs for different teams
4. When we share knowledge
5. When we ~~copy/paste~~ share code


Warning: *This is a very optinionated guide to how to build Ember applications and subject to input from everyone on the team*


## Starting a new project

> It's good to be pedantic at the beginning of project

\- Ersin

Before development begins, it's useful to establish what practices you are going to adopt for the project. Just make sure everyone is on the same page, since I'm sure practices will differ a bit from project to project.


### Use Pods

Start the flame war!

1. Use pods for routes and components.
2. Define `ENV.podModulePrefix` in environment.js to keep pods from cluttering the `/app` namespace. E.g. `src` or `pods`
2. Don't use pods for everything else (models, services, adapters)


#### Praise

- It allows you to keep everything relevant to a route or component in a single place instead of keeping track of parallel directory structures.
- Anecdotally, pods reduce the cognitive burden of keeping track of project files. See the example project structure.
- It seems most recent projects have already been organizing components into pods
- File search in Atom/Sublime/Other with cmd+P is easier (Patrick + Ersin)
- All files of the same type are named the same thing (Patrick)

#### Criticism

- File search in Atom/Sublime/Other with cmd+P is harder (Ed, maybe Lewis??)
- All files of the same type are named the same thing (Ed, Lewis)


#### Conclusions
- (Patrick) Unfortunately, pod structure isn't 100% in Ember yet, but I think the benefits of using pods far outweigh the weirder aspects of how pods are organized right now.

Example project structure

```
app/
  adapters/
    application.js
    my-model.js
  models/
    my-model.js
  serializers/
    application.js
    my-model.js
  src/
    components/
      permit-view/
        component.js
        styles.scss
        template.js
        utils.js
      shared/
        some-form-component/
          component.js
          styles.scss
          template.hbs
          utils.js
    application/
      route.js
      template.js
    permits/
      route.js
      template.js
      search/
        route.js
        template.js
        controller.js
        utils.js
        query-params.js
    permit/
      route.js
      template.hbs
      view/
        route.js
        template.hbs
      edit/
        route.js
        template.hbs

```



### Using Routes, Controllers, Components

#### Route templates should do nothing more than invoke components.

Good:

```handlebars
{{!-- app/src/permit/view/template.hbs --}}

<h2>View a Permit</h2>  {{!--A bit of extra markup is ok --}}
{{permit-view model=model someAction="someAction"}}
```

```handlebars
{{!--app/src/components/permit-view/template.hbs--}}
<section>Huge chunk of html</section>
```

Bad:
```handlebars
{{!--app/src/permit/view/template.hbs--}}
<h2>View a Permit</h2>
<section>Huge chunk of html</section>

```

#### Route-level components should be named to match the route path

By looking at the `permit/view` route, I should be able to intuit that there is a component called `permit-view`.

```
app/
  src/
    components/
      permit-view/ (This )
        component.js
        template.hbs
    permit/
      view/
        route.js
        template.hbs
```

#### Controllers should be used for defining and setting query-parameters and nothing else.

#### Don't use setupController or the model hook for logic that could be in a component

Controllers and Routes are on the way out. When you have any logic, you should have a component, not a route, at the top level.

Bad
```javascript
setupController (controller, model) {
  this._super(controller, model)
  const profileUserId = get(model, 'id')
  set(controller, 'isCurrentUser', profileUserId === get(this, 'session.currentUser.id'))
}
```

Better, but still Bad
```javascript
model (params) {
  return {
  user: this.store.findRecord('user', params.user_id),
  isCurrentUser: parseInt(params.user_id, 10) === get(this, 'session.currentUser.id')
}
```

Good
```javascript
//route
model (params) {
  return {
    user: this.store.findRecord('user', params.user_id)
  }
}
//component
export default Ember.Component.extend({
  user: {}, // bind
  isCurrentUser: false,
  init () {
    set(this, 'isCurrentUser', get(user, 'id') === get(this, 'session.currentUser.id'))
}
```

#### Query-parameter configuration should live in a single file that is imported into the route and controller.

Bad (aka straight from [the ember guides...](https://guides.emberjs.com/v2.3.0/routing/query-params/))
- need to make sure router and controller configurations match up 100%
- gets really (really) messy when you have a significant number of query parameters
- lots of room for human error
```javascript
// my-route/route.js
export default Ember.Route.extend({
  queryParams: {
    category: {
      refreshModel: true
    }
  }
})
```

```javascript
// my-route/controller.js
export default Ember.Controller.extend({
  queryParams: ['category'],
  category: null
});
```

Good:
- Configure query parameters in a single place
- no room for human error

```javascript
// TODO: this should really be a package...

// app/utils/query-params.js
export const makeRouterMixin = R.pipe(                                // {k: {replace, defaultValue}} ->
  R.mapObjIndexed(val => R.pick(['replace', 'refreshModel'], val)),   // . -> {k: {replace: Boolean}}
  R.objOf('queryParams')                                              // . -> [ {queryParams: {k: {replace: true}}} ]
)

export const makeControllerMixin = R.converge(            // {a: {defaultValue: *, replace: Boolean}} ->
  R.merge,                                                // -> {queryParams: [a,b,c], a:*, b:*, c:*}
  [
    R.pipe(
      R.keys,                                             // . -> [a, b, c]
      R.objOf('queryParams')                              // . -> {queryParams: [a, b, c]}
    ),
    R.mapObjIndexed(val => R.prop('defaultValue', val))   // . -> {a: *, b: *, c: *}
  ]
)
```

```javascript
// my-route/query-params.js
import {makeRouterMixin, makeControllerMixin} from 'app/utils/query-params'
const config = {
  date: {
    defaultValue: null,   // goes to the controller
    replace: false,       // goes to the router
    refreshModel: true    // goes to the router
  }
}
export const routerConfig = makeRouterMixin(config)
export const controllerConfig = makeControllerMixin(config)

```

```javascript
// my-route/route.js
import {routerConfig} from './query-params'
export default Ember.Route.extend(routerConfig, {

})
```

```javascript
// my-route/controller.js
import {controllerConfig} from './query-params'
export default Ember.Controller.extend(controllerConfig, {

})
```

#### Keep code within Routes, Controllers, Components to a minimum, especially within action handlers

1. Pull out any transforms or procedural code into pure functions.
2. limit action handlers to "glue" code

Examples

Bad:

- harder to test
- need to set up component just to unit test the transform
- The action handler is mixing data-transform with data-flow
- Keeping everything in action handlers can result in spaghetti code blocks

```javascript
export default Ember.Component.extend({
  format: 'YYYY-MM-DD',
  // ...
  actions: {
    dateSelected (newDate) {
      const action = get(this, 'attrs.on-change')

      newDate = moment(newDate)
      if (!newDate.isValid()) {
        action(null)
      } else {
        const format = get(this, 'format')
        action(newDate.clone().format(format))
      }
    }
  }
})
```

Good:

- Simpler flow of logic
- Pure functions are trivial to unit test
- Can easily unit test many inputs/outputs for `formatDate` with a simple integration test for the component
- Easier to document
- `formatDate` is reusable if necessary

```javascript

export default Ember.Component.extend({
  format: 'YYYY-MM-DD',
  // ...
  actions: {
    dateSelected (newDate) {
      const action = get(this, 'attrs.on-change')
      const format = get(this, 'format')
      action(formatDate(newDate, format))
    }
  }
})

/**
 * @param {String|moment|Date} date
 * @param {String} format
 * @param {String} The date formatted as a string
 */
export function formatDate (date, format) {
  const newDate = moment(date)
  if (!newDate.idValid()) return null
  return newDate.clone().format(format)
}

```

### Services

1. Use a service for any global application state
2. Try to keep your services "flat", i.e. avoid creating dependency graphs by keeping the number of dependencies for each service to a minimum.
3. Never use an initializer to inject services into routes, components, etc...
4. Always declare any service injections directly on the route, component, etc... because:

> Explicit is better than implicit.

\- The Zen of Python, by Tim Peters (`$ python -c "import this"`)


Good:

```javascript
const {get, inject} = Ember
export default Ember.Component({
  myService: inject.service('my-service'),
  someMethod() {
    get(this, 'myService').doStuff()
  }
})
```



### Ajax requests

1. Always use [ember-ajax](http://emberobserver.com/addons/ember-ajax)
2. Never use raw jquery ajax (`Ember.$`) - it doesn't hook into the ember runloop without excessive boilerplate
3. Create a different service (extending ember-ajax) for each external api.
4. Always create a service for the application API for all requests that don't match ember-data requests, e.g. login.
5. Wrap each request in a method on the service, so have api endpoints defined in only one place in your code

Examples

Good:

```javascript
// app/services/this-api.js

import Ember from 'ember'
import AjaxService from 'ember-ajax/services/ajax'
import config from '../config/environment'

const {inject, computed, isEmpty, get} = Ember

export default AjaxService.extend({
  host: config.apiPath,  // e.g. `http://localhost:3000/api/`
  session: inject.service(),

  // All requests to the api automatically get auth-headers
  headers: computed('session.authToken', function () {
    let headers = {}
    const authToken = get(this, 'session.authToken')
    if (!isEmpty(authToken)) {
      headers['Authorization'] = authToken
    }
    return headers
  }).readOnly(),

  login(username, email) {
    return this.post('users/login', {
      data: {email, password}
    })
  },
  logout() {
    return this.post('users/logout')
  }
})
```

```javascript
// app/authenticators/loopback.js
import BaseAuthenticator from 'ember-simple-auth/authenticators/base'
import config from '../config/environment'

const {inject, get} = Ember

export default BaseAuthenticator.extend({
  thisApi: inject.service('this-api'),
  authenticate(email, password){
    return get(this, 'thisApi').login(email, password)
  },
  invalidate() {
    return get(this, 'thisApi').logout()
  }
})
```

Bad:

```javascript
// app/authenticators/loopback.js
import Ember from 'ember'
import Base from 'ember-simple-auth/authenticators/base'
import config from '../config/environment'

const { RSVP, isEmpty, run, $ } = Ember

export default Base.extend({
  authenticate (email, password) {
    return new RSVP.Promise((resolve, reject) => {
      $.ajax({
        method: 'POST',
        url: `${config.apiPath}users/login`,
        data: { email: email, password: password }
      }).then((response) => {
        run(() => {
          resolve(response)
        })
      }, (xhr) => {
        run(() => {
          reject(xhr.responseJSON || xhr.responseText)
        })
      })
    })
  },
  invalidate (data) {
    return new RSVP.Promise((resolve) => {
      $.ajax({
        method: 'POST',
        url: `${config.apiPath}users/logout`,
        headers: {
          'Authorization': data['id']
        }
      }).then(() => {
        resolve()
      }, () => {
        resolve()
      })
    })
  }
})
```

### Misc.

#### Use the functional form of getters and setters instead of object methods

Example

Good:
- Allows you to interchange ember objects with POJOs, aka it's safer
- Consistent usage when you use the `get` or `set` method on POJOs
- tmp has been using this with success
```javascript
const {get} = Ember

// Works on Ember objects
get(this, 'model.name')  // -> "Mike"

// Works on anything
get({model: {name: 'Mike'}}, 'model.name') // -> "Mike"
```

Bad:
- looks a bit better when you chain a bunch of stuff together
```javascript
// Works on Ember objects
this.get('model.name') // -> "Mike"

// Doesn't work on anything else
({model: {name: 'Mike'}}).get('model.name') // Exception!
```
