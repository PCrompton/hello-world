#!/bin/bash

addressee='World'

while [ $# -gt 1 ]; do
  case "$1" in
    -a|--addressee)
      shift
      addressee=$1
      shift
      ;;
    *)
      break
      ;;
  esac
done

echo "Hello $addressee!"
