#!/bin/bash

# Create basic directory
# 创建基础目录

CONF_PATH=config
OUTPUT_PATH=output
TEMP_PATH=temp
UNZIPED_PATH=unziped_rom

# Create config path
if [ ! -d $CONF_PATH ]; then
  mkdir $CONF_PATH
fi

# Create temp
if [ ! -d $TEMP_PATH ]; then
  mkdir $TEMP_PATH
fi

# Create unziped_rom
if [ ! -d $UNZIPED_PATH ]; then
  mkdir $UNZIPED_PATH
fi

# Create output
if [ ! -d $OUTPUT_PATH ]; then
  mkdir $OUTPUT_PATH
fi
