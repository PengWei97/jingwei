# Github

1. [GitHub Docs](https://docs.github.com/cn/github/getting-started-with-github)

## 概念

## 使用git

### ubuntu中git环境配置

### github clone 远程仓库

```powershell
git clone git@github.com:PengWei97/c_pfor_am.git
```

### 推送提交的远程仓库

```powershell
git add . # 添加所有修改文件到
git commit -u 'update'
git push -u origin main
```

### 从远程仓库获取更改

```shell
git pull
```


## 创建一个分支

## Reason
<!--Why do you need this feature or what is the enhancement?-->
I am trying to couple crystal plasticity and phase field to simulate grain growth. To study the influence of elastic properties and plastic properties on grain growth.

## Design
<!--A concise description (design) of the enhancement.--->

Based on the grain plasticity and phase field coupling framework proposed in L. Zhao (2017), and the existing tensor mechanics-phase field coupling example, named bicrystal.i. A custom object based on GrainTracker is developed for output the elastic modulus and rotation matrix, and input them into the sub-module for calculating elastic modulus in the material module.

## Impact
<!--Will the enhancement change existing APIs or add something new?-->
The influence of deformation on grain growth can be considered more carefully.

# Notion

## 目的

使用notion课堂笔记、工作资料、记账、时间管理
## block(模块)

Notion中的基本对象为Block（模块），它可以是任何形式：表格、文本、网页、代码块、图片、视频、文件或者直接是一个Page（页面），目前Notion中支持的Block类型有23种。

而且Block的操作方式极其简单快捷，直接使用鼠标按住拖拽，就可以随意重新排列它们的位置，免去了繁琐的复制粘贴困扰。


##　Page（页面）

而Notion彻底改变了这种局面，在它的理念中，一个笔记就是一个Page，它其实类似于收藏夹的功能。不同的Page之间可以相互嵌套，这种俄罗斯套娃般的无限层级就像一根无形的线，将所有有联系的部分紧紧的拴在一起，形成一个完整而又丰富的知识库。习惯用康奈尔笔记法的同学可以直接使用Notion提供的模版，根据自己的实际需求自定义分栏和层级即可。

## Database（数据库）

Notion的数据库是一个非常强大的板块，它提供了五种不同的展示方式：Table、Board、calendar、List、Gallery，分别对应各种不同的使用场景。同时它支持在这五种展示方式中互相切换，搭配它提供的Filter（过滤）功能，可以按照不同属性生成最适合的展示效果
## 参考资料

1. (Notion，一款强大到改变我人生的软件)[https://zhuanlan.zhihu.com/p/268991624]

# Plan

- [ ] 阅读 `MECHANICAL BEHAVIOR OF MATERIALS`



# Zotero

Zotero是一款自由及开放源代码的文献管理软件，管理书目信息（如作者、标题、出版社、摘要、阅读笔记等）及相关材料（如PDF文件等)。其最著名的特性是作为浏览器插件、在线同步、与文档编辑软件如Microsoft Word、LibreOffice、OpenOffice.org Writer、NeoOffice等集成，可生成文内引用、生成页面脚注或文后的参考文献（bibliographies）。

Zotero最初是基于火狐开发，将文献管理和浏览器结合。人们搜索参考文献离不开浏览器，zotero插件在浏览器上添加一个按钮，当我们遇到需要的文献，可以很方便的进行搜集和管理。除了搜集期刊、书籍等文献外，zotero还可以用来管理收藏网页等。

投身Zotero，开源软件才有强大的生命力

Zotero作为一款协助科研工作者收集、管理以及引用研究资源的免费软件，如今已被广泛使用。此篇使用说明主要分享引用研究资源功能，其中研究资源可以包括期刊、书籍等各类文献和网页、图片等。欢迎所有共同学习使用的朋友提供批评意见或补充使用经验。



## 插件推荐



> Zotero牛就牛在有各种各样插件，我相信以后会越来越多

##　zotero的功能：
1. 强大的文献抓取：zotero可以抓取你浏览的文献和图书的标题、作者、年卷期等信息，并将抓取的信息存储在数据库中，方便调用。对于原始的PDF文档，大部分英文文档可以直接读取文档的元信息，部分较古老中文文档由于格式不规范，无法读取，我们需要手动添加相关信息。除记录重要信息，在权限足够时，zotero还可以自动下载PDF文献等附件。

2. 文献笔记：你可以通过对文献做笔记来记录文献的重要信息。

3. 文献分类与标签：zotero通过对文献分类和标签进行文献的搜索与管理。
4. 文献管理：与所有文献管理软件一样，zotero跟踪论文中参考文献的变化，自动调整引用文献序号、参考文献区域等，避免引文顺序、前后文不一致以及重复引用等错误的出现。
## 注意事项

1. 在Zotero中，当某一条目既符合A文件夹，又符合B文件夹，用鼠标将该条目拖拽到B文件夹，注意，这个拖拽其实并不是复制，而是再B文件夹建立一条痕迹。如果只想在某一个文件夹里删除记录，另外一个文件夹保留该文件，则需要选择“从分类中移除条目”，如果你不小心点了“删除条目”，那么两个文件夹里的文件都会被删除。

2. Zotero也可以起到RSS订阅的功能，如图RSS，获取RSS地址后，直接粘贴进来就可以，虽然功能不是很强大，但是在一个文献管理软件里集成RSS订阅功能，还是挺爽的。

3. 用过EndNote的朋友都知道，它的评⭐功能特别好用，鼠标轻轻一点，文献重要性就出来了。Zotero没有这个功能，但是可以曲线救国。可以在“版权”等不太容易冲突的项目里，打上小⭐，我感觉还是中间黑色的小星星比较显眼。还可以按照⭐数量排序哦。


# web

1. https://emojis.wiki/
2. 