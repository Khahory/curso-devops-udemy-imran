USR="devops"

for host in `cat remotehost`
do
        echo "########################"
        echo "Connecting to $host"
        scp multios_websetp.sh $USR@$host:/tmp/
        ssh $USR@$host sudo /tmp/multios_websetp.sh
        ssh $USR@$host sudo rm -rf /tmp/multios_websetp.sh
        echo "########################"
done