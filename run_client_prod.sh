#!/bin/bash

function remove_env_file {
	rm .env
	rm client/.env
}
pushd client
	cp prod.env .env
	trap remove_env_file EXIT
	npm run build
	npm run start
popd

