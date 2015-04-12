if [ -z "$1" ];
	then echo 'Usage: ./transform-file.sh [filename.yml]';
else \
	appname=${1%%.*};
	mkdir -p ./output/${appname} && \
	mkdir -p ./input && \
	cp ${1} ./input/ && \
	docker run -i --rm \
		-e APP_NAME=${appname} \
		-e FIG_YAML=/input/${1} \
		-e OUTPUT_DIRECTORY=/output/${appname} \
		-v $(pwd)/input:/input \
		-v $(pwd)/output:/output \
		fig2coreos && \
	echo "Now cd to ./output/${appname}" ' and run `fleetctl start *`';
fi
