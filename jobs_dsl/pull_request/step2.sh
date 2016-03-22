docker run -t --rm -u $(id -u jenkins):$(id -g jenkins) \
  -v "$WORKSPACE":/var/vnfm-build -w /var/vnfm-build vnfm/maven mvn -B clean install 
