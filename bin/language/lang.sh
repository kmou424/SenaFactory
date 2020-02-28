#!/bin/bash

cd bin/language
FULL_VALUE=$(grep -n $2 $1.lang)
RETURN=${FULL_VALUE#*=}
echo $RETURN
