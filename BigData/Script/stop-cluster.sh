#!/bin/bash
echo -e "\033[31m ===== Stoping The Cluster ====== \033[0m"
echo -e "\033[31m Stoping HBase Now !!! \033[0m"
/home/hbase/bin/stop-hbase.sh
echo -e "\033[31m Stoping Zeppelin Now !!! \033[0m"
/home/zeppelin/bin/zeppelin-daemon.sh stop
echo -e "\033[31m Stoping Spark Now !!! \033[0m"
/home/spark/sbin/stop-all.sh
echo -e "\033[31m Stopting Hadoop Now !!! \033[0m"
/home/hadoop/sbin/stop-all.sh
echo -e "\033[31m The Result Of The Command \"jps\" :  \033[0m"
jps
echo -e "\033[31m ======END======== \033[0m"
