#!/bin/bash

function remove_env_file {
	rm .env
}
pushd server
	echo "backing up entries"
	cp entries.json bkp.entries.json
	cp dev.env .env
	trap remove_env_file EXIT
	node src/server.js
popd

