#!/bin/bash
system_type="$(uname -a)"

if [[ $system_type =~ "MINGW64" ]]; then
  cp vimrc.vim ~/.vimrc && echo "vimrc copied successfully to ~/.vimrc on your MINGW64 system"
elif [[ $system_type =~ "Darwin" ]]; then
  ln -si vimrc.vim ~/.vimrc && echo "vimrc copied successfully to ~/.vimrc on your Darwin system"
else
  echo "System type \"$system_type\" not recognized, no vimrc file transfer was automated"
fi
