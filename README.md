# Media Suite Tech for Onboarding

- [Developer Onboarding](https://mediasuite.atlassian.net/wiki/spaces/SUITE/pages/4994760734/Onboarding+for+developers)
- [Choosing an IDE](onboarding/ide.md)

---
# Install List and Description:


### Pre-requisites and notes
- Prior to running installation, please ensure you have installed Git and Homebrew, see [developer onboarding](https://mediasuite.atlassian.net/wiki/spaces/SUITE/pages/4994760734/Onboarding+for+developers).
- Optional software is denoted with an asterisk `*`.

### Executing shell files
- Shell files can be found in the `scripts` folder.
- Shell files can be executed using the following command in the terminal: `sh <file-location/filename>`.

#### Brew Formulae Installs

| Item | Description |
|--- | --- |
Node| [A JavaScript runtime built on Chrome's V8 JavaScript engine.](https://nodejs.org/en/)
Node Version Manager | [Manages versions of Node being used within projects.](https://github.com/nvm-sh/nvm)
Yarn | [Package manager for Javascript Modules.](https://yarnpkg.com/)
GDAL | [Translator library for raster and vector geospatial data.](https://gdal.org/)
HTOP| [Interactive Process Viewer.](https://htop.dev/)
JQ* | [JSON Query CLI.](https://stedolan.github.io/jq/)
Libxmlsec1| [XML security library.](https://www.aleksey.com/xmlsec/)
MySQL| [MySQL](https://www.mysql.com/)
Open API Generator*|  [OpenAPI Generator allows generation of API client libraries (SDK generation), server stubs, documentation and configuration automatically given an OpenAPI Spec (both 2.0 and 3.0 are supported).](https://github.com/OpenAPITools/openapi-generator)
PHP| [PHP](https://www.php.net/)
Pyenv| [A Python version manager.](https://github.com/pyenv/pyenv)
Pipenv| [Creates and manages virtual environments for your python projects.](https://pipenv.pypa.io/en/latest/)
Ripgrep*| [Recursive searches of directories for regex patterns](https://github.com/BurntSushi/ripgrep)
SOPS*| [Is an editor of encrypted files that supports YAML, JSON, ENV, INI and BINARY formats and encrypts with AWS KMS, GCP KMS, Azure Key Vault, age, and PGP.](https://github.com/mozilla/sops)
The Silver Searcher*| [A code searching tool.](https://github.com/ggreer/the_silver_searcher)
Tree*| [Tree is a recursive directory listing command that produces a depth indented listing of files.](http://mama.indstate.edu/users/ice/tree/)
Vim*| [Vim is a highly configurable text editor.](https://www.vim.org/)
ZSH*| [Also known as the Z shell, is an extended version of the Bourne Shell (sh) with plenty of new features, and support for plugins and themes.](https://www.zsh.org/)
Oh My Zsh*| [Oh My Zsh is an open source, community-driven framework for managing your Zsh configuration.](https://ohmyz.sh/)

#### Brew Cask Installs

| Item | Description |
|--- | --- |
Slack | [Messaging application](https://slack.com/)
Toggl | [Time Tracking](https://toggl.com/track/?utm_source=google&utm_medium=cpc&utm_campaign=Toggl%20Track%20-%20%5BS%5D%20-%20Global%20-%20Brand%20-%20Sign%20Up%20-%20Toggl%20Always%20On%20-%20Ad%203%20-%20Responsive&utm_term=time%20tracker&utm_content=search&cq_src=google_ads&cq_cmp=11493628079&cq_term=toggl&cq_plac=&cq_net=g&cq_plt=gp&gclid=CjwKCAiA9tyQBhAIEiwA6tdCrPPqtv4dyqh1L2_G6ynnxMBzXvb5PE89RY_1u6UQzqDSaqUw25PWvRoCUmoQAvD_BwE)
iTerm2* | [Terminal Emulator for MacOS](https://iterm2.com/)
Visual Studio Code* | [IDE](https://code.visualstudio.com/)
Docker | [Docker is an open source containerization platform. It enables developers to package applications into container.](https://www.docker.com/)
Zoom | [Video Calling Software](https://zoom.us/)
Chrome* | [Web browser](https://www.google.com/chrome/)
Firefox* | [Web browser](https://www.mozilla.org/en-US/firefox/new/)
Brave* | [Web browser](https://brave.com/)
Altair Graphql Client* | [GraphQL server debugger](https://altair.sirmuel.design/)
Figma*| [UI and UX design application.](https://www.figma.com/)
Gimp*| [image editor](https://www.gimp.org/)
MAMP*| [Local server environment](https://www.mamp.info/en/windows/)
Owasp Zap* | [Open-source web application security scanner](https://www.zaproxy.org/)
PostgreSQL | [PostgreSQL](https://www.postgresql.org/)
Rectangle* | [Move and resize windows in macOS using keyboard shortcuts or snap areas.](https://rectangleapp.com/)
Postico* | [PostGres client for mac.](https://eggerapps.at/postico/)
Azure Data Studo* | [Cross platform database tool.](https://docs.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio?view=sql-server-ver15)
Table Plus* | [Database management tool.](https://tableplus.com/)
Fly Cut* | [Clipboard manager tool](https://github.com/TermiT/Flycut)

### VSCode Extensions
*All extensions are optional. Just some handy suggestions.

|General:|
|---|
[Auto-close Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-close-tag)
[Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
[Gitlens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
[Highlight Matching Tag](https://marketplace.visualstudio.com/items?itemName=vincaslt.highlight-matching-tag)
[Javascript EJS Support](https://marketplace.visualstudio.com/items?itemName=DigitalBrainstem.javascript-ejs-support)
[Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
[Standard JS](https://marketplace.visualstudio.com/items?itemName=chenxsan.vscode-standardjs)

|PHP/Silverstripe:|
|---|
[Dotenv](https://marketplace.visualstudio.com/items?itemName=mikestead.dotenv)
[Intelephense](https://marketplace.visualstudio.com/items?itemName=bmewburn.vscode-intelephense-client)
[PHP Code Sniffer](https://marketplace.visualstudio.com/items?itemName=ikappas.phpcs)
[PHP Namespace Resolver](https://marketplace.visualstudio.com/items?itemName=MehediDracula.php-namespace-resolver)
[Silverstripe](https://marketplace.visualstudio.com/items?itemName=adrianhumphreys.silverstripe)

|Python/Django:|
|---|
[Pylance](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance)
[Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)

|Ember/React:|
|---|
[Ember Language Server](https://marketplace.visualstudio.com/items?itemName=EmberTooling.vscode-ember)

### Manual Installs

The following items need to be manually installed:

- [Node Package Manager](https://www.npmjs.com/) - Package manager for Javascript Modules ((installation instructions)[https://github.com/nvm-sh/nvm#installing-and-updating]).
