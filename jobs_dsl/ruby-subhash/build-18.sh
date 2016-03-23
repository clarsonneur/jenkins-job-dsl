#!/bin/bash -xe
#

if [ "$http_proxy" != "" ]
then
   PROXY="-e http_proxy=$http_proxy -e https_proxy=$http_proxy"
fi
docker run $PROXY -v $(pwd):/src --rm -it registry.demos.fr:5000/demos/ruby:1.8 spec_local
