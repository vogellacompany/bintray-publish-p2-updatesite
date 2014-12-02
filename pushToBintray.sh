#!/bin/bash
#Sample Usage: pushToBintray.sh username apikey repo package version
API=https://api.bintray.com
BINTRAY_USER=$1
BINTRAY_API_KEY=$2
BINTRAY_REPO=$3
PCK_NAME=$4
PCK_VERSION=$5
function main() {
deploy_updatesite
}

function deploy_updatesite() {
echo "${BINTRAY_USER}"
echo "${BINTRAY_API_KEY}"
echo "${BINTRAY_REPO}"
echo "${PCK_NAME}"
echo "${PCK_VERSION}"

FILES=./*
PLUGINDIR=./plugins/*
FEATUREDIR=./features/*

for f in $FILES;
do
if [ ! -d $f ]; then
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  curl -X PUT -T $f -u ${BINTRAY_USER}:${BINTRAY_API_KEY} https://api.bintray.com/content/vogellacompany/${BINTRAY_REPO}/${PCK_NAME}/${PCK_VERSION}/$f;publish=1
  echo ""
fi
done

echo "Processing features dir $FEATUREDIR file..."
for f in $FEATUREDIR;
do
  echo "Processing feature: $f file..."
  curl -X PUT -T $f -u ${BINTRAY_USER}:${BINTRAY_API_KEY} https://api.bintray.com/content/vogellacompany/${BINTRAY_REPO}/${PCK_NAME}/${PCK_VERSION}/features/$f;publish=1
  echo ""
done

echo "Processing plugin dir $PLUGINDIR file..."

for f in $PLUGINDIR;
do
   # take action on each file. $f store current file name
  echo "Processing plugin: $f file..."
  curl -X PUT -T $f -u ${BINTRAY_USER}:${BINTRAY_API_KEY} https://api.bintray.com/content/vogellacompany/${BINTRAY_REPO}/${PCK_NAME}/${PCK_VERSION}/plugins/$f;publish=1
  echo ""
done

}

main "$@"
