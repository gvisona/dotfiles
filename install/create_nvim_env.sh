#!/bin/bash

if [ ! -d "$HOME/.neovim_venv" ]; then
  python3 -m venv --clear ~/.neovim_venv
  ~/.neovim_venv/bin/pip install --upgrade --no-cache pynvim jupyter qtconsole python-lsp-server pylsp-mypy python-lsp-ruff jupyter_qtconsole_colorschemes
  echo '\nNeoVim venv successfully created!\n'
else
  echo '\nNeoVim venv already created!\n'
fi
