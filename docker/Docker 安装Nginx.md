# Docker 安装Nginx
## 1. 创建工作目录
```text
mkdir -p /root/nginx

mkdir -p /root/nginx/conf
mkdir -p /root/nginx/logs
mkdir -p /root/nginx/html
```

## 2. 启动Nginx 容器
```text
docker run --name nginx -p 9001:80 -d nginx
```

## 3. 复制容器内配置文件和项目路径
```text
# 将容器nginx.conf文件复制到宿主机
docker cp nginx:/etc/nginx/nginx.conf /root/nginx/conf/nginx.conf
# 将容器conf.d文件夹下内容复制到宿主机
docker cp nginx:/etc/nginx/conf.d /root/nginx/conf/conf.d
# 将容器中的html文件夹复制到宿主机
docker cp nginx:/usr/share/nginx/html /home/nginx/html
```

## 4. 删除Nginx 容器
```text
# 直接执行docker rm nginx或者以容器id方式关闭容器
# 找到nginx对应的容器id
docker ps -a
# 关闭该容器
docker stop nginx
# 删除该容器
docker rm nginx
 
# 删除正在运行的nginx容器
docker rm -f nginx
```

## 5. 重启启动Nginx 服务,挂载配置文件
```text
docker run \
-p 80:80  \
-p 443:443 \
-p 28080:28080 \
--name nginx \
-v /root/nginx/conf/nginx.conf:/etc/nginx/nginx.conf \
-v /root/nginx/conf/conf.d:/etc/nginx/conf.d \
-v /root/nginx/logs:/etc/nginx/logs \
-v /root/nginx/html:/usr/share/nginx/html \
-d nginx:latest
```