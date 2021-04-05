
version=$BUILD_ID
docker build -t apprepo:$version .
aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 454957204982.dkr.ecr.us-east-2.amazonaws.com
docker tag apprepo:$version 454957204982.dkr.ecr.us-east-2.amazonaws.com/apprepo:$version
docker push 454957204982.dkr.ecr.us-east-2.amazonaws.com/apprepo:$version



echo "Image Successfully pushed to ecr"




#Create new task definition with new version of buildnumber







sed -i s#202714190885.dkr.ecr.us-east-2.amazonaws.com/apprepo:20#202714190885.dkr.ecr.us-east-2.amazonaws.com/apprepo:$version#g taskdef.json


aws ecs register-task-definition  --cli-input-json  file://taskdef.json --region us-east-2







echo "New task revision created"




