#!/bin/bash

jdkTargz="/opt/openjdk-17.0.1_linux-x64_bin.tar.gz"

# 检查原先是否已配置java环境变量
checkExist(){
	jdk1=$(grep -n "export JAVA_HOME=.*" /etc/profile | cut -f1 -d':')
        if [ -n "$jdk1" ];then
                echo "JAVA_HOME已配置，删除内容"
                sed -i "${jdk1}d" /etc/profile
        fi
	jdk2=$(grep -n "export CLASSPATH=.*\$JAVA_HOME.*" /etc/profile | cut -f1 -d':')
        if [ -n "$jdk2" ];then
                echo "CLASSPATH路径已配置，删除内容"
                sed -i "${jdk2}d" /etc/profile
        fi
	jdk3=$(grep -n "export PATH=.*\$JAVA_HOME.*" /etc/profile | cut -f1 -d':')
        if [ -n "$jdk3" ];then
                echo "PATH-JAVA路径已配置，删除内容"
                sed -i "${jdk3}d" /etc/profile
        fi
}

# 查询是否有jdk.tar.gz
if [ -e $jdkTargz ];
then

echo "— — 存在jdk压缩包 — —"
	echo "正在解压jdk压缩包..."
	tar -zxvf /opt/openjdk-17.0.1_linux-x64_bin.tar.gz -C /opt
	if [ -e "/opt/install/java" ];then
		echo "存在该文件夹，删除..."
		rm -rf /opt/install/java
	fi
	echo "---------------------------------"
	echo "正在建立jdk文件路径..."
	echo "---------------------------------"
	mkdir -p /opt/install/java/
	mv /opt/jdk-17.0.1 /opt/install/java/java17
	# 检查配置信息
	checkExist	
	echo "---------------------------------"
	echo "正在配置jdk环境..."
	sed -i '$a export JAVA_HOME=/opt/install/java/java17' /etc/profile
	sed -i '$a export CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar' /etc/profile
	sed -i '$a export PATH=$PATH:$JAVA_HOME/bin' /etc/profile
	echo "---------------------------------"
	echo "JAVA环境配置已完成..."
	echo "---------------------------------"
    echo "正在重新加载配置文件..."
    echo "---------------------------------"
    source /etc/profile
    echo "配置版本信息如下："
    java -version
else
	echo "未检测到安装包，请将安装包放到/opt目录下"
fi

