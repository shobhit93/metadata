#!/bin/bash
set -xe

echo "Enter the platform (aws, azure, gcp)"
read platform
if [ "$platform" == "aws" ]
then
	curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document | tee metadata.json
elif [ "$platform" == "azure" ]
then
	curl -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2020-06-01" | tee metadata.json
elif [ "$platform" == "azure" ]
then
	curl "http://metadata.google.internal/computeMetadata/v1/instance/description" -H "Metadata-Flavor: Google" | tee metadata.json
else
	echo "enter valid option (aws, azure, gcp)"
fi
