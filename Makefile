all:
	docker build --platform linux/amd64 -t karlma/sipp:3.7.1  .

run:
	docker run --platform linux/amd64 -it --rm karlma/sipp:3.7.1 /bin/bash

uas:
	docker run --platform linux/amd64 -it --rm karlma/sipp:3.7.1 -sn uas
