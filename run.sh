#!/bin/bash

addressee='World'
greeting='Hello'

while [ $# -gt 0 ]; do
  case "$1" in
    -h|--help)
      echo 'Options: [-a|--addressee <text>] [-c|--christmas]'
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
    -c|--christmas)
      shift
      greeting='Merry Christmas'
    ;;
    *)
      break
      ;;
  esac
done

echo "$greeting $addressee!"
