#!/bin/bash

min=0
max=

while [ $# -gt 0 ]; do
  case $1 in
    -h|--help)
      echo 'Options: --max <int> [--min <int>]'
      exit 1
      ;;
    --min)
      shift
        min=$1
      shift
      ;;
    --max)
      shift
        max=$1
      shift
      ;;
    *)
      break
      ;; 	
  esac
done

if [ -z $max ]; then
  echo "max must be specified"
  exit 1
fi

if [ $min -gt $max ]; then
  echo "min cannot be greater than max"
  exit 1
fi

echo $(( $RANDOM % ($max - $min + 1) + $min ))
