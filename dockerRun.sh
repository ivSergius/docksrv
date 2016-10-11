echo #Docker RUN script comments

echo #rep: https://hub.docker.com/r/sath89/oracle-12c/
docker run -d --name oracle12c -p 8080:8080 -p 1521:1521 -v /my/oracle12c/data:/u01/app/oracle -e DBCA_TOTAL_MEMORY=1024 --name=oracle12c sath89/oracle-12c

echo #Start Tomcat
docker run -d --name tomcat -p 8888:8080 -v /my/tomcat/webapps:/usr/local/tomcat/webapps tomcat

#docker run -d --name tomcat -p 8888:8080 -v /my/tomcat/webapps:/usr/local/tomcat/webapps-v $HOME/tomcat/tomcat-users.xml:/usr/local/tomcat/conf/tomcat-users.xml:ro tomcat

echo # Deploy war to tomcat
curl https://tomcat.apache.org/tomcat-6.0-doc/appdev/sample/sample.war >/my/tomcat/webapps/sample.war

echo #Start Google cAdvisor on 80 - Docker simple monitor
docker run -d --name=cadvisor -p 80:8080  --volume=/:/rootfs:ro --volume=/var/run:/var/run:rw  --volume=/sys:/sys:ro --volume=/var/lib/docker/:/var/lib/docker:ro google/cadvisor:latest

echo #Connect to logs sath89/oracle-12c
docker logs -f $(docker ps -f ancestor=sath89/oracle-12c -q)
