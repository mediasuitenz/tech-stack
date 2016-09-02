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
- [VS Code](https://code.visualstudio.com/)
  - \+ Awesome Debugger
  - \+ Works well out of the box, eg: Intellisense
  - \- Limited features/Plugins when compared to Atom
- [WebStorm](https://www.jetbrains.com/webstorm/)
  - \+ Built-in debugger
  - ? Prescribed workflow / defaults
  - \- Paid license

## Current Tech

### ES6

[Browserify](http://browserify.org/) for non-ember projects

[node-standard-style](https://github.com/feross/standard)

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

#### Merge strategy

Modern projects at Media Suite use the Git Flow pattern for merging and shipping code.
We love [this](http://nvie.com/posts/a-successful-git-branching-model/) post which covers how and why we use pattern.

- When working on features, always branch from the `develop` branch.
- When creating PR's always target them at the `develop` branch.
- Development deployments should be from the `develop` branch.
- The `master` branch always represents what is currently deployed in the `production` environment.
- If a separate release needs to be cut (I.E user acceptance testing or demo), this will be a branch from develop.


### Databases

Database requirements vary depending on projects and clients.

- [Postgresql](http://www.postgresql.org/) for most projects.
- [PostGIS](http://postgis.net/) for any geospatial projects
- [MSSQL](https://www.microsoft.com/en-us/server-cloud/products/sql-server/) when required
- [Redis](http://redis.io/) for queues, caching, fast key-value stores
- [MariaDB](https://mariadb.org/) if required to use MySQL

### Stack

- node.js 4.2.* LTS
- npm2
- StrongLoop Loopback
- Silverstripe CMS, Required for government projects
- Ember 2.*.*
- Cordova/PhoneGap for Mobile, eg: Cruise Guide

### Standard Libraries / Tools

- [ramda](https://github.com/ramda/ramda)
  - [ember-cli-ramda-extended](https://github.com/mediasuitenz/ember-cli-ramda-extended)
  - [ramda-extended](https://github.com/mediasuitenz/ramda-extended)
  - [ramda-extended-rsvp](https://github.com/mediasuitenz/ramda-extended-rsvp) 
- [Moment.js](http://momentjs.com/)
- [envoodoo](https://github.com/digitalsadhu/envoodoo) , Windows support?
- [xyz](https://www.npmjs.com/package/xyz) , For npm packages 

#### Testing

Pending decision making. Currently all projects have their own testing standards.

#### Versioning dependencies

All dependencies should be kept at a fixed version to prevent bugs being introduced.

Use `-E` or `--save-exact` with npm to save an exact version rather than using npm's default semver range operator.
