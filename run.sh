#!/bin/bash

NEW_YEAR_GREETING='Happy New Year'
VALINTINES_GREETING='Happy Valintines Day'
INDEPENDANCE_DAY_GREETING='Happy Independance Day'
THANKSGIVING_GREETING='Happy Thanksgiving'
CHRISTMAS_GREETING='Merry Christmas'

addressee='World'

get_greeting () {
  case $1 in
    1)
      greeting=$NEW_YEAR_GREETING
      ;;
    2)
      greeting=$VALINTINES_GREETING
      ;;
    7)
      greeting=$INDEPENDANCE_DAY_GREETING
      ;;
    11)
      greeting=$THANKSGIVING_GREETING
      ;;
    12)
      greeting=$CHRISTMAS_GREETING
      ;;
    *)
      greeting='Hello'
      ;;
  esac
  echo $greeting
}

current_month=$(date +%m)
greeting=$(get_greeting $current_month)

while [ $# -gt 0 ]; do
  case "$1" in
    -h|--help)
      echo 'Options: [-a|--addressee <text>] [-m|--month <int>]'
      exit 1
      ;;
    -a|--addressee)
      shift
      if [ -z $1 ]; then
        echo "No addressee provided"
        exit 1
      fi
      addressee=$1
      shift
      ;;
    -m|--month)
      shift
      if [ -z $1 ]; then
        echo "No month provided"
        exit 1
      fi
      greeting=$(get_greeting $1)
      shift
      ;;
    *)
      break
      ;;
  esac
done

echo "$greeting $addressee!"
