#!/bin/sh

# Paper.js - The Swiss Army Knife of Vector Graphics Scripting.
# http://paperjs.org/
#
# Copyright (c) 2011 - 2013, Juerg Lehni & Jonathan Puckey
# http://lehni.org/ & http://jonathanpuckey.com/
#
# Distributed under the MIT license. See LICENSE file for details.
#
# All rights reserved.

# preprocess.sh
#
# A simple code preprocessing wrapper that uses a combination of cpp, jssrip.py
# and sed to preprocess JavaScript files containing C-style preprocess macros
# (#include, #ifdef, etc.). Three options offer control over wether comments
# are preserved or stripped and whitespaces are compressed.
#
# Usage:
# preprocess.sh MODE SOURCE DEFINITIONS PREPRO_INCLUDE DESTINATION
#
# MODE:
#	commented		Preprocessed, still formated and commented
#	stripped		Preprocessed, formated but without comments

VERSION=0.3
DATE=$(git log -1 --pretty=format:%ad)

COMMAND="./prepro.js -d '{ \"version\": $VERSION, \"date\": \"$DATE\" }' -d '$3' -i '$4' $2"

case $1 in
	commented)
		eval $COMMAND > $5
		;;
	stripped)
		eval "$COMMAND -c" > $5
		;;
esac
