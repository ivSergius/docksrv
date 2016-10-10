echo Update system
apt-get update

echo Install MC
apt-get install -y mc

echo Pull nginx
docker pull nginx

echo Pull tomcat
docker pull tomcat

echo Pull ora11
docker pull sath89/oracle-xe-11g

echo Pull ora12
docker pull sath89/oracle-12c
