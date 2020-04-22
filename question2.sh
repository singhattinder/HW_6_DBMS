#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
SCRIPTPATH+="/xml/website.html"

rm $SCRIPTPATH


javac Transformer1.java
java Transformer1  xml/websiteXml2Html.xsl  xml/website.xml  xml/website.html
