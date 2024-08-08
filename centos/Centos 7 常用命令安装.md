# Centos 7 常用命令安装
## 1. 安装 lsof
```shell
sudo yum -y install lsof
```

## 2. 安装 lsblk
```shell
sudo yum -y install util-linux-ng
```

## 3. 安装 lspci
```shell
sudo yum update

sudo yum provides lspci

sudo yum install -y pciutils
```

## 4. 安装 ping
```shell
sudo yum install -y iputils
```