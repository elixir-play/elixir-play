
build:
	docker build --no-cache -t playground-elixir-1.8.1  --build-arg ELIXIR_VERSION=1.8.1 .

build_all:
	./bin/build_all

remove_images:
	docker images -q 'playground-elixir-*' | xargs docker rmi
