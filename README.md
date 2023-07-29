# JDK-Install.sh
没什么可说的，就是简简单单安装使用源码JDK的脚本。懒人福音，只要服务器有外网，（没网也可以使用离线版，只要下载好了对应的Tar包）。适用于大部分Linux系统（应该吧，其实只试Cent OS7，完全没问题）
# 目录及文件说明
| 目录名称 | 中文意义 |
| :----: | :----: | 
Online Scripts | 在线版脚本 
Offline scripts| 离线版脚本 
Resource|资源目录（存放Tar包的，使用离线版得先从这个里面下载对应的Tar包）

| 文件名称 | 中文意义 |
| :----: | :----: | 
Install-JDKxx-Offline.sh|离线版脚本
Install-JDKxx-Github.sh|在线版脚本（Github源，国内访问可能不稳定）
Install-JDKxx-INJDK.sh|在线版脚本（INJDK源，国内专属，经作者测试下载速度可达5MB/S，地址:https://www.injdk.cn ）
# 如何使用？
以下示例都按你有root权限的情况下来操作的（应该我写的这句话是废话吧，希望吧）没有root权限请使用"sudo"或使用"sudo -i"、"sudo su"、"su root"（四选一，选一个你最喜欢的进行操作）
## 在线版
非常简单，直接wget即可
```Linux
wget https://github.com/wolfblade2006/Install-JDK.sh/install_jdkxx（JDK版本）-xx(你选择的在线源).sh && sh install_jdkxx-xx.sh
```
## 离线版
更简单，将脚本和与之匹配的Tar包下载下来后放置在/opt目录然后执行以下命令即可（**注意：一定要下对Tar包的版本！！！否则程序会报错！**）
```Linux
bash Install-JDKxx.sh
```
