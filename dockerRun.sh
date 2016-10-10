echo Docker RUN script comments
echo rep: https://hub.docker.com/r/sath89/oracle-12c/
docker run -d -p 8080:8080 -p 1521:1521 -v /my/oracle12c/data:/u01/app/oracle -e DBCA_TOTAL_MEMORY=1024 --name=oracle12c sath89/oracle-12c

echo Connect to logs sath89/oracle-12c
docker logs -f $(docker ps -f ancestor=sath89/oracle-12c -q)
