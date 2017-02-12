# Criteria for Selecting Technology
When we evaluate the alternatives for our tech stack, we need to consider what we want.  This set of criteria is designed to be a list of items that, if fulfilled, will ensure we have a high speed, high quality development process.
The criteria themselves are designed to be items we can prove are supported, or not.  It's also planned that evaluating the criteria should not be too onerous a task, in a nod towards the time constraints inherent in any non-billable work.

* Community
 * Good docs, canonical answers
 * Can get access to expertise for learning and problem solving
 * Well used product with road-map
 
* Speed of development
 * Has good IDE support / step-by-step debugger
 * Boiler plate is either abstracted away or any auto-generated code is clean and easy to reason about
 * Language is either known, or can be learnt quickly, by the dev team
 * New hires need to be able to hit the ground running
 * Adding new features that the framework doesn't support out the box should be easy
 * Library code is clean and understandable

* Roles and permissions
 * Roles and permissions baked in
 * Need to be protect access to read and write to whole end points, and individual fields
 * Need to be able to access the query before, and the results after hitting the db in case we need to make custom changes

* ORM / database access
 * Any ORM model layer can be constructed from an existing db, including relationships
 * ORM supports joins and more complex queries
 * Should be able to drop-down to SQL and re-hydrate objects from the results-set


* Good test story
 * Known existing best practices around how to test and what to test
 * Provides a framework for execution of tests
 * Stubs out tests to reduce initial boiler plate

* Ember Support (if we keep using Ember)
 * JSON-API support if we keep using Ember data
 * Ability to generate query DSL request from client (if Ember Data) or easy to create custom end-point to provide the right data
 
