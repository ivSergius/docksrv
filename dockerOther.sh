echo Other commands

echo SSH Connect to oracle12c container
sudo docker exec -i -t $(docker ps -f ancestor=sath89/oracle-12c -q) /bin/bash
