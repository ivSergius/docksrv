echo #Docker RUN script comments

echo #make dir
mkdir /my
sudo chmod -R 777 /my/
mkdir /my/oracle12c
mkdir /my/tomcat
mkdir /my/tomcat/webapps
mkdir /my/tomcat2
mkdir /my/tomcat2/webapps

echo #rep: https://hub.docker.com/r/sath89/oracle-12c/
docker run -d --name oracle12c -p 8080:8080 -p 1521:1521 -v /my/oracle12c/data:/u01/app/oracle -e DBCA_TOTAL_MEMORY=1024 --name=oracle12c sath89/oracle-12c

echo #Start Tomcat
docker run -d --name tomcat -p 8888:8080 -v /my/tomcat/webapps:/usr/local/tomcat/webapps tomcat
docker run -d --name tomcat2 -p 8889:8080 -v /my/tomcat2/webapps:/usr/local/tomcat/webapps tomcat

#docker run -d --name tomcat -p 8888:8080 -v /my/tomcat/webapps:/usr/local/tomcat/webapps-v $HOME/tomcat/tomcat-users.xml:/usr/local/tomcat/conf/tomcat-users.xml:ro tomcat

echo # Deploy wars to tomcat

curl https://tomcat.apache.org/tomcat-6.0-doc/appdev/sample/sample.war >/my/tomcat/webapps/sample.war
curl https://raw.githubusercontent.com/ivSergius/docksrv/master/res/testdb.war >/my/tomcat/webapps/testdb.war
curl https://raw.githubusercontent.com/ivSergius/docksrv/master/res/testdb.war >/my/tomcat2/webapps/testdb.war

echo #sftp
docker run -v /my:/home/foo/share -p 11022:22 -d atmoz/sftp foo:123:1001

echo #Start Google cAdvisor on 80 - Docker simple monitor
docker run -d --name=cadvisor -p 80:8080  --volume=/:/rootfs:ro --volume=/var/run:/var/run:rw  --volume=/sys:/sys:ro --volume=/var/lib/docker/:/var/lib/docker:ro google/cadvisor:latest

echo #Connect to logs sath89/oracle-12c
docker logs -f $(docker ps -f ancestor=sath89/oracle-12c -q)
