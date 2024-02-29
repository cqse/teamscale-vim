# Teamscale Pre-Commit with Vim

This repository contains [a compiler plugin](./compiler/teamscale.vim) and [some snippets you can put in your .vimrc](./vimrc.vim) to integrate [`teamscale-dev`](https://docs.teamscale.com/getting-started/other-ides/) with Vim (both original vim and NeoVim).

## Installation

1. [Install `teamscale-dev`](https://docs.teamscale.com/getting-started/other-ides/#installing-teamscale-dev).

2. Copy [compiler/teamscale.vim](./compiler/teamscale.vim) to your `$VIMRUNTIME/compiler` folder, e.g. `~/.config/nvim/compiler` for NeoVim.

3. In your `.vimrc`, you must at least define the variables mentioned in [vimrc.vim](./vimrc.vim) to let the plugin know your Teamscale credentials and where `teamscale-dev` is installed.
Optionally, you can use the remaining commands in that file to define a convenient command `:Precommit` to run pre-commit for the current file and a keyboard mapping.
Internally, this command selects Teamscale as the compiler, calls `:make %` and reverts to your previously set compiler so as to not interrupt your existing compiler/make workflow.
Findings are shown in the quickfix window (`:cw`).

4. Make sure your repository contains a `.teamscale.toml` file or [create one](https://docs.teamscale.com/getting-started/other-ides/#configuring-your-projects-using-teamscale-toml-files).

## Testing

If you make changes to this plugin, you can test them with `./test.sh` which launches a vim instance without your user's `.vimrc` but with the plugin and `vimrc.vim` pre-loaded.
The script currently only works with NeoVim.
