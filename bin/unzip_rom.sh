#!/bin/bash

OUTPUT_PATH=output
TEMP_PATH=temp
UNZIPED_PATH=unziped_rom

LANGUAGE=$(cat config/language)
GETVALUE="bash bin/language/lang.sh $LANGUAGE"
UNZIP_ROM_START=$($GETVALUE UNZIP_ROM_START)
UNZIP_ROM_END=$($GETVALUE UNZIP_ROM_END)
ZIP_FILE_NOT_FOUND=$($GETVALUE ZIP_FILE_NOT_FOUND)
ZIP_FILES_TO_MANY_ERROR=$($GETVALUE ZIP_FILES_TO_MANY_ERROR)

echo $UNZIP_ROM_START
if [ ! -f "*.zip" ]; then
  echo $ZIP_FILE_NOT_FOUND
  exit 1
fi
# Detect the number of zip files
# 检测工具目录下zip文件的数量
ls *.zip > temp/temp_ls
temp_ls_files_cout=$(wc -l temp/temp_ls)
files_cout=${temp_ls_files_cout%% *}
rm -rf temp/temp_ls
if [ $files_cout -ne 1 ]; then
  echo $ZIP_FILES_TO_MANY_ERROR
  rm -rf temp unziped_rom
  exit 1
else
  # Unzip Rom
  #unzip -n *.zip -d unziped_rom
  rm -rf $UNZIPED_PATH/vendor.patch.dat $UNZIPED_PATH/system.patch.dat $UNZIPED_PATH/compatibility.zip
  mv $UNZIPED_PATH/boot.img $OUTPUT_PATH/boot.img
  mv $UNZIPED_PATH/firmware-update $OUTPUT_PATH/firmware-update
  mv $UNZIPED_PATH/* $TEMP_PATH/
  echo $UNZIP_ROM_END
fi
