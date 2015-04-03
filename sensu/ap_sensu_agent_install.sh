yum -y install bc
yum -y install nc
rpm -i sensu-0.16.0-1.x86_64.rpm
mkdir -p /etc/sensu/ssl
cp /root/sensu/ssl/* /etc/sensu/ssl/.
cp -f /root/sensu/conf.d/* /etc/sensu/conf.d/.
cp -f /root/sensu/plugins/* /etc/sensu/plugins/.
cp -f /root/sensu/etc_default_sensu /etc/default/sensu
ipaddr=`ifconfig -a | grep "inet addr" | grep Bcast | awk '{print $2}' | sed s/addr://`
host_name=`hostname`
sed -i s/sacentos/$host_name/ /etc/sensu/conf.d/client.json
sed -i s//$host_name/ /etc/sensu/conf.d/client.json
sed -i s/162.150.5.163/$ipaddr/ /etc/sensu/conf.d/client.json
sed -i s/\"test\",/\"antipiracy_servers\",\"splunk_agents\",/ /etc/sensu/conf.d/client.json
usermod -G wheel sensu
visudo
#sensu ALL=(ALL) NOPASSWD: ALL
/etc/init.d/sensu-client restart
chkconfig sensu-client on
tail /var/log/sensu/sensu-client.log
