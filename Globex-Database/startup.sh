#!/bin/bash
docker build . -t module-10

docker run -d -p 5432:5432 -e 'POSTGRES_PASSWORD=Password123!' --name module-10-container module-10

# Wait for the database to become available
docker exec -it module-10-container ./wait-for-it.sh localhost:5432 --timeout=30
docker exec -it module-10-container sleep 5s

docker exec -it module-10-container psql -U postgres -c "CREATE DATABASE globex WITH ENCODING 'UTF8'"
docker exec -it module-10-container psql -U postgres -d globex -a -f ./db_schema.sql
docker exec -it module-10-container psql -U postgres -d globex -a -f ./db_data.sql
