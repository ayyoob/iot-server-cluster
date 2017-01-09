#!/bin/sh

unzip wso2iot-3.0.0-SNAPSHOT.zip

#create mqtt-gateway setup
cp -r wso2iot-3.0.0-SNAPSHOT/broker mqtt-gateway
rsync --recursive config/mqtt-gateway/ mqtt-gateway/

#create device-key-manager setup
cp -r wso2iot-3.0.0-SNAPSHOT/core device-key-manager
rsync --recursive config/device-key-manager/ device-key-manager/

#create http-gateway setup
cp -r wso2iot-3.0.0-SNAPSHOT/core http-gateway
rsync --recursive config/http-gateway/ http-gateway/

#create das setup
cp -r wso2iot-3.0.0-SNAPSHOT/analytics analytics
rsync --recursive config/das/ analytics/

#create device-type publisher-manager setup
cp -r wso2iot-3.0.0-SNAPSHOT/core core
rsync --recursive config/devicetype-publisher/ core/

cp -r wso2iot-3.0.0-SNAPSHOT/plugins plugins

#Deploy Samples.
cd devicetype-publisher
mvn clean install -f plugins/plugins-deployer.xml

mv core devicetype-publisher

rm -r wso2iot-3.0.0-SNAPSHOT