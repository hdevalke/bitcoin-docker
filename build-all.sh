#!/bin/bash
make
for i in alice bob carol dan
do
	docker build -t bitcoin:$i --build-arg user=$i .
done
