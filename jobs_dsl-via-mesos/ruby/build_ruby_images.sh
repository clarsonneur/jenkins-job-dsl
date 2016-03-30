#!/bin/bash -ex
#

for i in 18 20 22
do
  bin/build.sh ruby$i registry.demos.fr:5000/demos
done
