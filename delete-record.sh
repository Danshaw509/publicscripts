## Script to delete a DNS record and associated PTR Record

#Identify DNS Record to Delete
hostnameorip=$1
if [ -z "$hostnameorip" ]
then
    echo ""
    read -p "Please enter DNS Record to delete (Hostname or IP Address)" hostnameorip
fi

#Remove all rows containing the inputted DNS Name/IP Address from Forward/Reverse Zones
sed -i "/$hostnameorip/d" /etc/bind/zones/example.com
sed -i "/$hostnameorip/d" /etc/bind/zones/10.0.0.0-reverse
sed -i "/$hostnameorip/d" /etc/bind/zones/10.0.4.0-reverse

#Trigger Bind Update Script
/etc/bind/scripts/deploy.sh