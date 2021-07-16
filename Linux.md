# 1. Linux基础

主要以ubuntu为主的技能积累

##　安装

本次安装以U盘安装为例，需要工具如下，
1. Ubuntu安装包镜像：[Ubuntu 20.04.2.0 LTS](https://ubuntu.com/download/desktop)，建议使用迅雷下载。
2. U盘一个，最好是8G以上
3. 启动u盘制作工具：[Rufus](http://rufus.ie/zh/)

### 制作U盘启动盘

[Create a bootable USB stick on Windows](https://ubuntu.com/tutorials/create-a-usb-stick-on-windows#1-overview)

###　系统安装

[Install Ubuntu desktop](https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview)

## 常用命令行

```powershell
tldr
```

## 1.1. 系统检测


### 查看系统硬件信息

```powershell
# CPU
lscpu
cat /proc/cpuinfo

# memory
free -m
cat /proc/meminfo
dmidecode -t memory

# 磁盘
lsblk
fdisk -l

# 网卡
lspci | grep -i 'eth'
ifconfig -a

# pci信息-主板上所有硬件槽信息
lspci

# usb信息
lsusb
```
### 查看进程

`htop`

### 查看磁盘使用率

du

```bash
$ df -h
# linux系统以磁盘分区为单位查看文件系统，可以加上参数查看磁盘剩余空间信息
/dev/sda5       1.1T  383G  660G  37% /

```

`ncdu` 
```powershell
ncdu
```
### 1.1.1. 实时检测

```powershell
htop # 界面比top更加好
sar -r 2 300 > memory_3txt 
# 间隔两秒之后输出内存使用情况，记录300次
```

## 1.2. 日常维护

### 1.2.1. 更新

```powershell
sudo apt-get update # 更新源
sudo apt-get upgrade # 更新已安装的包
```

```powershell
```

### 1.2.2. Linux终端设置

###　设置Linux命令提示符设置

[Linux命令提示符太长](https://blog.csdn.net/Bloddy/article/details/81638953)

```powershell
(moose) xia@xia-virtual-machine:
~/projects/luwu/src
$
```

需要修改 `~/.bashrc`

```powershell
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\n\w\[\033[00m\]\n\$ '
    # \[\033[01;32m\]\u：当前用户账号名称，
    #  \033[代码;前景;背景m],\[\033[1;32;40m\]表示高亮显示字体为绿色，背景色为黑色。
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\n\w\n\$ '
fi
```

#### 1.2.2.1. 特殊符号的含义

\d ：代表日期，格式为weekday month date，例如：”Mon Aug 1”
\H ：完整的主机名称。例如：我的机器名称为：fc4.linux，则这个名称就是fc4.linux
\h ：仅取主机的第一个名字，如上例，则为fc4，.linux则被省略
\t ：显示时间为24小时格式，如：HH：MM：SS
\T ：显示时间为12小时格式
\A ：显示时间为24小时格式：HH：MM
\u ：当前用户的账号名称
\v ：BASH的版本信息
\w ：完整的工作目录名称。家目录会以 ~代替
\W ：利用basename取得工作目录名称，所以只会列出最后一个目录
$ ：提示字符，如果是root时，提示符为：# ，普通用户则为：$

#### Linux终端显示git当前所在分支

修改 `.bashrc`

添加代码
```powershell
function git_branch {
   branch="`git branch 2>/dev/null | grep "^\*" | sed -e "s/^\*\ //"`"
   if [ "${branch}" != "" ];then
       if [ "${branch}" = "(no branch)" ];then
           branch="(`git rev-parse --short HEAD`...)"
       fi
       echo " ($branch)"
   fi
}
```

修改 `.bashrc` ,并修改了提示行的相关颜色

[Ubuntu Linux终端颜色个性化设置](https://os.51cto.com/art/202008/625040.htm)

```powershell
if [ "$color_prompt" = yes ]; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]$(git_branch)\n\[\033[01;31m\]\w\[\033[01;36m\]\n\$ '
else
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:(git_branch)\n\w\n\$ '
fi
```

> 32m 绿色
> 34m 蓝色
> 36m 青蓝色
> 31m 红色

效果展示

![terminal-show](./Linux/terimain-show_2021-04-17.png)

### 给命令设置别名

```powershell
vim ~/.bashrc

# 添加代码
alias mk='make -j6'
alias cona='conda activate moose'
# 等号之间不能有空格
# 修改完成之后，运行下列代买
source ~/.bashrc
```

## 1.3. ubuntu-vm

### 1.3.1. window下虚拟机ubuntu与主机window系统复制粘贴文件的问题

![vm-tools](./Linux/vm-tools_2021-04-17.png)

如果是灰色的，需要重新启动虚拟机

![vm-tar](./Linux/vm-tar_2021-04-17.png)

将这个文件夹的tar文件复制到Desktop中，解压，之后运行 `vmware-install.pl`

键入如下命名，之后一路默认进行
```powershell
sudo ./vmware-install.pl
```


## Linux 软件安装

1. paraview安装 `sudo apt install paraview`



adduser

## 用户管理

### 添加用户

```powershell
adduser # 比较好，具有交互的界面
```

# 硬件

##　硬盘

- 硬盘转速
- 硬盘容量
- 氦气盘
- 磁盘技术 > 叠瓦盘：不建议
- Backblaze：年化故障率
- 国行，高转速，非叠瓦，氦气盘
###　固态硬盘



# 10楼机房第二台服务器软件安装记录

1. 新建用户pw-moose：`sudo adduser pw-moose`
2. 获取更新列表：`sudo apt update`
3. 更新软件：`sudo apt upgrade`
4. 修改root密码：`sudo passwd root`
5. 对pw-moose赋予超级权限
6. 配置github：[Github 简明教程](https://www.runoob.com/w3cnote/git-guide.html)
7. 修改终端样式：
```bash
if [ "$color_prompt" = yes ]; then
     PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]$(git_branch)\n\[\033[01;36m\]\w\[\033[01;31m\]\n\$ '
 else
     PS1='${debian_chroot:+($debian_chroot)}\u@\h:(git_branch)\n\w\n\$ '
 fi

function git_branch {
   branch="`git branch 2>/dev/null | grep "^\*" | sed -e "s/^\*\ //"`"
   if [ "${branch}" != "" ];then
       if [ "${branch}" = "(no branch)" ];then
           branch="(`git rev-parse --short HEAD`...)"
       fi
       echo " ($branch)"
   fi
}
```
1. 安装moose，[教程](https://mooseframework.inl.gov/getting_started/installation/conda.html)
2.  安装htup：`sudo snap install htop`
3.  [Ubuntu 20安装Qv2ray 教程](https://iguge.app/helper/?p=257) https://ghelper.me/rss/b1d53e240a3c86d8795c85f05933991a
4.  [Ubuntu20.04安装向日葵远程控制软件](https://zhuanlan.zhihu.com/p/144426017)
5.  
