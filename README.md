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
lsrc -v
```

Checkout the repo
```
git clone git@github.com:promptworks/dotfiles.git /usr/local/share/promptworks-dotfiles
```

Setup your `rcm` configuration file 
```
vim ~/.rcrc
```

Make sure your .rcrc has the following line:
```
DOTFILES_DIRS="$HOME/.dotfiles /usr/local/share/promptworks-dotfiles"
```

Adds the file to your .dotfiles as a host specific file. Feel free to skip the `-o` if you only use your dotfiles on a single machine
```
mkrc -o ~/.rcrc 
```

Make sure it's going to pickup the promptworks files
```
lsrc -v
```

Finally install all the things
```
rcup -v
```

### Notes
* `man rcm` for more info about setting up rcm with an existing repo
* `man rcrc` for how to use your `.rcrc` file to it's fullest
* `man rcup` to understand how all this works
* Checkout [mattmcmanus's dotfiles](https://github.com/mattmcmanus/dotfiles) for a  repo using rcm tags
