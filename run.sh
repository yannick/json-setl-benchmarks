#!/usr/bin/env sh
for proj in $(ls b1) 
do 
echo "building $proj"
cd b1/$proj
./build.sh
echo "running $proj"
for i in $(seq 20); do cat ../../companies.json; done | time ./filter | wc -l
cd ../..
done