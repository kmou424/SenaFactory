#!/bin/bash

# $1: System Default Language
# $2: Enable return default language flag mode or yet
#     0: Enable
#     1: Disable

if [ -f bin/language/$1.lang ]; then
  echo $1
else
  if [ ! -f bin/language/zh_CN.lang ]; then
    echo "NO_LANG"
  else
    if [ $2 == "0" ]; then
      echo "DEF_LANG"
    else
      echo "zh_CN"
    fi
  fi
fi
