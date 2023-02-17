#!/bin/sh
if [ $# != 1 ]; then
  echo 'arg error'
  exit 1
fi

if [ ! -e ~/.cache/nvim/server.pipe ]; then
  echo 'not exist'
  echo $1
  nvim-qt -- --listen ~/.cache/nvim/server.pipe
  sleep 0.2
fi

nvim --server ~/.cache/nvim/server.pipe --remote $1
