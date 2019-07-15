#!/bin/bash
echo -e "\033[31m ========Start The Cluster======== \033[0m"
echo -e "\033[31m Starting Hadoop Now !!! \033[0m"
/home/hadoop/sbin/start-all.sh
echo -e "\033[31m Starting Spark Now !!! \033[0m"
/home/spark/sbin/start-all.sh
echo -e "\033[31m Starting Zeppelin Now !!! \033[0m"
/home/zeppelin/bin/zeppelin-daemon.sh start
echo -e "\033[31m Starting HBase Now !!! \033[0m"
/home/hbase/bin/start-hbase.sh
echo -e "\033[31m The Result Of The Command \"jps\" :  \033[0m"
jps
echo -e "\033[31m ========END======== \033[0m"
