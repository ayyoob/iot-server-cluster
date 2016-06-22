#!/bin/sh

unzip wso2iots-1.0.0-SNAPSHOT.zip

#create http-gateway setup
cp -r wso2iots-1.0.0-SNAPSHOT http-gateway
ditto -V config/http-gateway http-gateway


#create mqtt-gateway setup
cp -r wso2iots-1.0.0-SNAPSHOT mqtt-gateway
ditto -V config/mqtt-gateway mqtt-gateway


#create das setup
cp -r wso2iots-1.0.0-SNAPSHOT das
ditto -V config/das das

#create device-key-manager setup
cp -r wso2iots-1.0.0-SNAPSHOT device-key-manager
ditto -V config/device-key-manager device-key-manager

#create device-key-manager setup
cp -r wso2iots-1.0.0-SNAPSHOT devicetype-publisher
ditto -V config/devicetype-publisher devicetype-publisher