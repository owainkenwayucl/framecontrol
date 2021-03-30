#!/bin/bash

colours=""

case $1 in
"blueyellow")
  echo blue/yello
  colours="-c 000044,FFFF00"
  ;;
"bluewhite")
  echo blue/white
  colours="-c 000044,FFFFFF"
  ;;
"mono") 
  echo mono
  colours="-c 000000,FFFFFF"
  ;;
"blood") 
  echo blood
  colours="-c 000000,FF0000"
  ;;
*)
  echo default
  ;;
esac


tvcon $colours --BS localhost
