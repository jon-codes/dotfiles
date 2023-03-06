# jon's dotfiles

Config files, managed by [GNU Stow](https://www.gnu.org/software/stow/).

## requirements

- [Git](https://git-scm.com/)
- [GNU Stow](https://www.gnu.org/software/stow/)

## usage

1. clone repository to `$HOME/dotfiles`

```bash
git clone git@github.com:jon-codes/dotfiles.git ~/dotfiles && \
cd ~/dotfiles
```

2. symlink config files

```bash
# stow everything
stow */

# stow individual packages
stow bash git # ... etc
```

## removing

```bash
# unstow everything
stow --delete */

# unstow individual packages
stow --delete bash git # ... etc
```
