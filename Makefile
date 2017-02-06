version ?= 0.13.2

.PHONY: all clean clean-all up
.SUFFIXES:

build: Dockerfile bitcoin
	docker build --tag bitcoin .

bitcoin: bitcoin.tar.gz
	mkdir -p $@
	tar -xzf $^ --strip-components=1 -C $@

bitcoin.tar.gz:
	curl -L -o $@ https://bitcoin.org/bin/bitcoin-core-${version}/bitcoin-${version}-x86_64-linux-gnu.tar.gz

clean:
	rm -rf bitcoin

clean-all: clean
	rm -rf bitcoin.tar.gz

up: all
	docker-compose up

