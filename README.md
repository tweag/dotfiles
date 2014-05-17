# Promptworks dotfiles FTW

Dotfiles for promptworkers, for use with their own dotfiles

## Simple Setup for OSX

*Assumption:* You currently are using some form of dotfiles that symlinks files from `~/.dotfiles`

Install `rcm`

```
brew tap thoughtbot/formulae
brew install rcm
```

Make sure everything looks right 
```
mkdir -p ~/.dotfiles
lsrc -v
```

Checkout the repo
```
git clone git@github.com:promptworks/dotfiles.git /usr/local/share/promptworks-dotfiles
```

Tell rcup about the promptworks dotfiles the first time:
```
rcup -v -d ~/.dotfiles -d /usr/local/share/promptworks-dotfiles
```

Add an existing dotfile in your home directory to your .dotfiles as a host specific file. Feel free to skip the `-o` if you only use your dotfiles on a single machine
```
mkrc -o ~/.gitconfig.local
```

Make sure it's going to pick up the promptworks files
```
lsrc -v
```

Finally install all the things
```
rcup -v
```

*Note:* Your personal dotfiles will take precedence over the promptworks dotfiles. To have it both ways (.gitconfig, for example), append .local to the end, as described in thoughtbot/dotfiles

### Notes
* `man rcm` for more info about setting up rcm with an existing repo
* `man rcrc` for how to use your `.rcrc` file to it's fullest
* `man rcup` to understand how all this works
* Checkout [mattmcmanus's dotfiles](https://github.com/mattmcmanus/dotfiles) for a  repo using rcm tags
* To uninstall all rcm-managed dotfiles, run `rcdn` with the `-d` arguments you gave to rcup
