#!/bin/bash
echo "docker-compose coming soon ..."
docker run --name "wildfly-modules-$BUILD_TAG" --detach \
  -u $(id -u jenkins):$(id -g jenkins) \
  -v "$WORKSPACE/vnfm-ear/target/vnfm-ear-1.0.0.ear:/opt/jboss/wildfly/standalone/deployments/vnfm.ear" \
  -v "$WORKSPACE/vnfm-thirdparty-packaging/vnfm-thirdparty-modules/target:/opt/VNFM/hpoc-vnfm-engine/modules" ktm04.gre.hpecorp.net:5000/vnfm/wildfly-modules

#sleep 30
env | sort

typeset -i iwait=0
while true
do
  docker logs "wildfly-modules-$BUILD_TAG" | grep -E "Started [0-9]+ of [0-9]+ services"
  (( $? == 0 )) && break
  sleep 5
  (( iwait++ ))
  (( iwait > 20 )) && exit 1
done

VNFM_TS_DIR="$WORKSPACE/vnfm-tests/src/main"
VNFM_TS_TGT=/test

docker run -v "$VNFM_TS_DIR:$VNFM_TS_TGT" \
  -v "$WORKSPACE/reports/:/reports/" \
  --name "newman-$BUILD_TAG" \
  --rm \
  -u $(id -u jenkins):$(id -g jenkins) \
  --link wildfly-modules-$BUILD_TAG:wildfly \
  postman/newman_ubuntu1404 \
  --collection "$VNFM_TS_TGT/test/jaxrs/TestSuite-VNFM-wadl.json.postman_collection" \
  --environment "$VNFM_TS_TGT/resources/VNFM.postman_environment" \
  --testReportFile="/reports/newman-report.xml"


docker rm -f wildfly-modules-$BUILD_TAG

