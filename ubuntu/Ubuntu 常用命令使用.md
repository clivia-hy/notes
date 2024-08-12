# Ubuntu 常用命令使用
## 1. 修改主机信息
```shell
vim  /etc/hostname
vim  /etc/hosts
```
## 2. 修改系统时间
```shell
保证同时修改 /etc/localtime  与 /etc/timezon

sudo cp /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime
sudo vim /etc/timezone --> Etc/UTC
sudo dpkg-reconfigure tzdate
```
## 3. 查看系统启动时间
```shell
uptime
或
who -b
或
last reboot
```

## 4. 查看系统版本
```text
lsb_release -a  
或 
cat /etc/redhat-release

查看方法：
1、用“uname －a”命令，可获取内核版本；
2、用“cat /proc/version”命令，可获取版本信息；
3、用“cat /etc/issue”或“cat /etc/redhat-release”命令，可获取发行版信息。
```
## 5. Sed 查找并替换文本
```text
sed -i "s/查找字段/替换字段/g" grep 查找字段 -rl 路径 文件名

-i 表示inplace edit，就地修改文件
-r 表示搜索子目录
-l 表示输出匹配的文件名
s表示替换，d表示删除
不需要排除去掉exclude就行
或者要排除多个目录 --exclude-dir={.git,res,bin}
或者排除一些指定后缀名的文件 比如排除扩展名为 java 和 js 的文件
--exclude=*.{java,js}

示例：
sed -i "s/shan/hua/g"  lishan.txt
```

## 6. 统计各类网络状态的连接数
```shell
netstat -antlp|awk '/tcp/ {print $6}'|sort|uniq -c
```

## 7. 查找系统大文件
```text
1. 查找大于100M 的文件
   sudo find / -type f -size +100M 

2. 列出根目录下最大的10个文件或目录
    sudo du -ah / | grep -v "/$" | sort -hr | head -n 10
    
3. 使用ncdu命令，ncdu是一个交互式的磁盘使用情况分析器，可以帮助您找到大文件和目录。
    sudo apt-get install ncdu 
    sudo ncdu / 
```

## 8. 扩展未使用的逻辑卷
```text
1. 查看磁盘使用情况
lsblk -l

2. 增大逻辑卷
sudo lvextend -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv && sudo resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv

3. 刷新磁盘
sudo resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv
```

## 9. 查看被系统kill 的进程
```shell
sudo egrep -i -r 'killed process' /var/log

或

dmesg -T
```