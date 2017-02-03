# Pain-Points
What is it about our current tech stack that causes us to take too long?

## Loopback
* Security
 * Side-loading - can issue query from the client and walk through relationships to retrieve any linked data. **note: are able through mixins to hide sensitive fields, but not whole rows**
 * We have mixins to limit read access to rows based on role, properties based on role and properties based on role/data-condition combo.
 * We have mixins to limit update access to fields based on role
 * The approaches are currently per project, with different solutions. We haven't yet had time to make them consistent, or battle test them.
 * Open by default, but we have a mixin to address this
* Leads us towards offering APIs that represent our database structure.  The client may be working with structures that are not how we choose to store our data, and that should be okay.
* Validations are poor.  The inbuilt ones are very limited, and custom validations are okay but verbose.
* Database
 * Database errors are not consistently formatted with Loopback errors back through to the client.  
 * The ORM is lowest-common-denominator, we can't do any kind of join which results in overly complex queries
 * We can't easily break out to SQL and rehydrate models like you can in decent ORMs like Doctrine.
* Out the box doesn't speak JSON-API.  We have our own component for that, but as Loopback updates, we have a maintenance responsibility
* Not comfortable in updating to version 3
* Documentation is poor and available community solutions / avenues of investigation are few.  Has undocumented features (e.g. `getAsync()`)
* Inconsistent promisification of methods
* No real ability to do multi-page apps or offer a CMS.  Need a completely different solution for this currently.
* Don't know who a user is throughout the lifecycle of the request makes some important things impossible at the operation hook left.
* Configuration is a little bit confusing.  Easy to lose time with to forgotten setting.
* Loopback code quality is generally poor, or at least not easy to understand.  When you have to drop into the library code to understand what is going on, you can waste a lot of time.
* No control over which order the hooks run (e.g. two `beforeRemote('create', ...` hooks will run in whatever order Loopback likes, something we can't influence)
* No out-the-box test solution.  While in reality it's easy enough to hit end-points use Supertest or similar, it's still painful to organise, set-up, tear-down your test data each time and can also be pretty slow execution.  **note: MWS has some solutions to this, not sure generic they are.**  Also note that in MWS, brittle test data caused way more failed tests than any actual bugs.
* Doesn't appear to have a strong road-map or evidence of issues being addressed in a timely fashion.  Confidence in it is low.


Ember / JSON-API spec

* Transactional saves of multiple models is currently impossible without writing a fair amount of custom code
 * This is not just Ember's problem - it's not currently possible within the JSON-API spec.  However, even once that is resolve, it's not clear how long Ember Data will take to implement
* Duplication of our Data Models on client and server
* Data Models that represent the database rather than from any application need.  Often coincide, sometimes don't.
* Pages can have many, many requests on.  Side-loading up front has massive benefit, but still doesn't entirely solve the problem.
* Ember Data as a cache is not that helpful between pages.  We invariably end up refetching everything we need because we can't be sure of the current state of the cache and we need to side-load.
* Forms containing multiple models are hard - both because of the transactional save issue mentioned previous, but also in determining if changes have been made if those changes are in relationships.
* Performance just isn't as fast as we would like.  Not sure if this is XHRs or heavy Javascript usage.
