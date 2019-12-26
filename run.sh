#!/bin/bash

addressee='World'

while [ $# -gt 0 ]; do
  case "$1" in
    -h|--help)
      echo 'Options: [-a|--addressee <text>]'
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
    *)
      break
      ;;
  esac
done

echo "Hello $addressee!"
