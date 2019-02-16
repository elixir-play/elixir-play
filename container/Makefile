
build:
	docker build --no-cache -t playground-elixir-1.8.1  --build-arg ELIXIR_VERSION=1.8.1 .

build_all:
	./bin/build_all

build_master:
	docker build --no-cache -t playground-elixir-master master/.

remove_images:
	docker images -q 'playground-elixir-*' | xargs docker rmi
