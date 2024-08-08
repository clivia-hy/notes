# Docker 安装Redis服务
## 1. Redis 单节点部署
### 1.1. 准备挂载目录
```text
mkdir -p /root/redis

mkdir -p /root/redis/data
```
### 1.2. 准备配置文件( /root/redis/redis.conf)
```text
bind 0.0.0.0

requirepass abcdef

notify-keyspace-events "Ex"
```

### 1.3. 运行 redis 镜像
```text
docker run --restart=always --log-opt max-size=100m --log-opt max-file=5 -p 13007:6379 --name redis -v /root/redis/redis.conf:/etc/redis/redis.conf -v /root/redis/data:/data -d redis:6.2.4 redis-server /etc/redis/redis.conf --appendonly yes
```

## 2. Redis 集群部署

## 3. Redis 可视化管理工具
```text
docker run -d --name redis-mgr -e REDIS_1_HOST=192.168.1.15:13007 -e REDIS_1_NAME=redis -e REDIS_1_AUTH=cliviaCpDb -p 13008:80 erikdubbelboer/phpredisadmin

访问：
http://xx.xx.xx.xx:13008
```
