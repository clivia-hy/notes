# Docker安装
官网地址： https://docker.p2hp.com/index.html

## 1.Windows环境安装
```text
1. 下载Windows版安装程序，双击安装
```

## 2.ubuntu环境安装
### 2.1 ubuntu在线安装
```text
1. Docker 官方镜像源：

sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin


2. 阿里云镜像源：

sudo apt-get update

sudo apt-get install ca-certificates curl gnupg lsb-release

sudo mkdir -p /etc/apt/keyrings

curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] http://mirrors.aliyun.com/docker-ce/linux/ubuntu/ $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

### 2.2 ubuntu离线安装
```text
1. 在一台联网的设备上下载docker安装包
   sudo apt-get update
   sudo apt-get install -y docker.io
   安装包位置： /var/cache/apt/archives/
   相关的安装包有： 
      bridge-utils_1.5-15ubuntu1_amd64.deb
      containerd_1.6.12-0ubuntu1~18.04.1_amd64.deb
      docker.io_20.10.21-0ubuntu1~18.04.3_amd64.deb
      pigz_2.4-1_amd64.deb
      runc_1.1.4-0ubuntu1~18.04.2_amd64.deb
      ubuntu-fan_0.12.10_all.deb
      
2. 将安装包拷贝到离线机器上，使用 dpkg 进行安装
	  sudo dpkg -i runc_1.1.4-0ubuntu1~18.04.2_amd64.deb
	  sudo dpkg -i containerd_1.6.12-0ubuntu1~18.04.1_amd64.deb
	  sudo dpkg -i docker.io_20.10.21-0ubuntu1~18.04.3_amd64.deb
	  sudo dpkg -i bridge-utils_1.5-15ubuntu1_amd64.deb
	  sudo dpkg -i pigz_2.4-1_amd64.deb
	  sudo dpkg -i ubuntu-fan_0.12.10_all.deb
	    
3. 将当前用户添加到 docker 分组
	  sudo groupadd docker
      sudo usermod -aG docker $USER
      

4. dpkg 卸载已安装的软件包
	  sudo dpkg -r 包名     // 移除软件包
	  sudo dpkg -P 包名     // 清除相关配置文件
	  sudo apt-get autoremove  //清除相关依赖
	  sudo apt-get autoclean   // 清除缓存
		   
	 示例： 
	  sudo dpkg -r docker.io
	  sudo dpkg -P docker.io
      sudo apt-get autoremove
      sudo apt-get autoclean
```

## 3.Centos环境安装
### Centos 在线安装
```text
1. 卸载已安装docker 
  sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

2. 更新 yum 源
	sudo yum install -y yum-utils
	sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo


3. 安装最新版本 docker Engine
		sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

4. 启动docker
    sudo systemctl start docker

5. 测试
   docker run hello-world
```

### Centos 离线安装
```text
1. 安装 yum-utils 工具， 该工具提供yumdownloader 下载工具
	sudo yum install -y yum-utils
   
2. 更新 yum 镜像源信息
	sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

3. 下载docker-ce 安装包(依赖安装包会自动下载)
	yumdownloader --resolve docker-ce

4. 拷贝安装包到离线机器

5. 进入安装包目录，通过 rpm 命令安装docker
	sudo rpm -ivh *.rpm
	
6. 添加用户到 docker 分组
  sudo groupadd docker
  sudo usermod -aG docker $USER
```