## Git

All developers must use:

- [git-scm](https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control)
- [Mediasuite Github Account](https://github.com/mediasuitenz/)
- Sensitive repositories must be private on mediasuitenz account

### Merge strategy

Modern projects at Media Suite use the Git Flow pattern for merging and shipping code.
We love [this](http://nvie.com/posts/a-successful-git-branching-model/) post which covers how and why we use pattern.

- When working on features, always branch from the `develop` branch.
- When creating PR's always target them at the `develop` branch.
- Development deployments should be from the `develop` branch.
- The `master` branch always represents what is currently deployed in the `production` environment.
- If a separate release needs to be cut (I.E user acceptance testing or demo), this will be a branch from develop.

