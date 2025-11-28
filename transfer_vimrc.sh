#!/bin/bash
system_type="$(uname -a)"
message=
if [[ $? == 0 ]]; then
  if [[ $system_type =~ "MINGW64" ]]; then
    sed -i 's/!open/!explorer/g' vimrc.vim #dang it, internet explorer!
    sed -i 's/pbpaste/powershell -command Get-Clipboard/g' vimrc.vim
    message="vimrc copied successfully to ~/.vimrc on your MINGW64 system"
  elif [[ $system_type =~ "Darwin" ]]; then
    sed -i '' 's/!explorer/!open/g' vimrc.vim
    sed -i '' 's/powershell -command Get-Clipboard/pbpaste/g' vimrc.vim
    message="vimrc copied successfully to ~/.vimrc on your Darwin system"
  else
    message="System type \"$system_type\" not recognized, no vimrc file transfer was automated"
  fi
else
  echo "something went wrong copying vimrc.vim to ~/.vimrc"
fi
cp vimrc.vim ~/.vimrc 
echo "$message"
