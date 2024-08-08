# Centos 7 防火墙配置

## 1. 查看是否启用防火墙
```text
systemctl status firewalld
或
sudo firewall-cmd --state
或
ps -ef | grep firewalld
```

## 2. 查看开放端口
```text
sudo firewall-cmd --list-ports
```

## 3. 开放端口
```text
sudo firewall-cmd --zone=public --add-port=3306/tcp --permanent
```

## 4. 重启防火墙
```text
sudo firewall-cmd --reload
```