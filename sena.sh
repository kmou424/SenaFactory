#!/bin/bash

bash bin/directorykeeper.sh

# Multi-language Support
SYSTEM_LANGUAGE=${LANG: 0: 5}
LANGUAGE=$(bash bin/get_current_language.sh $SYSTEM_LANGUAGE 0)

if [ $LANGUAGE == "DEF_LANG" ]; then
echo "We did not detect a language pack corresponding to your system language."
echo "So we will use default language pack for you"
LANGUAGE="zh_CN"
elif [ $LANGUAGE == "NO_LANG" ]; then
echo "Error: Did not find any language pack...aborting"
exit 1
fi

echo $LANGUAGE > "config/language"
GETVALUE="bash bin/language/lang.sh $LANGUAGE"
LANG_NOTICE_HEADER=$($GETVALUE LANG_NOTICE_HEADER)
TIME_TEXT_HEADER=$($GETVALUE TIME_TEXT_HEADER)

# Date&Time
DATE=`date --date='0 days ago' "+%Y-%m-%d"`
TIME=`date --date='0 days ago' "+%H:%M:%S"`

# Welcome
bash bin/welcome.sh

echo "$TIME_TEXT_HEADER $DATE $TIME"
echo "$LANG_NOTICE_HEADER $LANGUAGE"
echo

# Unzip
bash bin/unzip_rom.sh
