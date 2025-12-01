#!/bin/bash
system_type="$(uname -a)"
message=
if [[ $? == 0 ]]; then
  if [[ $system_type =~ "MINGW64" ]]; then
    sed -i 's/!open/!explorer/g' vimrc.vim #dang it, internet explorer!
    sed -i 's/pbpaste/powershell -command Get-Clipboard/g' vimrc.vim
    message="vimrc copied successfully to ~/.vimrc on your MINGW64 system"
  elif [[ $system_type =~ "Darwin" ]] || [[ $system_type =~ "Linux" ]]; then
    sed -i '' 's/!start/!open/g' vimrc.vim
    message="vimrc copied successfully to ~/.vimrc on your Unix-based system"
  else
    message="System type \"$system_type\" not recognized, no vimrc file transfer was automated"
  fi
else
  echo "something went wrong copying vimrc.vim to ~/.vimrc"
fi
cp vimrc.vim ~/.vimrc 
echo "$message"
