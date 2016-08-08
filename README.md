# Media Suite Tech

## Development Environment

### SCM

All developers must use:

- [git-scm](https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control)
- [Mediasuite Github Account](https://github.com/mediasuitenz/)
- Sensitive repositories must be private on mediasuitenz account

### IDEs

We have no standard IDE. Devs are currently using:
- [vim](http://www.manpages.info/linux/vi.1.html)
  - \+ Runs everywhere
  - \+ Powerful
  - \- Steep learning curve
- [SublimeText](https://www.sublimetext.com/)
  - \+ Easy learning curve
  - \+ Great interface and plugins
  - \+ Handles large files very well
  - \- Infrequent updates
  - \- Broken package manager
  - \- Paid license
  - \- Errors when using Watchman
- [Atom](https://atom.io/)
  - \+ FOSS clone of SublimeText
  - \+ Great package / plugin ecosystem
  - \- Slow and resource heavy
  - \- Errors when using Watchman
- [WebStorm](https://www.jetbrains.com/webstorm/)
  - \+ Built-in debugger
  - ? Prescribed workflow / defaults
  - \- Paid license

IDE requirements for the future:
- Must be able to use [standard](https://github.com/feross/standard) linting and formatting.
- Must be able to support backend debugging

### Virtual Machines

Currently using Vagrant/VirtualBox with a maintained [default ubuntu box](https://github.com/mediasuitenz/vagrant-basebox)

## Current Tech

## Language

### ES6
with EmberCLI for frontend transpilation
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference
- http://babeljs.io/docs/learn-es2015/
- https://ponyfoo.com/articles/es6

[Browserify](http://browserify.org/) for all non-ember projects.

[node-standard-style](https://github.com/feross/standard)

Don't forget to set:
```bash
npm config set save=true
npm config set save-exact=true
```

### Hosting


All projects will have unique hosting requirements and constraints.

Our main priority is a managed service with no in house server administration.

Physical distance to servers is relevant.

Currently we are using:

- AWS
  - \+ Provides (managed) databases as a service
  - \+ Postgresql with PostGIS
  - \+ Deployment through Elastic Beanstalk

- Azure
  - \+ MSSQL
  - \+ Active Directory
  - \- Doesn't come with Postgresql out of the box
  - \+ Credibility (Some companies require Mirosoft or IBM in the name)

- Rackspace
  - PHP support
  - Still relevant

### Deployments

Currently all our deployments are manual.

All projects should have a well defined deployment process.

There is no current preference on using a deployment management system, depends on hosting and clients. Potentially we could be using:
- CircleCI
  - Building / Testing projects
- Docker on AWS or Rackspace

We will avoid zero-downtime deployments if possible.

### Databases

Database requirements vary depending on projects and clients.

- [Postgresql](http://www.postgresql.org/) for most projects.
- [PostGIS](http://postgis.net/) for any geospatial projects
- [MSSQL](https://www.microsoft.com/en-us/server-cloud/products/sql-server/) when required
- [Redis](http://redis.io/) for queues, caching, fast key-value stores
- [MariaDB](https://mariadb.org/) if required to use MySQL

#### Migrations and Schema Management

Current practice is to not create migrations during development, and instead maintain a schema and fixtures for devs.

Fixtures should be used during development to mock real user data.

After moving to production migrations must be created and tracked in git.

Likely to use [loopback-db-migrate](https://github.com/slively/loopback-db-migrate) or an extension of it.
  - Needs support for transactions / rollbacks

### Backend

- node.js 4.2.* LTS
- npm
  - Currently there is no LTS version of npm. npm3 breaks a large number of packages. We should be using the latest version of npm2 until a LTS version becomes available.
- StrongLoop Loopback
- [loopback-component-jsonapi](https://github.com/digitalsadhu/loopback-component-jsonapi)
  - In development by Richie and not yet feature-complete.
  - Hope to hand this module over to StrongLoop for maintenance.
- Silverstripe
  - Get a CMS and website for free
  - Required for government projects

### Frontend

- Ember 2.*.*
  - Good upgrade paths
  -  Out of the box [JSON API](http://jsonapi.org/) support
  - Per-project minor version as there are frequent changes and fixes. Should aim to keep projects up to date.
- [Dockyard Ember Style Guide](https://github.com/dockyard/styleguides/blob/master/engineering/ember.md)
- SCSS support allowed
- Sensible grouping of styling rules e.g.
  - SCSS files grouping widgets and page specific rules
  - A single CSS file grouped into blocks of rules

### Mobile

- Cordova/PhoneGap
- Standard project template will be extracted from CGFM

### Standard Libraries / Tools

- [ramda](https://github.com/ramda/ramda)
- [ember-cli-ramda-extended](https://github.com/mediasuitenz/ember-cli-ramda-extended)
- [ramda-extended](https://github.com/mediasuitenz/ramda-extended)
- [ramda-extended-rsvp](https://github.com/mediasuitenz/ramda-extended-rsvp)
- [ember-simple-auth](https://github.com/simplabs/ember-simple-auth)
  - Loopback compatible library will be extracted from TMP for future projects
- [envoodoo](https://github.com/digitalsadhu/envoodoo)
  - Needs Windows support
- [xyz](https://www.npmjs.com/package/xyz)
  - For deploying npm packages, not for our project deployments
- [Moment.js](http://momentjs.com/)
  - [frozen-moment](https://github.com/WhoopInc/frozen-moment)
- [babel](https://babeljs.io/)
- [mochajs](https://mochajs.org/)
- [nsp](https://nodesecurity.io/tools)
- [ember-ajax](http://emberobserver.com/addons/ember-ajax)

#### Testing

Pending decision making. Currently all projects have their own testing standards.

#### Versioning dependencies

All dependencies should be kept at a fixed version to prevent bugs being introduced.

Use `-E` or `--save-exact` with npm to save an exact version rather than using npm's default semver range operator.

## Areas of Investigation / TODO:

- Archiving of old private github repositories
- VisualStudio Code Debugging
- precommit standard linting
- Node/Backend Debugging
  - loopback-cli REPL debugging
- SublimeText notes pulled into this repo
- Better Postgresql client
- psql not enabled on rackspace servers
- Need to define a criteria for finding/vetting ember packages
  - Ember observer?
  - Ember plugins?
- Check on es6 runtime transpilation from jiggl
- Nodeschool for Ramda
- Migrations / Schema Management Standard
- Authorization
- Node Version Management
- Moving packages to MS account (Richie)
- autosave components (Ember 1.12)
- offline-storage (Matt)
- SPA versioning / caching
  - Spike into notifying UA
- Authorization
- Backend/Frontend Architecture
  - Dumb REST APIs or complex objects?
  - Managing complexity in Ember
- Ed's clean/install dependencies checkout script
  - https://gist.github.com/anotheredward/1f4b0e412b1ce6a358ab
- [Otto](https://ottoproject.io/) / Docker (Ersin/Richie)
- [Ember observer](http://emberobserver.com/)
  - Patrick to check canonical ember deployment
- [David](https://david-dm.org/) Dependency-dependency tracking serice.
- [Flow](http://flowtype.org/)
