#!/bin/bash

function remove_env_file {
	rm .env
}
pushd client
	if [ "$1" == "--prod" ]; then
		echo "using prod env"
		cp prod.env .env
	else
		cp dev.env .env
	fi
	trap remove_env_file EXIT
	npm run dev
popd

