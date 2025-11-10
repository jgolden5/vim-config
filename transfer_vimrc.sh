#!/bin/bash
system_type="$(uname -a)"
message=
if [[ $? == 0 ]]; then
  if [[ $system_type =~ "MINGW64" ]]; then
    message="vimrc copied successfully to ~/.vimrc on your MINGW64 system"
    sed -i 's/open/start/g' vimrc.vim
  elif [[ $system_type =~ "Darwin" ]]; then
    message="vimrc copied successfully to ~/.vimrc on your Darwin system"
  else
    message="System type \"$system_type\" not recognized, no vimrc file transfer was automated"
  fi
else
  echo "something went wrong copying vimrc.vim to ~/.vimrc"
fi
cp vimrc.vim ~/.vimrc 
echo "$message"
