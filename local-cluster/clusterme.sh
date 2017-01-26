#!/bin/sh

unzip wso2iot-3.1.0-SNAPSHOT.zip

#create mqtt-gateway setup
cp -r wso2iot-3.1.0-SNAPSHOT/broker mqtt-gateway
rsync --recursive config/mqtt-gateway/ mqtt-gateway/

#create device-key-manager setup
cp -r wso2iot-3.1.0-SNAPSHOT/core device-key-manager
rsync --recursive config/device-key-manager/ device-key-manager/

#create http-gateway setup
cp -r wso2iot-3.1.0-SNAPSHOT/core http-gateway
rsync --recursive config/http-gateway/ http-gateway/

#create das setup
cp -r wso2iot-3.1.0-SNAPSHOT/analytics analytics
rsync --recursive config/das/ analytics/

#create device-type publisher-manager setup
cp -r wso2iot-3.1.0-SNAPSHOT/core core

cp -r wso2iot-3.1.0-SNAPSHOT/plugins plugins

#Deploy Samples.
mvn clean install -f plugins/plugins-deployer.xml

cp -r core device-manager

mv core device-backend

rsync --recursive config/devicetype-publisher/ device-manager/
rsync --recursive config/devicetype-backend/ device-backend/

rm -r wso2iot-3.1.0-SNAPSHOT