# 1. Github

1. [GitHub Docs](https://docs.github.com/cn/github/getting-started-with-github)

## 1.1. 概念

[Ubuntu 20安装Qv2ray 教程](https://iguge.app/helper/?p=257)


## 1.2. 初始化

### 1.2.1. ubuntu创建ssh公钥

```shell

```

```shell
ssh-keygen -t rsa -C "1248110286@qq.com"
cat ~/.ssh
more id_rsa.pub #复制文件中的所有内容
ssh -T git@github.com #测试验证
```

### 1.2.2. git查看/修改用户名和邮箱地址

1. 用户名和邮箱地址的查看
   - > git config user.name
   - > git config user.email

2. 修改用户名和邮箱地址
   - > git config --global user.name "username"
   - > git config --global user.name "email"
   - > PengWei97

### 1.2.3. 创建远程仓库

> git remote add origin git@github.com:PengWei97/monkey.git

这会将 `origin` 与远程仓库相关联

你可以使用如下命令还修改 `remote's URL`
> git romote set-url <REMOTE_URL>

### 1.2.4. 同步

push an existing repository from the command line

```shell
git remote add origin git@github.com:PengWei97/luwu.git
git branch -M main
git push -u origin main
```

### 1.2.5. 同步某个文件

```shell
git add crystal.i
git commit -m "2011.11.22"
git push -u origin main
```
## 1.3. 使用git

### 1.3.1. ubuntu中git环境配置

### 1.3.2. github clone 远程仓库

```powershell
git clone git@github.com:PengWei97/c_pfor_am.git
```

### 1.3.3. 推送提交的远程仓库

```powershell
git add . # 添加所有修改文件到
git commit -u 'update'
git push -u origin main
```

### 1.3.4. 从远程仓库获取更改

```shell
git pull
```
# 2. Notion

## 2.1. 目的

使用notion课堂笔记、工作资料、记账、时间管理
## 2.2. block(模块)

Notion中的基本对象为Block（模块），它可以是任何形式：表格、文本、网页、代码块、图片、视频、文件或者直接是一个Page（页面），目前Notion中支持的Block类型有23种。

而且Block的操作方式极其简单快捷，直接使用鼠标按住拖拽，就可以随意重新排列它们的位置，免去了繁琐的复制粘贴困扰。


## 2.3. Page（页面）

而Notion彻底改变了这种局面，在它的理念中，一个笔记就是一个Page，它其实类似于收藏夹的功能。不同的Page之间可以相互嵌套，这种俄罗斯套娃般的无限层级就像一根无形的线，将所有有联系的部分紧紧的拴在一起，形成一个完整而又丰富的知识库。习惯用康奈尔笔记法的同学可以直接使用Notion提供的模版，根据自己的实际需求自定义分栏和层级即可。

## 2.4. Database（数据库）

Notion的数据库是一个非常强大的板块，它提供了五种不同的展示方式：Table、Board、calendar、List、Gallery，分别对应各种不同的使用场景。同时它支持在这五种展示方式中互相切换，搭配它提供的Filter（过滤）功能，可以按照不同属性生成最适合的展示效果
## 2.5. 参考资料

1. (Notion，一款强大到改变我人生的软件)[https://zhuanlan.zhihu.com/p/268991624]

# 3. Plan

- [ ] 阅读 `MECHANICAL BEHAVIOR OF MATERIALS`
- [ ] 