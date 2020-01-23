#!/usr/bin/env bash

echo "Run the following statement originally to get docker login:"
echo "$ aws ecr get-login --region us-east-2"
echo "Then paste those results into the terminal (excluding: '-e none'"
echo "Restart and do that if you have not already"

echo "Enter your account id: "
read AWS_ACCOUNT_ID

echo "Listing all local docker images: "
docker images
printf "\n"

echo "Enter the image that you would like to push: "
read IMAGE

echo "Enter the image ID: "
read IMAGE_ID

echo "Enter the image tag: "
read TAG

docker tag ${IMAGE_ID} ${AWS_ACCOUNT_ID}.dkr.ecr.us-east-2.amazonaws.com/${IMAGE}


aws ecr describe-repositories --repository-names ${IMAGE} || aws ecr create-repository --repository-name ${IMAGE}

docker push ${AWS_ACCOUNT_ID}.dkr.ecr.us-east-2.amazonaws.com/${IMAGE}

