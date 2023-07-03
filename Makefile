
postgresinit:
  	sudo docker run  --name postgres15 -p 5433:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=passw
ord -d postgres
   
createdb:
sudo docker exec -it postgres15 createdb --username=root --owner=root go-chat


checkDb(created or not):
sudo docker exec -it postgres15 psql
root: \l   --- To check the db
exit 

dropdb:
	sudo docker exec -it postgres15 dropdb go-chat

migrateup:
migrate -path db/migrations -database "postgresql://root:password@localhost:5433/go-chat?sslmode=disable" -verbose up

migratedown:
migrate -path db/migrations -database "postgresql://root:password@localhost:5433/go-chat?sslmode=disable" -verbose down

AfterMigration:
sudo docker exec -it postgres15 psql
\l

\c go-chat
\d 
\d users

To check the image running 
docker ps 


.PHONY: postgresinit postgres createdb dropdb migrateup migratedown
