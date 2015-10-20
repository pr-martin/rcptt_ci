#!/bin/bash
# Clones or Pulls from repos as appropriate.
clear
echo Simple Build and Test Script

curdir=$PWD
printf '%s\n' $curdir

if [ -d "regressionSuite" ]; then
   cd regressionSuite
   git pull
   cd ..
else
   git clone https://github.com/pr-martin/regressionSuite.git regressionSuite --branch master
fi

if [ -d "./osate2_workspace/smaccm" ]; then
   cd ./osate2_workspace/smaccm
   git pull
   cd ../..
else
   git clone https://github.com/smaccm/smaccm.git smaccm --branch develop
fi
