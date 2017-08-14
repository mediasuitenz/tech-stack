We use https://emberobserver.com/ to find plug-ins

## Standard Ember Plugins
* [Ember Exam](https://github.com/trentmwillis/ember-exam) - Replace `ember s` with `ember exam` for improved features such as randomised test execution order, and running tests in parallel.
* [Media Suite Form Elements](https://github.com/mediasuitenz/mediasuite-form-elements) - Wraps the Dockyard One-way controls (currently) in standard styling for use in Media Suite projects.
* [Ember Browserify](https://github.com/ef4/ember-browserify) - Be able to use npm modules in your Ember code with ease.  Tip: only `import` the module you want, e.g. `import cloneDeep from 'npm:lodash/cloneDeep` as this will keep the size of your vendor.js to a minimum.
* [Ember Moment](https://github.com/stefanpenner/ember-moment) - Better Moment.js support, including template helpers.
* [eslint-config-standard](https://github.com/standard/eslint-config-standard) - Slightly more tricky to set up, but you end up with better Standard.js support - including the correct linting when running `ember s`
* [ember-truth-helpers](https://github.com/jmurphyau/ember-truth-helpers) - Vital for basic comparisons within templates
* [ember-route-action-helper](https://github.com/DockYard/ember-route-action-helper) - Create an actions hash in your Route files that you can access from the template.  With this, the need for Controllers is limited to support for query params.
