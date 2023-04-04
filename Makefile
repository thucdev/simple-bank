postgres:
	docker run --name simple-bank -p 4001:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres

createdb:
	docker exec -it simple-bank createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it simple-bank dropdb simple_bank

migrateup:
	 migrate -path db/migration -database "postgresql://root:secret@localhost:4001/simple_bank?sslmode=disable" -verbose up

migratedown:
	 migrate -path db/migration -database "postgresql://root:secret@localhost:4001/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

# test:
#  	go test -v -cover ./...


.PHONY: postgres createdb dropdb migrateup migratedown sqlc test
