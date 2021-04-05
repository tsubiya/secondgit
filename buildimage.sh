
version=$BUILD_ID
docker build -t apprepo:$version .
aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 454957204982.dkr.ecr.us-east-2.amazonaws.com
docker tag apprepo:$version 454957204982.dkr.ecr.us-east-2.amazonaws.com/apprepo:$version
docker push 454957204982.dkr.ecr.us-east-2.amazonaws.com/apprepo:$version



echo "Image Successfully pushed to ecr"


