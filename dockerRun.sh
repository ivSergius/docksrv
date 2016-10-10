echo Docker RUN script comments
echo rep: https://hub.docker.com/r/sath89/oracle-12c/
docker run -d -p 8080:8080 -p 1521:1521 -v /my/oracle12c/data:/u01/app/oracle -e DBCA_TOTAL_MEMORY=1024 sath89/oracle-12c
