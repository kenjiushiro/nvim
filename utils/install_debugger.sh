#!/bin/bash

debuggers_path=~/.config/debuggers
mkdir -p $debuggers_path

function print_line() {
  printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
}

clone_repo () {
  print_line
  git_repo=$1
  folder_name=$(basename "$git_repo")
  debuggers_path="$debuggers_path/$folder_name"

  if [ -d $debuggers_path ]
  then
   echo "Debugger is already downloaded in $debuggers_path."
  else
   git clone $git_repo $debuggers_path
  fi
}

install_debugger () {
  print_line
  debugger_file="$debuggers_path/$1"
  if [ -f $debugger_file ]
  then
   echo "Debugger is already installed in $debugger_file."
  else
    cd $debuggers_path
    eval "$2"
    eval "$3"
  fi
}

install_debugger_from () {
  clone_repo $1

  install_debugger "$2" "$3" "$4"

}

case $1 in
"ts"|"js"|"node"|"javascript"|"typescript")
  install_debugger_from "https://github.com/microsoft/vscode-node-debug2" "out/src/nodeDebug.js" "npm i" "npm run build"
  ;;
"chrome")
  install_debugger_from "https://github.com/Microsoft/vscode-chrome-debug" "out/src/chromeDebug.js" "npm i" "npm run build"
  ;;
"php")
  install_debugger_from "https://github.com/xdebug/vscode-php-debug" "out/phpDebug.js" "npm i" "npm run build"
  ;;
"bash")
  install_debugger_from "https://github.com/rogalmic/vscode-bash-debug" "out/bashDebug.js" "npm i" "npm run compile"
  ;;
"python")
  echo "Creating virtualenv for debugpy"
  mkdir -p ~/.virtualenvs
  cd ~/.virtualenvs
  python3 -m venv debugpy
  debugpy/bin/python -m pip install debugpy
  ;;
esac
