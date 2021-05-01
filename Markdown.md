---
export_on_save:
  prince: true
---
[TOC]

# 1. Markdown - basic

## 1.1. 字体

  *斜体文字*  
  _斜体文本_  
  **粗体文本**  
  __粗体文本__  
  ***粗斜体文本***  
  ___粗斜体文本___

## 1.2. 分隔线，删除线



## 1.3. 列表

Markdown支持有序列表和无序列表  
无序列表使用*，加号+或是减号-作为列表标记，这些标记后面要添加一个空格，之后再填写内容
- 第一项
- 第二项
- 第三项

有序列表：使用数字并加上.
1. 第一项
2. 第二项
3. 第三项

列表嵌套
1. 第一项
  - 第一项嵌套的第一个元素
2. 第二项：
  - 第二项嵌套的第一个元素
3. 第三项

## 1.3.1. 链接

### 1.3.1.1. 文字链接
在日常生活中我们使用的网址有[google], [github], [overflow]

[google]:https://www.google.com/webhp?hl=zh-CN&sa=X&ved=0ahUKEwjM3f3Pr_3vAhXyJKYKHT3wDT4QPAgL
[github]:https://github.com/idaholab/moose/discussions
[overflow]:https://developer.mozilla.org/zh-CN/docs/Web/CSS/overflow

### 1.3.2. 引用链接

### 1.3.3. 网址链接
<https://www.youtube.com/>

### 文内跳转

[跳转到1.1字体](#11-字体)

## 1.4. 代码

### 1.4.1. 行内代码

`代码`

### 1.4.2. 代码块

```c++
#include<iostream>
using namespace std;

int main() {

	cout << "Hello world" << endl;

	system("pause");

	return 0;
}
```

```powershell
htop
sar -r 2 300 > memory_3txt
```

## 1.5. 引用

> 我是引用的句子，请在我的前面加上>。

> 这是多行引用的第一行，我的后面又两个空格。  
> 这是多行引用的第二行。

> 引用中的嵌套引用。
>> 这是二级嵌套引用

## 1.6. 转义

\特殊符号
\\
\*
\_
\{}
\[]
\()
\#
\-
\.
\!

包含表格，任务列表，删除线，围栏代码，Emoji等在内的语法。

## 1.7. 线

~~删除线~~

***  
* * * 
******
- - - 
-------

## 1.8. 表情符号

:表情符号:

:smile:
:laughing:
:+1:
:-1:
:clap:
更多表情请参考[webfx](https://www.webfx.com/tools/emoji-cheat-sheet/)


## 1.9. 自动链接

标准语法中由<>包裹URL地址被自动识别并解析为超链接
<wwww.baidu.com>
使用GFM扩展语法可以不使用<>包裹
如：
www.baidu.com
http://baidu.com
http://www.baidu.com
`www.baidu.com`

## 1.10. 表格

| 序号 | 标题 | 网址                                                     |
| ---- | ---- | -------------------------------------------------------- |
| 01   | 博客 | https://mp.csdn.net/console/home?spm=1001.2100.3001.4503 |
| 02   | 微博 | https://weibo.com/?topnav=1&mod=logo                     |

<!-- 对齐格式 -->
| 左对齐 | 居中对齐 |                                                   右对齐 |
| :----- | :------: | -------------------------------------------------------: |
| 01     |   博客   | https://mp.csdn.net/console/home?spm=1001.2100.3001.4503 |
| 02     |   微博   |                     https://weibo.com/?topnav=1&mod=logo |

<!-- 表格内使用其他标记 -->
| 序号   | 标题 | 网址                                                     |
| ------ | ---- | -------------------------------------------------------- |
| *01*   | 博客 | https://mp.csdn.net/console/home?spm=1001.2100.3001.4503 |
| **02** | 微博 | https://weibo.com/?topnav=1&mod=logo               |

## 1.11. 任务列表

- [ ] 未勾选
- [x] 已勾选
- [ ] 吃
  - [ ] 吃鱼
  - [x] 吃瓜

## 1.12. 围栏代码块

```shell
pipenv shell
```
##　希腊字母
[速查](https://my.oschina.net/KujieDuyuren/blog/4256002)


## 公式
[用Markdown写公式](https://www.cyprestar.com/2018/02/26/Write-Markdown-with-Formulas/)


# 2. markdown - vs code

## 2.1. Markdown All in One

### 自定义 css

[css](https://shd101wyy.github.io/markdown-preview-enhanced/#/zh-cn/customize-css?id=%e8%87%aa%e5%ae%9a%e4%b9%89-css)


# 3. 快捷键

1. alt + shfit + F 格式化
2. ctrl + B 加粗
3. ctrl + I 拉丁字体
4. 

