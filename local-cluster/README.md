# iot-server-cluster - Simple Cluster

1) Place the IoT Pack in the localcluster directory and execute clusterme.sh

2) Execute IoTS.sql script

3) Set below to /etc/hosts
IP     mqtt.gateway.iots
IP     http.gateway.iots
IP     key.mgt.iots
IP     das.iots
IP     mgt.devicemgt.iots
IP     db.iots

4) Create a database user with below credential or update the datasources.
user - root
password - 123