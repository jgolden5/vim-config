#!/bin/bash
OSTYPE="$(uname -a)"
message=
if [[ $? == 0 ]]; then
  case "$OSTYPE" in
    MSYS*|MINGW*)
      system_type="windows"
      ;;
    Darwin*)
      system_type="mac"
      ;;
    Linux*)
      system_type="linux"
      ;;
    *)
      system_type="unknown"
      ;;
  esac

  src_vimrc="vimrc.vim"
  dst_vimrc="$HOME/.vimrc"

  # Work on a temp copy so your source file does not keep changing
  tmp_vimrc="tmp_vimrc.vim"
  cp $src_vimrc $tmp_vimrc
  
  case "$system_type" in
    windows)
      sed -i \
        -e 's|!open|!explorer|g' \
        -e 's|!xdg-open|!explorer|g' \
        -e 's|pbpaste|powershell -NoProfile -Command Get-Clipboard|g' \
        -e 's|xclip -selection clipboard -o|powershell -NoProfile -Command Get-Clipboard|g' \
        "$tmp_vimrc"
      message="vimrc copied successfully to ~/.vimrc on Windows (MSYS/MINGW)"
      ;;
    mac)
      sed -i '' \
        -e 's|!explorer|!open|g' \
        -e 's|!xdg-open|!open|g' \
        -e 's|powershell -NoProfile -Command Get-Clipboard|pbpaste|g' \
        -e 's|xclip -selection clipboard -o|pbpaste|g' \
        "$tmp_vimrc"
      message="vimrc copied successfully to ~/.vimrc on macOS"
      ;;
    linux)
      sed -i \
        -e 's|!explorer|!xdg-open|g' \
        -e 's|!open|!xdg-open|g' \
        -e 's|pbpaste|xclip -selection clipboard -o|g' \
        -e 's|powershell -NoProfile -Command Get-Clipboard|xclip -selection clipboard -o|g' \
        "$tmp_vimrc"
      message="vimrc copied successfully to ~/.vimrc on Linux"
      ;;
    *)
      rm -f "$tmp_vimrc"
      echo "System type \"$OSTYPE\" not recognized; no vimrc transfer was automated."
      exit 1
      ;;
  esac
  mv "$tmp_vimrc" "$src_vimrc"
  cp "$src_vimrc" "$dst_vimrc"
else
  echo "something went wrong copying vimrc.vim to ~/.vimrc"
fi
cp ~/vim-config/vimrc.vim ~/.vimrc 
if [[ -f ~/.ideavimrc ]]; then
  message="$message as well as an optimized version of ~/.ideavimrc"
  cat ~/vim-config/vimrc.vim | grep -v "ttimeoutlen" | grep -v "cterm" | grep -v "background" | grep -v "wildmenu" | grep -v "expandtab" | grep -v "set sw=" | grep -v "set tabstop=" | grep -v "syntax on" | grep -v "timer_start" | grep -v "cursorline" | grep -v "cursorcolumn" > ~/.ideavimrc
fi
echo "$message"
