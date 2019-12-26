#!/bin/bash

greeting='World'

while [ $# -gt 1 ]; do
  case "$1" in
    -g|--greeting)
      shift
      greeting=$1
      shift
      ;;
    *)
      break
      ;;
  esac
done

echo "Hello $greeting!"
