# ryanhouston/dotfiles

Collection of my configuration files cultivated over many years. Utilize
[GNU Stow](https://www.gnu.org/software/stow) to install and manage dotfiles.

## Install

Run the script `./install.sh` to create symlinks in the $HOME directory to the
packages maintained here. Most packages follow
[XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/latest/)
using `~/.config` as the default placement for config files.

### tmux

After stowing the dotfiles packages to `$HOME` install TPM plugins with
`<C-b><I>` inside a tmux session. This should auto-install TPM and the
catppuccin theme amongst the other defined plugins. tmux may need to be
restarted for all things to properly take effect.

### alacritty

Install [alacritty-themes](https://github.com/alacritty/alacritty-theme) colorschemes.

```sh
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/alacritty-themes
```
