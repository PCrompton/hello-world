#!/bin/bash

if [ $# -eq 0 ]; then
  echo "No options specified"
  echo "Use -h|--help to see options"
  exit 1
fi

while [ $# -gt 0 ]; do
  case $1 in
    -h|--help)
      echo 'Options: --min <int> --max <int> -i|--iterations <int>'
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
    -i|--iterations)
      shift
        iterations=$1
      shift
      ;;
    *)
      break
      ;;
  esac
done

if [ -z $min ]; then
  echo "--min must be included"
  exit 1
fi

if [ -z $max ]; then
  echo "--max must be included"
  exit 1
fi

if [ -z $iterations ]; then
  echo "-i|--iterations must be included"
  exit 1
fi

if [ $min -gt $max ]; then
  echo "min cannot be greater than max"
  exit 1
fi

if [ $iterations -lt 1 ]; then
  echo "-i|--iterations cannot be less than 1"
fi

test () {
  for (( i=1; i<=$iterations; i++ )) do
    echo $(./random.sh --min $min --max $max)
  done
}

echo "Count Result"
test | sort -n | uniq -c
