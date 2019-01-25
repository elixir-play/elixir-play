DB_NAME=elixir_play_db
DB_PORT=5432

db_start:
	docker start ${DB_NAME}

db_new:
	docker run -p ${DB_PORT}:${DB_PORT} --name ${DB_NAME} -d -it postgres:latest

full_test:
	mix test
	mix credo --strict
	mix dialyzer
