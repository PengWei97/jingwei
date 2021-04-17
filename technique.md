# 奇淫巧计  

## 1. Github  

## 2 Moose-C++

## 3 Moose

### 3.1 basic

### 3.2 problem

### 3.3 

## 4 Software

### 4.1 Markdown

 *vscode需要安装的扩展*
 
  - Markdown All in 
  - Markdown PDF
  - Markdown Preview Enhanced：一款功能强大的Markdown插件
  - 

### 4.2 VS Code

- IntelliJ IDEA Key Bindings
- Sublime Text Keymap and Settings Importer
- Visual Studio Keymap
- Code Spell Checker:检查常见的错误
- Power Mode




## 6 Liunx

### 6.1 系统监控

```shellscript
$ htop
$ sar -r 2 300 > memory_3txt
```








<div STYLE="page-break-after: always;"></div>

# MOOSE WEB

## 1. Application Usage

## 2. Physics Modules

### 2.1 Tensor Mechanics

### 2.2 Phase Field

## 3. Application Development

### 3.1 Source Documentation

### 3.2 Jacobian Definition

### 3.3 Hypre / BoomerAMG
Hypre是Lawrence Livermore国家实验室的一组解算器/预处理器。Hypre的主要网站可以在这里找到。对于MOOSE，我们主要使用Hypre的代数多重网格（AMG）包：BoomerAMG。  
AMG是一种可扩展的求解椭圆偏微分方程的有效算法。许多不同的偏微分方程都属于这一类，包括热传导、固体力学、多孔流动、物种扩散等。 
[Hypre / BoomerAMG](https://mooseframework.inl.gov/application_development/hypre.html)


### 3.4 Utilities
MOOSE contains objects that provide utility functionality, which may be used to simplify calculations in several primary systems. Examples of these utilities include interpolation objects, function "fit" objects, file readers, tensor objects, etc. These objects are documented here.

#### 3.4.1 [FormattedTable](https://mooseframework.inl.gov/framework_development/utils/FormattedTable.html)

FormattedTable对象是用于保存表数据的通用实用程序。通常，它用于保存ScalarKernels生成的后处理器值或标量变量。它提供了几个有用的实用程序来显示数据和有效地输出数据。

#### 3.4.2 [InputParameters](https://mooseframework.inl.gov/source/utils/InputParameters.html)

为了简化和统一MOOSE中所有模拟对象的创建，必须通过一个“InputParameters”对象声明和填充所有输入参数。这确保了MOOSE中的每个构造函数都是统一的，并确保每个对象都可以通过MOOSE的工厂模式创建。InputParameters对象是一组参数，每个参数都有单独的属性，可以用来精细地控制基础对象的行为。例如，参数可以标记为必需或可选，可以提供默认值，也可以不提供，还可以用于增强GUI接口，这些接口可以用于以编程方式为MOOSE生成输入文件。

#### 3.4.3 [MathUtils Namespace](https://mooseframework.inl.gov/source/utils/MathUtils.html)

MOOSE包括许多C++实用工具类和函数，它们对于开发具有数学表达式的应用程序可能是有用的。
 


## 4. Framework Development

### 4.1 [Contributing](https://mooseframework.inl.gov/framework_development/contributing.html)



## 5. MOOSEDocs

## 6. Infrastructure

