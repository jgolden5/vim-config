#!/bin/bash
system_type="$(uname -a)"
cp vimrc.vim ~/.vimrc 
if [[ $? == 0 ]]; then
  if [[ $system_type =~ "MINGW64" ]]; then
    echo "vimrc copied successfully to ~/.vimrc on your MINGW64 system"
  elif [[ $system_type =~ "Darwin" ]]; then
    echo "vimrc copied successfully to ~/.vimrc on your Darwin system"
  else
    echo "System type \"$system_type\" not recognized, no vimrc file transfer was automated"
  fi
else
  echo "something went wrong copying vimrc.vim to ~/.vimrc"
fi
