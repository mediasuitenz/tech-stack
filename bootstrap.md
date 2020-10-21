## Package manager (homebrew)
Quite a few things can be installed via homebrew using `brew install`. You can use
`brew search` to find packages and `brew list` to see installed packages. If you have
any problems try running `brew doctor` as a first step
- homebrew `ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"`
- `brew install cask` to be able to install binaries like Firefox

## Git Config
- Create a key and add it to github: https://help.github.com/articles/generating-ssh-keys
- Request to have your github account added to the mediasuitenz organisation
- `git config --global user.name "John Doe"`
- `git config --global user.email johndoe@example.com`
- `git config --global color.ui true`
- `git config --global color.diff.whitespace "red reverse"`

## Time-tracking
Time-tracking is performed using the commercial Toggl Application, with a link to JIRA via the in-house Jiggle-UI.
- `brew cask install toggl`
- https://github.com/mediasuitenz/jiggl-ui

## Databases
Postgres local database and client
- `brew cask install postgres`  
- `brew cask install postico`
- `brew cask install sequel-pro` MySql Client

## Browsers
- `brew cask install chrome`
- `brew cask install firefox` 

## Programming Languages
### Python
- Currently different projects are running different stacks
- pyenv and pipenv are recommended, you should only use your system install of Python to launch other versions of Python

### Node
- `brew install node` Node binary (you'll use this one primarily for launching other versions of node)
- `npm install --global n` Adds `n` command for managing Node versions
- `which node` and `which npm` should return valid paths, if not try adding `export PATH=/path/to/node/bin:$PATH` to your ~/.bashrc or ~/.zshrc
- To switch versions of node for each project, run the n command with a version number, eg: `n 7`, to get and activate the latest version of Node 7 for all terminals

## Virtual Machines
- `brew cask install docker`
### If you need to run an older VM
- `brew cask install virtualbox` 
- `brew cask install vagrant`

## Communication tools
- `brew cask install slack` Work chat tool
- `brew cask install zoom-us` Video conferencing tool

## Productivity
- `brew cask install rectangle` Shortcuts for arranging windows
- https://rectangleapp.com/

## Better Terminal (Optional)
### bash and default Terminal app route
- `brew install bash` downloads a recent copy of bash to run alongside Mac's in-built old one
- `brew install bash-completion` autocompletion for bash
- https://github.com/mrzool/bash-sensible Sensible defaults for bash
- Set "General->Shells open with command" in Mac's Terminal app to the new version of Bash, probably at `/usr/local/bin/bash`
- https://github.com/tomislav/osx-terminal.app-colors-solarized

### zsh and iTerm2 route
- `brew cask install iterm2` Better Terminal Emulator
- `brew install zsh` Better interactive default shell
- review and copy this [config file](.zshrc)
- `curl -L http://install.ohmyz.sh | sh` Package manager for zsh
- change your default shell to zsh
- `chsh -s /bin/zsh`

## Other Mac Configuration Options
 - You may wish to update Finder so that it shows hidden files:
    -  Open a Terminal Window and type `defaults write com.apple.finder AppleShowAllFiles YES`
    -  Restart Finder `killAll Finder`
 - The new USB-C MacBooks use a strategy for cooling that isn't well suited to development work - changing the settings using [smcFanControl](https://github.com/hholtmann/smcFanControl) can help with this.
    -  `brew cask install smcfancontrol`
    -  Select the `Higher RPM` favorite.
    -  Change the Exhaust fan setting to something reasonably high but not too noisy - eg. 4300rpm
    -  Make sure `Autoapply favorite when powersource changes` is checked and change `AC-Power` and `Charging` to use the `Higher RPM` favorite.
