#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
SCRIPTPATH+="/xml/website.xml"

rm $SCRIPTPATH

javac Transformer1.java
java Transformer1 xml/site2website.xsl xml/site.xml xml/website.xml
