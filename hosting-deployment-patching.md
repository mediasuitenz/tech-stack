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

### Versioning dependencies

All dependencies should be kept at a fixed version to prevent bugs being introduced.

Use `-E` or `--save-exact` with npm to save an exact version rather than using npm's default semver range operator.

