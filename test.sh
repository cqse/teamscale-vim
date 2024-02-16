
# this assumes neovim. change for normal vim
mkdir -p ~/.config/nvim/compiler
[ ! -e ~/.config/nvim/compiler/teamscale.vim ] && ln -s "`pwd`/compiler/teamscale.vim" ~/.config/nvim/compiler/teamscale.vim
vim -u ./command.vim -S ./user.vim
