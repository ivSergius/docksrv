echo 
echo Update system
sudo apt-get update

echo 
echo Install MC
sudo apt-get install -y mc

echo 
echo Pull nginx
docker pull nginx

echo 
echo Pull tomcat
docker pull tomcat

echo 
echo Pull ora11
docker pull sath89/oracle-xe-11g

echo 
echo Pull ora12
docker pull sath89/oracle-12c
