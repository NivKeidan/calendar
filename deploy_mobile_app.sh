#!/bin/bash

echo "connect phone to USB, make sure debuggig is on and phone is not just charging"
read -r -s -p $'Press enter to continue or CTRL+C to cancel...'

pushd mobile
	cd myapp
	echo "this requires few env vars to be set: CALENDAR_SERVER, CALENDAR_USER, CALENDAR_PASSWORD, KEYSTORE_PW, ANDROID_KEYSTORE"
	read -r -s -p $'Press enter to continue or CTRL+C to cancel...'
	../node_modules/.bin/tns deploy android --env.server_address="$CALENDAR_SERVER" --env.username="$CALENDAR_USER" --env.password="$CALENDAR_PASSWORD" --release --key-store-path "$ANDROID_KEYSTORE" --key-store-password "$KEYSTORE_PW" --key-store-alias cheeky --key-store-alias-password "$KEYSTORE_PW"
