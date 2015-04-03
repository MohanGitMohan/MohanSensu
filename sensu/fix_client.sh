sed -i s/\"splunk_agents\",// /etc/sensu/conf.d/client.json
/etc/init.d/sensu-client restart
