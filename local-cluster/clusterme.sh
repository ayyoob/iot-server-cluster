#!/bin/sh

unzip wso2iots-1.0.0-SNAPSHOT.zip

#create http-gateway setup
cp -r wso2iots-1.0.0-SNAPSHOT http-gateway
rsync --recursive config/http-gateway/ http-gateway/


#create mqtt-gateway setup
cp -r wso2iots-1.0.0-SNAPSHOT mqtt-gateway
rsync --recursive config/mqtt-gateway/ mqtt-gateway/


#create das setup
cp -r wso2iots-1.0.0-SNAPSHOT das
rsync --recursive config/das/ das/

#create device-key-manager setup
cp -r wso2iots-1.0.0-SNAPSHOT device-key-manager
rsync --recursive config/device-key-manager/ device-key-manager/

#create device-type publisher-manager setup
cp -r wso2iots-1.0.0-SNAPSHOT devicetype-publisher
rsync --recursive config/devicetype-publisher/ devicetype-publisher/


#Deploy Samples.
cd devicetype-publisher
mvn clean install -f samples-deployer.xml
cd ..
cp config/virtual_firealarm/virtual_firealarm.jks devicetype-publisher/repository/resources/sketches/virtual_firealarm
cp config/virtual_firealarm/_VIRTUAL_FIREALARM_SCEP_.xml http-gateway/repository/deployment/server/synapse-configs/default/api/

cd devicetype-publisher/repository/deployment/server/carbonapps/
for z in *.car;
	do unzip $z -d tmp;
	startdirectory="tmp"
	searchterm="localhost:\${carbon.https.port}"
	replaceterm="http.gateway.iots:8245"
	i=0; 

		for file in $(grep -l -R $searchterm $startdirectory)
		do
		  sed -i -e "s/$searchterm/$replaceterm/g" $file 

		let i++;

		  echo "Modified: " $file
		done

	searchterm="\${mqtt.broker.host}:\${mqtt.broker.port}"
	replaceterm="mqtt.gateway.iots:1883"
	i=0; 

		for file in $(grep -l -R $searchterm $startdirectory)
		do
		  sed -i -e "s/$searchterm/$replaceterm/g" $file 

		let i++;

		  echo "Modified: " $file
		done

	rm $z
	zip -r $z $startdirectory
	cd tmp; 
	zip -r ../$z *
	cd ..
	rm -r tmp	
done
cd ../../../../../

cp -r devicetype-publisher/repository/deployment/server/carbonapps das/repository/deployment/server
cd devicetype-publisher/repository/conf/etc/
	startdirectory="device-mgt-plugins"
	searchterm="localhost:9443"
	replaceterm="http.gateway.iots:8245"
	for file in $(grep -l -R $searchterm $startdirectory)
	do
	  sed -i '' -e "s/$searchterm/$replaceterm/g" $file
	  echo "Modified: " $file
	done

	searchterm="localhost:1883"
	replaceterm="mqtt.gateway.iots:1883"

	for file in $(grep -l -R $searchterm $startdirectory) 
	do
	  sed -i '' -e "s/$searchterm/$replaceterm/g" $file
	  echo "Modified: " $file
	done

cd ../../../../

rm -r wso2iots-1.0.0-SNAPSHOT