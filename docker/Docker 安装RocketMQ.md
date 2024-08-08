# Docker 安装RocketMQ
## 1. 2主2从部署
### 1.1. 查询 rocketmq 可用镜像版本
```text
curl https://registry.hub.docker.com/v1/repositories/mysql/tags | tr -d '[\[\]" ]' | tr '}' '\n'  awk -F: -v image='mysql' '{if(NR!=NF && $3 != ""){printf("%s:%s\n",image,$3)}}'
```
### 1.2. 编写 主1 Broker 配置文件
```text
brokerIP1 = 192.168.2.15
brokerClusterName = vsCluster
brokerName = master-broker-01
brokerId = 0
deleteWhen = 04
fileReservedTime = 48
brokerRole = ASYNC_MASTER
flushDiskType = ASYNC_FLUSH
```

### 1.3. 编写 主2 Broker 配置文件
```text
brokerIP1 =192.168.2.16
brokerClusterName = vsCluster
brokerName = master-broker-02
brokerId = 0
deleteWhen = 04
fileReservedTime = 48
brokerRole = ASYNC_MASTER
flushDiskType = ASYNC_FLUSH
```

### 1.4. 编写 从1 Broker 配置文件
```text
brokerIP1 = 192.168.2.17
brokerClusterName = vsCluster
brokerName = slave-broker-01
brokerId = 1
deleteWhen = 04
fileReservedTime = 48
brokerRole = SLAVE
flushDiskType = ASYNC_FLUSH
```

### 1.5. 编写 从2 Broker 配置文件
```text
brokerIP1 = 192.168.2.18
brokerClusterName = vsCluster
brokerName = slave-broker-02
brokerId = 1
deleteWhen = 04
fileReservedTime = 48
brokerRole = SLAVE
flushDiskType = ASYNC_FLUSH
```

### 1.6. 启动 主1 的NameSrv
```text
docker run --name="namesrv-master-01" -p 9876:9876 -e "JAVA_OPT_EXT=-server -Xms2g -Xmx2g -Xmn2g" -d  rocketmqinc/rocketmq-namesrv:4.5.0-alpine-uid
```

### 1.7. 启动 主2 的NameSrv
```text
docker run --name="namesrv-master-02" -p 9876:9876 -e "JAVA_OPT_EXT=-server -Xms2g -Xmx2g -Xmn2g" -d  rocketmqinc/rocketmq-namesrv:4.5.0-alpine-uid
```

### 1.8. 启动 主1 的Broker 
```text
docker run --name="broker-master-01" -p 10909:10909 -p 10911:10911 -e "JAVA_OPT_EXT=-server -Xms2g -Xmx2g -Xmn2g" -v /root/rocketmq/data:/root/store -v /root/rocketmq/logs:/root/logs -v /root/rocketmq/conf/broker.conf:/home/rocketmq/rocketmq-4.5.0/conf/broker.conf -e "NAMESRV_ADDR=192.168.2.15:9876;192.168.2.16:9876" -d rocketmqinc/rocketmq-broker:4.5.0-alpine-uid  sh mqbroker -c /home/rocketmq/rocketmq-4.5.0/conf/broker.conf
```

### 1.9. 启动 主2 的Broker 
```text
docker run --name="broker-master-02" -p 10909:10909 -p 10911:10911 -e "JAVA_OPT_EXT=-server -Xms2g -Xmx2g -Xmn2g"  -v /root/rocketmq/data:/root/store -v /root/rocketmq/logs:/root/logs -v /root/rocketmq/conf/broker.conf:/home/rocketmq/rocketmq-4.5.0/conf/broker.conf -e "NAMESRV_ADDR=192.168.2.15:9876;192.168.2.16:9876" -d rocketmqinc/rocketmq-broker:4.5.0-alpine-uid  sh mqbroker -c /home/rocketmq/rocketmq-4.5.0/conf/broker.conf
```

### 1.10. 启动 从1 的Broker 
```text
docker run --name="broker-slave-01"  -p 10909:10909 -p 10911:10911 -e "JAVA_OPT_EXT=-server -Xms2g -Xmx2g -Xmn2g"  -v /root/rocketmq/data:/root/store -v /root/rocketmq/logs:/root/logs -v /root/rocketmq/conf/broker.conf:/home/rocketmq/rocketmq-4.5.0/conf/broker.conf  -e "NAMESRV_ADDR=192.168.2.15:9876;192.168.2.16:9876" -d  rocketmqinc/rocketmq-broker:4.5.0-alpine-uid  sh mqbroker -c /home/rocketmq/rocketmq-4.5.0/conf/broker.conf
```

### 1.11. 启动 从2 的Broker 
```text
docker run --name="broker-slave-01"  -p 30909:10909 -p 30911:10911 -e "JAVA_OPT_EXT=-server -Xms2g -Xmx2g -Xmn2g"  -v /root/rocketmq/data:/root/store -v /root/rocketmq/logs:/root/logs -v /root/rocketmq/conf/broker.conf:/home/rocketmq/rocketmq-4.5.0/conf/broker.conf -e "NAMESRV_ADDR=192.168.2.15:9876;192.168.2.16:9876" -d  rocketmqinc/rocketmq-broker:4.5.0-alpine-uid  sh mqbroker -c /home/rocketmq/rocketmq-4.5.0/conf/broker.conf
```

## 2. 部署 rocketmq-console-ng
```text
docker run -d --name rmqconsole -p 28081:8080 -e "JAVA_OPTS=-Drocketmq.namesrv.addr=192.168.2.15:9876;192.168.2.16:9876 -Dcom.rocketmq.sendMessageWithVIPChannel=false" -t styletang/rocketmq-console-ng
```