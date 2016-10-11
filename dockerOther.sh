echo Other commands

echo SSH Connect to oracle12c container
sudo docker exec -i -t $(docker ps -f ancestor=sath89/oracle-12c -q) /bin/bash

echo SSH connet to tomcat
sudo docker exec -i -t $(docker ps -f ancestor=tomcat -q) /bin/bash

echo Start Google cAdvisor on 80 - Docker simple monitor
docker run --volume=/:/rootfs:ro --volume=/var/run:/var/run:rw  --volume=/sys:/sys:ro --volume=/var/lib/docker/:/var/lib/docker:ro --publish=80:8080 --detach=true --name=cadvisor google/cadvisor:latest

echo Stop Google cAdvisor
docker stop $(docker ps -a -f ancestor=google/cadvisor -q) && docker rm $(docker ps -a -f ancestor=google/cadvisor -q)
