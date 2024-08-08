# Centos 7 升级libc.so.6
## 1. 升级libc.so.6
### 1.1. 查看libc.so.6库信息
```text
strings /lib64/libc.so.6 | grep GLIBC


```
### 1.2. 下载安装新版本
```text
curl -O http://ftp.gnu.org/gnu/glibc/glibc-2.18.tar.gz

tar zxf glibc-2.18.tar.gz 

cd glibc-2.18/

mkdir build

cd build/

../configure --prefix=/usr

make -j2

sudo make install
```
### 1.3. 再次检查 libc.so.6 信息
```text
strings /lib64/libc.so.6 | grep GLIBC
```

## 2. 升级libstdc++.so.6
### 2.1. 查看 libstdc++.so.6 库信息
```text
strings /lib64/libstdc++.so.6 | grep CXXABI

CXXABI_1.3
CXXABI_1.3.1
CXXABI_1.3.2
CXXABI_1.3.3
CXXABI_1.3.4
CXXABI_1.3.5
CXXABI_1.3.6
CXXABI_1.3.7
CXXABI_TM_1
```
### 2.2. 通过 yum 升级
```text
sudo yum update

sudo yum update libstdc++.so.6
```

### 2.3. 下载安装包升级
```text
#需要root
wget http://ftp.de.debian.org/debian/pool/main/g/gcc-8/libstdc++6_8.3.0-6_amd64.deb
ar -x libstdc++6_8.3.0-6_amd64.deb
tar -xvf data.tar.xz
cp usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25 /usr/lib64/
find / -name "libstdc++*"
rm /usr/lib64/libstdc++.so.6
ll /usr/lib64/libstd*
ln -s /usr/lib64/libstdc++.so.6.0.25 /usr/lib64/libstdc++.so.6



再次查看 libstdc++.so.6 链接库信息

strings /lib64/libstdc++.so.6 | grep CXXABI

CXXABI_1.3
CXXABI_1.3.1
CXXABI_1.3.2
CXXABI_1.3.3
CXXABI_1.3.4
CXXABI_1.3.5
CXXABI_1.3.6
CXXABI_1.3.7
CXXABI_1.3.8
CXXABI_1.3.9
CXXABI_1.3.10
CXXABI_1.3.11
CXXABI_TM_1
CXXABI_FLOAT128
```