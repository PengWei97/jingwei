# 1. 预备知识

## 1.1. 简介

1. C++ 是一种静态类型的、编译式的、通用的、大小写敏感的、不规则的编程语言，支持过程化编程、面向对象编程和泛型编程。
2. C++ 被认为是一种中级语言，它综合了高级语言和低级语言的特点。
3. C++ 是 C 的一个超集，事实上，任何合法的 C 程序都是合法的 C++ 程序。
ps.注意：使用静态类型的编程语言是在编译时执行类型检查，而不是在运行时执行类型检查。
## 1.2. 历史

C++ 是一种中级语言，它是由 Bjarne Stroustrup 于 1979 年在贝尔实验室开始设计开发的。C++ 进一步扩充和完善了 C 语言，是一种面向对象的程序设计语言。

## 1.3. 简介



### 1.3.1. 面向对象程序设计

C++ 完全支持面向对象的程序设计，包括面向对象开发的四大特性：
- 封装
- 抽象
- 继承
- 多态

### 1.3.2. 标准库

标准的c++由三个重要部分组成：
- 核心语言，提供了所有块构件，包含变量、数据类型和常量等
- c++ 标准库，提供大量的函数，用于操作文件、字符串等。
- 标准模板库(STL)，提供了大量的方法，用于操作数据结构等。

### 1.3.3. c++学习体会

1. 学习c++，关键是要理解概念，而不应过于研究语言的技术细节

## 1.4. 基础语法

C++程序可以定义为对象的集合，这些对象可以通过调用彼此的方法来进行交互。

- 对象：具有具体的状态和行为。eg. 一只狗的状态 - 颜色、名称、品种，行为 - 摇动，叫唤，吃
- 类：可以定义为描述对象行为/状态的模板/蓝图
- 方法：从基本上说，一种方法表示一种行为。一个类可以包含多个方法。可以在方法中写于逻辑、操作数据以及执行所有的动作。
- 即时变量：每个对象都有其独特的即时变量。对象的状态是由这些即时变量的值创建的。

```c++
#include <iostream> // 定义了一些头文件
using namespace std; // 告诉编译器使用std的命名空间
 
// main() 是程序开始执行的地方
 
int main() // 主函数
{
   cout << "Hello World"; // 输出 Hello World
   return 0; // 终止main()函数
}
```
### 1.4.1. 编译 & 执行 C++ 程序

1. 保存文件 `hello.cpp`
2. 键入 `g++ hello.cpp` ，编译代码，之后生成一个 `a.out` 可执行文件
3. 键入 `a.out` , 可以在屏幕上显示 'hello.world!'。


```c++

```


## 1.5. 关键字

### 1.5.1. typename
typename（类型名字）关键字告诉编译器把一个特殊的名字解释成一个类型。在下列情况下必须对一个 name 使用 typename 关键字：

## 1.6. using

1. 在子类中引用基类的成员


# 2. 处理数据

## 2.1. 简单变量
变量的名称可以由字母、数字和下划线字符组成。它必须以字母或下划线开头。大写字母和小写字母是不同的，因为 C++ 是大小写敏感的。

变量定义指定一个数据类型，并包含了该类型的一个或多个变量的列表，如下所示：

```c
type variable_list;

int    i, j, k;
char   c, ch;
float  f, salary;
double d;

#include <iostream>
using namespace std;
 
// 变量声明
extern int a, b;
extern int c;
extern float f;
  
int main ()
{
  // 变量定义
  int a, b;
  int c;
  float f;
 
  // 实际初始化
  a = 10;
  b = 20;
  c = a + b;
 
  cout << c << endl ;
 
  f = 70.0/3.0;
  cout << f << endl ;
 
  return 0;
}
```

## 2.2. const限定符

## 2.3. 浮点数

## 2.4. C++算数运算符

# 3. 复合类型
## 数组

## 字符串

## string类简介


## 3.2. 结构体

结构是 C++ 中另一种用户自定义的可用的数据类型，它允许您存储不同类型的数据项。

为了定义结构，您必须使用 struct 语句。struct 语句定义了一个包含多个成员的新的数据类型，struct 语句的格式如下：
```c++
#include <iostream>
#include <cstring>
 
using namespace std;
 
// 声明一个结构体类型 Books 
struct Books
{
   char  title[50];
   char  author[50];
   char  subject[100];
   int   book_id;
};
 
int main( )
{
   Books Book1;        // 定义结构体类型 Books 的变量 Book1
   Books Book2;        // 定义结构体类型 Books 的变量 Book2
 
   // Book1 详述
   strcpy( Book1.title, "C++ 教程");
   strcpy( Book1.author, "Runoob"); 
   strcpy( Book1.subject, "编程语言");
   Book1.book_id = 12345;
 
   // Book2 详述
   strcpy( Book2.title, "CSS 教程");
   strcpy( Book2.author, "Runoob");
   strcpy( Book2.subject, "前端技术");
   Book2.book_id = 12346;
 
   // 输出 Book1 信息
   cout << "第一本书标题 : " << Book1.title <<endl;
   cout << "第一本书作者 : " << Book1.author <<endl;
   cout << "第一本书类目 : " << Book1.subject <<endl;
   cout << "第一本书 ID : " << Book1.book_id <<endl;
 
   // 输出 Book2 信息
   cout << "第二本书标题 : " << Book2.title <<endl;
   cout << "第二本书作者 : " << Book2.author <<endl;
   cout << "第二本书类目 : " << Book2.subject <<endl;
   cout << "第二本书 ID : " << Book2.book_id <<endl;
 
   return 0;
}
```


### 3.2.1. 指向结构的指针

```c++
#include <iostream>
#include <cstring>
 
using namespace std;
void printBook( struct Books *book );
 
struct Books
{
   char  title[50];
   char  author[50];
   char  subject[100];
   int   book_id;
};
 
int main( )
{
   Books Book1;        // 定义结构体类型 Books 的变量 Book1
   Books Book2;        // 定义结构体类型 Books 的变量 Book2
 
    // Book1 详述
   strcpy( Book1.title, "C++ 教程");
   strcpy( Book1.author, "Runoob"); 
   strcpy( Book1.subject, "编程语言");
   Book1.book_id = 12345;
 
   // Book2 详述
   strcpy( Book2.title, "CSS 教程");
   strcpy( Book2.author, "Runoob");
   strcpy( Book2.subject, "前端技术");
   Book2.book_id = 12346;
 
   // 通过传 Book1 的地址来输出 Book1 信息
   printBook( &Book1 );
 
   // 通过传 Book2 的地址来输出 Book2 信息
   printBook( &Book2 );
 
   return 0;
}
// 该函数以结构指针作为参数
void printBook( struct Books *book )
{
   cout << "书标题  : " << book->title <<endl;
   cout << "书作者 : " << book->author <<endl;
   cout << "书类目 : " << book->subject <<endl;
   cout << "书 ID : " << book->book_id <<endl;
}
```

## 3.1. 枚举类型
枚举类型(enumeration)是C++中的一种派生数据类型，它是由用户定义的若干枚举常量的集合。

如果一个变量只有几种可能的值，可以定义为枚举(enumeration)类型。所谓"枚举"是指将变量的值一一列举出来，变量的值只能在列举出来的值的范围内。

```c++
enum color { red, green, blue } c;
c = blue;
```
## 指针和自由存储空间

## 类型组合

## 数组的的替代品
###　模板类vector

## 3.3. 模板

模板是泛型编程的基础，泛型编程即以一种独立于任何特定类型的方式编写代码。
模板是创建泛型类或函数的蓝图或公式。

### 3.3.1. 函数模板
模板函数定义的一般形式如下所示：
```c++{.line-numbers}
template <typename type> 
ret-type func-name(parameter list)
{
   // 函数的主体
}

template <typename T>
inline T const& Max (T const& a, T const& b) 
{ 
    return a < b ? b:a; 
} 

template <bool is_ad>
ComputeElasticityTensorBaseTempl<is_ad>::ComputeElasticityTensorBaseTempl(
    const InputParameters & parameters)
  : DerivativeMaterialInterface<Material>(parameters),
    GuaranteeProvider(this),
    _base_name(isParamValid("base_name") ? getParam<std::string>("base_name") + "_" : ""),
    _elasticity_tensor_name(_base_name + "elasticity_tensor"),
    _elasticity_tensor(declareGenericProperty<RankFourTensor, is_ad>(_elasticity_tensor_name)),
    _effective_stiffness(declareGenericProperty<Real, is_ad>(_base_name + "effective_stiffness")),
    _prefactor_function(isParamValid("elasticity_tensor_prefactor")
                            ? &getFunction("elasticity_tensor_prefactor")
                            : nullptr)
{
}
```

# 4. 变量



## 4.1. 左值与右值

- 左值：指向内存位置的表达式被称为左值（lvalue）表达式。左值可以出现在赋值号的左边或右边。
- 右值：术语右值（rvalue）指的是存储在内存中某些地址的数值。右值是不能对其进行赋值的表达式，也就是说，右值可以出现在赋值号的右边，但不能出现在赋值号的左边。

## 4.2. 变量作用域

作用域是程序的一个区域，一般来说有三个地方可以定义变量：
- 在函数或一个代码块内部声明的变量，称为局部变量。
- 在函数参数的定义中声明的变量，称为形式参数。
- 在所有函数外部声明的变量，称为全局变量。
- 
### 4.2.1. 局部变量
在函数或一个代码块内部声明的变量，称为局部变量。它们只能被函数内部或者代码块内部的语句使用。

### 4.2.2. 全局变量
在所有函数外部定义的变量（通常是在程序的头部），称为全局变量。全局变量的值在程序的整个生命周期内都是有效的。

## 4.3. 常量
常量是固定值，在程序执行期间不会改变。这些固定的值，又叫做字面量。
常量可以是任何的基本数据类型，可分为整型数字、浮点数字、字符、字符串和布尔值。
常量就像是常规的变量，只不过常量的值在定义后不能进行修改。

### 4.3.1. const 关键字
您可以使用 const 前缀声明指定类型的常量，如下所示：

```c
const type variable = value;
```

## 4.4. C++ 存储类
存储类定义 C++ 程序中变量/函数的范围（可见性）和生命周期。这些说明符放置在它们所修饰的类型之前。

### 4.4.1. auto 存储类
自 C++ 11 以来，auto 关键字用于两种情况：声明变量时根据初始化表达式自动推断该变量的类型、声明函数时函数返回值的占位符。

### 4.4.2. static 存储类
static 存储类指示编译器在程序的生命周期内保持局部变量的存在，而不需要在每次它进入和离开作用域时进行创建和销毁。因此，使用 static 修饰局部变量可以在函数调用之间保持局部变量的值。
static 修饰符也可以应用于全局变量。当 static 修饰全局变量时，会使变量的作用域限制在声明它的文件内。

## 4.5. 运算符

### 4.5.1. 杂项运算符

#### 4.5.1.1. 成员运算符
. AND -> 用于引用类、结构和共用体的成员。
用于引用类、结构和共用体的成员。

访问结构的成员时使用点运算符，而通过指针访问结构的成员时，则使用箭头运算符
# 5. 语句
## 5.1. 条件语句
## 5.2. 循环语句


# 6. 运算符

# 7. 函数
函数是一组一起执行一个任务的语句。每个 C++ 程序都至少有一个函数，即主函数 main() ，所有简单的程序都可以定义其他额外的函数。
函数还有很多叫法，比如方法、子例程或程序，等等。

## 7.1. 定义函数
C++ 中的函数定义的一般形式如下：
```c++
return_type function_name( parameter list )
{
   body of the function
}
```
参数：参数就像是占位符。当函数被调用时，您向参数传递一个值，这个值被称为实际参数。参数列表包括函数参数的类型、顺序、数量。参数是可选的，也就是说，函数可能不包含参数。

## 7.2. 函数声明
函数声明会告诉编译器函数名称及如何调用函数。函数的实际主体可以单独定义。
函数声明包括以下几个部分：
```c++
return_type function_name( parameter list );

```

## 7.3. 函数参数
如果函数要使用参数，则必须声明接受参数值的变量。这些变量称为函数的形式参数。
形式参数就像函数内的其他局部变量，在进入函数时被创建，退出函数时被销毁。
当调用函数时，有三种向函数传递参数的方式：
1. 值调用
2. 指针调用
3. 引用调用：该方法把参数的引用赋值给形式参数。在函数内，该引用用于访问调用中要用到的实际参数。这意味着，修改形式参数会影响实际参数。

### 7.3.1. 引用调用
向函数传递参数的引用调用方法，把引用的地址复制给形式参数。在函数内，该引用用于访问调用中要用到的实际参数。这意味着，修改形式参数会影响实际参数。
```c++
// 函数定义
void swap(int &x, int &y)
{
   int temp;
   temp = x; /* 保存地址 x 的值 */
   x = y;    /* 把 y 赋值给 x */
   y = temp; /* 把 x 赋值给 y  */
  
   return;
}
```

## 7.4. Lambda 函数与表达式
C++11 提供了对匿名函数的支持,称为 Lambda 函数(也叫 Lambda 表达式)。

Lambda 表达式把函数看作对象。Lambda 表达式可以像对象一样使用，比如可以将它们赋给变量和作为参数传递，还可以像函数一样对其求值。


# 8. 指针

学习 C++ 的指针既简单又有趣。通过指针，可以简化一些 C++ 编程任务的执行，还有一些任务，如动态内存分配，没有指针是无法执行的。所以，想要成为一名优秀的 C++ 程序员，学习指针是很有必要的。

指针是一个变量，其值为另一个变量的地址，即，内存位置的直接地址。就像其他变量或常量一样，您必须在使用指针存储其他变量地址之前，对其进行声明。指针变量声明的一般形式为：
```c++
type *var-name;

#include <iostream>
 
using namespace std;
 
int main ()
{
   int  var = 20;   // 实际变量的声明
   int  *ip;        // 指针变量的声明
 
   ip = &var;       // 在指针变量中存储 var 的地址
 
   cout << "Value of var variable: ";
   cout << var << endl;
 
   // 输出在指针变量中存储的地址
   cout << "Address stored in ip variable: ";
   cout << ip << endl;
 
   // 访问指针中地址的值
   cout << "Value of *ip variable: ";
   cout << *ip << endl;
 
   return 0;
}
```
## 8.1. Null 指针
在变量声明的时候，如果没有确切的地址可以赋值，为指针变量赋一个 NULL 值是一个良好的编程习惯。赋为 NULL 值的指针被称为空指针。

## 8.2. c++中this指针的理解
在 C++ 中，每一个对象都能通过 this 指针来访问自己的地址。this 指针是所有成员函数的隐含参数。因此，在成员函数内部，它可以用来指向调用对象。

this作用域是在类内部，当在类的非静态成员函数中访问类的非静态成员的时候，编译器会自动将对象本身的地址作为一个隐含参数传递给函数。

每一个变量都有一个内存位置，每一个内存位置都定义了可使用连字号（&）运算符访问的地址，它表示了在内存中的一个地址。

友元函数没有 this 指针，因为友元不是类的成员。只有成员函数才有 this 指针。

```c++
struct type_name {
member_type1 member_name1;
member_type2 member_name2;
member_type3 member_name3;
.
.
} object_names;
```
`type_name` 是结构体类型的名称，member_type1 member_name1 是标准的变量定义，比如 int i; 或者 float f; 或者其他有效的变量定义。在结构定义的末尾，最后一个分号之前，您可以指定一个或多个结构变量，这是可选的。下面是声明一个结构体类型 Books，变量为 book：

```c++
struct Books
{
   char  title[50];
   char  author[50];
   char  subject[100];
   int   book_id;
} book;
```



# 9. 引用
引用变量是一个别名，也就是说，它是某个已存在变量的另一个名字。一旦把引用初始化为某个变量，就可以使用该引用名称或变量名称来指向变量。

## 9.1. 引用 vs 指针

- 不存在空引用。引用必须连接到一块合法的内存。
- 一旦引用被初始化为一个对象，就不能被指向到另一个对象。指针可以在任何时候指向到另一个对象。
- 引用必须在创建时被初始化。指针可以在任何时间被初始化。

```c++
#include <iostream>
 
using namespace std;
 
int main ()
{
   // 声明简单的变量
   int    i;
   double d;
 
   // 声明引用变量
   int&    r = i;
   double& s = d;
   
   i = 5;
   cout << "Value of i : " << i << endl;
   cout << "Value of i reference : " << r  << endl;
 
   d = 11.7;
   cout << "Value of d : " << d << endl;
   cout << "Value of d reference : " << s  << endl;
   
   return 0;
}
```
# 10. 内存模型和名称空间

## 10.1. 动态内存

C++ 程序中的内存分为两个部分：
- 栈：在函数内部声明的所有变量都将占用栈内存。
- 堆：这是程序中未使用的内存，在程序运行时可用于动态分配内存。
# 11. 对象和类

C++ 在 C 语言的基础上增加了面向对象编程，C++ 支持面向对象程序设计。类是 C++ 的核心特性，通常被称为用户定义的类型。

类用于指定对象的形式，它包含了数据表示法和用于处理数据的方法。类中的数据和方法称为类的成员。函数在一个类中被称为类的成员。

在 C++ 中，您可以使用特殊的运算符为给定类型的变量在运行时分配堆内的内存，这会返回所分配的空间地址。这种运算符即 new 运算符。

如果您不再需要动态分配的内存空间，可以使用 delete 运算符，删除之前由 new 运算符分配的内存。



## 11.1. 定义类

![类定义](./C++/cpp-classes-objects-2020-12-10-11.png)
```c
class Box
{
   public:
      double length;   // 盒子的长度
      double breadth;  // 盒子的宽度
      double height;   // 盒子的高度
};
```

## 11.2. 定义对象
类提供了对象的蓝图，所以基本上，对象是根据类来创建的。声明类的对象，就像声明基本类型的变量一样。下面的语句声明了类 Box 的两个对象：
```c++
Box Box1;          // 声明 Box1，类型为 Box
Box Box2;          // 声明 Box2，类型为 Box
```
```c++
#include <iostream>
 
using namespace std;
 
class Box
{
   public:
      double length;   // 长度
      double breadth;  // 宽度
      double height;   // 高度
      // 成员函数声明
      double get(void);
      void set( double len, double bre, double hei );
};
// 成员函数定义
double Box::get(void)
{
    return length * breadth * height;
}
 
void Box::set( double len, double bre, double hei)
{
    length = len;
    breadth = bre;
    height = hei;
}
int main( )
{
   Box Box1;        // 声明 Box1，类型为 Box
   Box Box2;        // 声明 Box2，类型为 Box
   Box Box3;        // 声明 Box3，类型为 Box
   double volume = 0.0;     // 用于存储体积
 
   // box 1 详述
   Box1.height = 5.0; 
   Box1.length = 6.0; 
   Box1.breadth = 7.0;
 
   // box 2 详述
   Box2.height = 10.0;
   Box2.length = 12.0;
   Box2.breadth = 13.0;
 
   // box 1 的体积
   volume = Box1.height * Box1.length * Box1.breadth;
   cout << "Box1 的体积：" << volume <<endl;
 
   // box 2 的体积
   volume = Box2.height * Box2.length * Box2.breadth;
   cout << "Box2 的体积：" << volume <<endl;
 
 
   // box 3 详述
   Box3.set(16.0, 8.0, 12.0); 
   volume = Box3.get(); 
   cout << "Box3 的体积：" << volume <<endl;
   return 0;
}
```
## 11.3. 类成员函数

类的成员函数是指那些把定义和原型写在类定义内部的函数，就像类定义中的其他变量一样。类成员函数是类的一个成员，它可以操作类的任意对象，可以访问对象中的所有成员。

```c
#include <iostream>
 
using namespace std;
 
class Box
{
   public:
      double length;         // 长度
      double breadth;        // 宽度
      double height;         // 高度
 
      // 成员函数声明
      double getVolume(void);
      void setLength( double len );
      void setBreadth( double bre );
      void setHeight( double hei );
};
 
// 成员函数定义
double Box::getVolume(void)
{
    return length * breadth * height;
}
 
void Box::setLength( double len )
{
    length = len;
}
 
void Box::setBreadth( double bre )
{
    breadth = bre;
}
 
void Box::setHeight( double hei )
{
    height = hei;
}
 
// 程序的主函数
int main( )
{
   Box Box1;                // 声明 Box1，类型为 Box
   Box Box2;                // 声明 Box2，类型为 Box
   double volume = 0.0;     // 用于存储体积
 
   // box 1 详述
   Box1.setLength(6.0); 
   Box1.setBreadth(7.0); 
   Box1.setHeight(5.0);
 
   // box 2 详述
   Box2.setLength(12.0); 
   Box2.setBreadth(13.0); 
   Box2.setHeight(10.0);
 
   // box 1 的体积
   volume = Box1.getVolume();
   cout << "Box1 的体积：" << volume <<endl;
 
   // box 2 的体积
   volume = Box2.getVolume();
   cout << "Box2 的体积：" << volume <<endl;
   return 0;
}
```
## 11.4. 访问修饰符

数据封装是面向对象编程的一个重要特点，它防止函数直接访问类类型的内部成员。类成员的访问限制是通过在类主体内部对各个区域标记 `public` 、`private` 、`protected`  来指定的。关键字 `public` 、`private` 、`protected` 称为访问修饰符。

### 11.4.1. 公有（public）成员
公有成员在程序中类的外部是可访问的。您可以不使用任何成员函数来设置和获取公有变量的值

```c
#include <iostream>
 
using namespace std;
 
class Line
{
   public:
      double length;
      void setLength( double len );
      double getLength( void );
};
 
// 成员函数定义
double Line::getLength(void)
{
    return length ;
}
 
void Line::setLength( double len )
{
    length = len;
}
 
// 程序的主函数
int main( )
{
   Line line;
 
   // 设置长度
   line.setLength(6.0); 
   cout << "Length of line : " << line.getLength() <<endl;
 
   // 不使用成员函数设置长度
   line.length = 10.0; // OK: 因为 length 是公有的
   cout << "Length of line : " << line.length <<endl;
   return 0;
}
```
### 11.4.2. 私有（private）成员
私有成员变量或函数在类的外部是不可访问的，甚至是不可查看的。只有类和友元函数可以访问私有成员。
默认情况下，类的所有成员都是私有的。

### 11.4.3. protected（受保护）成员
protected（受保护）成员变量或函数与私有成员十分相似，但有一点不同，protected（受保护）成员在派生类（即子类）中是可访问的。


## 11.5. 继承

### 11.5.1. 继承中的特点

面向对象程序设计中最重要的一个概念是继承。继承允许我们依据另一个类来定义一个类，这使得创建和维护一个应用程序变得更容易。这样做，也达到了重用代码功能和提高执行效率的效果。

有public, protected, private三种继承方式，它们相应地改变了基类成员的访问属性。

1. .public 继承：基类 public 成员，protected 成员，private 成员的访问属性在派生类中分别变成：public, protected, private
2. protected 继承：基类 public 成员，protected 成员，private 成员的访问属性在派生类中分别变成：protected, protected, private
3. private 继承：基类 public 成员，protected 成员，private 成员的访问属性在派生类中分别变成：private, private, private
4. 
## 11.6. 构造函数

类的构造函数是类的一种特殊的成员函数，它会在每次创建类的新对象时执行。
构造函数的名称与类的名称是完全相同的，并且不会返回任何类型，也不会返回 void。构造函数可用于为某些成员变量设置初始值。

```c
#include <iostream>
 
using namespace std;
 
class Line
{
   public:
      void setLength( double len );
      double getLength( void );
      Line();  // 这是构造函数
 
   private:
      double length;
};
 
// 成员函数定义，包括构造函数
Line::Line(void)
{
    cout << "Object is being created" << endl;
}
 
void Line::setLength( double len )
{
    length = len;
}
 
double Line::getLength( void )
{
    return length;
}
// 程序的主函数
int main( )
{
   Line line;
 
   // 设置长度
   line.setLength(6.0); 
   cout << "Length of line : " << line.getLength() <<endl;
 
   return 0;
}
```
### 11.6.1. 带参数的构造函数

默认的构造函数没有任何参数，但如果需要，构造函数也可以带有参数。这样在创建对象时就会给对象赋初始值，如下面的例子所示：

### 11.6.2. 拷贝构造函数

拷贝构造函数是一种特殊的构造函数，它在创建对象时，是使用同一类中之前创建的对象来初始化新创建的对象。拷贝构造函数通常用于：
- 通过使用另一个同类型的对象来初始化新创建的对象。
- 复制对象把它作为参数传递给函数。
- 复制对象，并从函数返回这个对象。

拷贝构造函数的最常见形式如下：
```c
classname (const classname &obj) {
   // 构造函数的主体
}
```
## 11.7. 析构函数
类的析构函数是类的一种特殊的成员函数，它会在每次删除所创建的对象时执行。

析构函数的名称与类的名称是完全相同的，只是在前面加了个波浪号（~）作为前缀，它不会返回任何值，也不能带有任何参数。

## 11.8. 友元函数

类的友元函数是定义在类外部，但有权访问类的所有私有（private）成员和保护（protected）成员。尽管友元函数的原型有在类的定义中出现过，但是友元函数并不是成员函数。

友元可以是一个函数，该函数被称为友元函数；友元也可以是一个类，该类被称为友元类，在这种情况下，整个类及其所有成员都是友元。

```c++
#include <iostream>
 
using namespace std;
 
class Box
{
   double width;
public:
   friend void printWidth( Box box );
   void setWidth( double wid );
};
 
// 成员函数定义
void Box::setWidth( double wid )
{
    width = wid;
}
 
// 请注意：printWidth() 不是任何类的成员函数
void printWidth( Box box )
{
   /* 因为 printWidth() 是 Box 的友元，它可以直接访问该类的任何成员 */
   cout << "Width of box : " << box.width <<endl;
}
 
// 程序的主函数
int main( )
{
   Box box;
 
   // 使用成员函数设置宽度
   box.setWidth(10.0);
   
   // 使用友元函数输出宽度
   printWidth( box );
 
   return 0;
}
```

## 11.9. 内联函数
内联函数是通常与类一起使用。如果一个函数是内联的，那么在编译时，编译器会把该函数的代码副本放置在每个调用该函数的地方。

如果想把一个函数定义为内联函数，则需要在函数名前面放置关键字 inline，在调用函数之前需要对函数进行定义。如果已定义的函数多于一行，编译器会忽略 inline 限定符。

```c++
#include <iostream>
 
using namespace std;

inline int Max(int x, int y)
{
   return (x > y)? x : y;
}

// 程序的主函数
int main( )
{

   cout << "Max (20,10): " << Max(20,10) << endl;
   cout << "Max (0,200): " << Max(0,200) << endl;
   cout << "Max (100,1010): " << Max(100,1010) << endl;
   return 0;
}
```
引入内联函数的目的是为了解决程序中函数调用的效率问题，这么说吧，程序在编译器编译的时候，编译器将程序中出现的内联函数的调用表达式用内联函数的函数体进行替换，而对于其他的函数，都是在运行时候才被替代。这其实就是个空间代价换时间的i节省。所以内联函数一般都是1-5行的小函数。在使用内联函数时要留神：
- 在内联函数内不允许使用循环语句和开关语句；
- 内联函数的定义必须出现在内联函数第一次调用之前；
- 类结构中所在的类说明内部定义的函数是内联函数。

## 11.10. this 指针
在 C++ 中，每一个对象都能通过 this 指针来访问自己的地址。this 指针是所有成员函数的隐含参数。因此，在成员函数内部，它可以用来指向调用对象。

友元函数没有 this 指针，因为友元不是类的成员。只有成员函数才有 this 指针。

```c++
#include <iostream>
 
using namespace std;
 
class Box
{
   public:
      // 构造函数定义
      Box(double l=2.0, double b=2.0, double h=2.0)
      {
         cout <<"Constructor called." << endl;
         length = l;
         breadth = b;
         height = h;
      }
      double Volume()
      {
         return length * breadth * height;
      }
      int compare(Box box)
      {
         return this->Volume() > box.Volume();
      }
   private:
      double length;     // Length of a box
      double breadth;    // Breadth of a box
      double height;     // Height of a box
};
 
int main(void)
{
   Box Box1(3.3, 1.2, 1.5);    // Declare box1
   Box Box2(8.5, 6.0, 2.0);    // Declare box2
 
   if(Box1.compare(Box2))
   {
      cout << "Box2 is smaller than Box1" <<endl;
   }
   else
   {
      cout << "Box2 is equal to or larger than Box1" <<endl;
   }
   return 0;
}
```
当我们调用成员函数时，实际上是替某个对象调用它。

## 11.11. 指向类的指针
一个指向 C++ 类的指针与指向结构的指针类似，访问指向类的指针的成员，需要使用成员访问运算符 ->，就像访问指向结构的指针一样。与所有的指针一样，您必须在使用指针之前，对指针进行初始化。

```c++
#include <iostream>
 
using namespace std;

class Box
{
   public:
      // 构造函数定义
      Box(double l=2.0, double b=2.0, double h=2.0)
      {
         cout <<"Constructor called." << endl;
         length = l;
         breadth = b;
         height = h;
      }
      double Volume()
      {
         return length * breadth * height;
      }
   private:
      double length;     // Length of a box
      double breadth;    // Breadth of a box
      double height;     // Height of a box
};

int main(void)
{
   Box Box1(3.3, 1.2, 1.5);    // Declare box1
   Box Box2(8.5, 6.0, 2.0);    // Declare box2
   Box *ptrBox;                // Declare pointer to a class.

   // 保存第一个对象的地址
   ptrBox = &Box1;

   // 现在尝试使用成员访问运算符来访问成员
   cout << "Volume of Box1: " << ptrBox->Volume() << endl;

   // 保存第二个对象的地址
   ptrBox = &Box2;

   // 现在尝试使用成员访问运算符来访问成员
   cout << "Volume of Box2: " << ptrBox->Volume() << endl;
  
   return 0;
}
```
## 11.12. 静态成员
我们可以使用 static 关键字来把类成员定义为静态的。当我们声明类的成员为静态时，这意味着无论创建多少个类的对象，静态成员都只有一个副本。

~[static](./C++/cpp-static-members-2020-12-14.png)

静态成员在类的所有对象中是共享的。如果不存在其他的初始化语句，在创建第一个对象时，所有的静态数据都会被初始化为零。我们不能把静态成员的初始化放置在类的定义中，但是可以在类的外部通过使用范围解析运算符 :: 来重新声明静态变量从而对它进行初始化，如下面的实例所示。
```c++
#include <iostream>
 
using namespace std;
 
class Box
{
   public:
      static int objectCount;
      // 构造函数定义
      Box(double l=2.0, double b=2.0, double h=2.0)
      {
         cout <<"Constructor called." << endl;
         length = l;
         breadth = b;
         height = h;
         // 每次创建对象时增加 1
         objectCount++;
      }
      double Volume()
      {
         return length * breadth * height;
      }
   private:
      double length;     // 长度
      double breadth;    // 宽度
      double height;     // 高度
};
 
// 初始化类 Box 的静态成员
int Box::objectCount = 0;
 
int main(void)
{
   Box Box1(3.3, 1.2, 1.5);    // 声明 box1
   Box Box2(8.5, 6.0, 2.0);    // 声明 box2
 
   // 输出对象的总数
   cout << "Total objects: " << Box::objectCount << endl;
 
   return 0;
}
```

### 11.12.1. 静态成员函数
如果把函数成员声明为静态的，就可以把函数与类的任何特定对象独立开来。静态成员函数即使在类对象不存在的情况下也能被调用，静态函数只要使用类名加范围解析运算符 :: 就可以访问。

静态成员函数只能访问静态成员数据、其他静态成员函数和类外部的其他函数。

静态成员函数有一个类范围，他们不能访问类的 this 指针。您可以使用静态成员函数来判断类的某些对象是否已被创建。

> 静态成员函数与普通成员函数的区别：
> - 静态成员函数没有 this 指针，只能访问静态成员（包括静态成员变量和静态成员函数）.
> - 普通成员函数有 this 指针，可以访问类中的任意成员；而静态成员函数没有 this 指针。

## 11.13. 重载运算符和重载函数
C++ 允许在同一作用域中的某个函数和运算符指定多个定义，分别称为函数重载和运算符重载。
重载声明是指一个与之前已经在该作用域内声明过的函数或方法具有相同名称的声明，但是它们的参数列表和定义（实现）不相同。
当您调用一个重载函数或重载运算符时，编译器通过把您所使用的参数类型与定义中的参数类型进行比较，决定选用最合适的定义。选择最合适的重载函数或重载运算符的过程，称为重载决策。

### 11.13.1. 函数重载
```c++
#include <iostream>
using namespace std;
 
class printData
{
   public:
      void print(int i) {
        cout << "整数为: " << i << endl;
      }
 
      void print(double  f) {
        cout << "浮点数为: " << f << endl;
      }
 
      void print(char c[]) {
        cout << "字符串为: " << c << endl;
      }
};
 
int main(void)
{
   printData pd;
 
   // 输出整数
   pd.print(5);
   // 输出浮点数
   pd.print(500.263);
   // 输出字符串
   char c[] = "Hello C++";
   pd.print(c);
 
   return 0;
}
```

### 11.13.2. 运算符重载

## 11.14. 多态
多态按字面的意思就是多种形态。当类之间存在层次结构，并且类之间是通过继承关联时，就会用到多态。
下面的实例中，基类 Shape 被派生为两个类，如下所示：

```c++
#include <iostream> 
using namespace std;
 
class Shape {
   protected:
      int width, height;
   public:
      Shape( int a=0, int b=0)
      {
         width = a;
         height = b;
      }
      virtual int area()
      {
         cout << "Parent class area :" <<endl;
         return 0;
      }
};
class Rectangle: public Shape{
   public:
      Rectangle( int a=0, int b=0):Shape(a, b) { }
      int area ()
      { 
         cout << "Rectangle class area :" <<endl;
         return (width * height); 
      }
};
class Triangle: public Shape{
   public:
      Triangle( int a=0, int b=0):Shape(a, b) { }
      int area ()
      { 
         cout << "Triangle class area :" <<endl;
         return (width * height / 2); 
      }
};
// 程序的主函数
int main( )
{
   Shape *shape;
   Rectangle rec(10,7);
   Triangle  tri(10,5);
 
   // 存储矩形的地址
   shape = &rec;
   // 调用矩形的求面积函数 area
   shape->area();
 
   // 存储三角形的地址
   shape = &tri;
   // 调用三角形的求面积函数 area
   shape->area();
   
   return 0;
}
```
正如您所看到的，每个子类都有一个函数 area() 的独立实现。这就是多态的一般使用方式。有了多态，您可以有多个不同的类，都带有同一个名称但具有不同实现的函数，函数的参数甚至可以是相同的。

## 11.15. 虚函数

虚函数 是在基类中使用关键字 virtual 声明的函数。在派生类中重新定义基类中定义的虚函数时，会告诉编译器不要静态链接到该函数。

我们想要的是在程序中任意点可以根据所调用的对象类型来选择调用的函数，这种操作被称为动态链接，或后期绑定。

### 11.15.1. 纯虚函数

您可能想要在基类中定义虚函数，以便在派生类中重新定义该函数更好地适用于对象，但是您在基类中又不能对虚函数给出有意义的实现，这个时候就会用到纯虚函数。

```c++
class Shape {
   protected:
      int width, height;
   public:
      Shape( int a=0, int b=0)
      {
         width = a;
         height = b;
      }
      // pure virtual function
      virtual int area() = 0;
};
```

## 11.16. 数据抽象
数据抽象是指，只向外界提供关键信息，并隐藏其后台的实现细节，即只表现必要的信息而不呈现细节。

数据抽象是一种依赖于接口和实现分离的编程（设计）技术。

让我们举一个现实生活中的真实例子，比如一台电视机，您可以打开和关闭、切换频道、调整音量、添加外部组件（如喇叭、录像机、DVD 播放器），但是您不知道它的内部实现细节，也就是说，您并不知道它是如何通过缆线接收信号，如何转换信号，并最终显示在屏幕上。

现在，让我们言归正传，就 C++ 编程而言，C++ 类为数据抽象提供了可能。它们向外界提供了大量用于操作对象数据的公共方法，也就是说，外界实际上并不清楚类的内部实现。

### 11.16.1. 访问标签强制抽象

在 C++ 中，我们使用访问标签来定义类的抽象接口。一个类可以包含零个或多个访问标签：
- 使用公共标签定义的成员都可以访问该程序的所有部分。一个类型的数据抽象视图是由它的公共成员来定义的。
- 使用私有标签定义的成员无法访问到使用类的代码。私有部分对使用类型的代码隐藏了实现细节。
  
### 11.16.2. 数据抽象的好处
- 类的内部受到保护，不会因无意的用户级错误导致对象状态受损。
- 类实现可能随着时间的推移而发生变化，以便应对不断变化的需求，或者应对那些要求不改变用户级代码的错误报告。

```c++
#include <iostream>
using namespace std;
 
class Adder{
   public:
      // 构造函数
      Adder(int i = 0)
      {
        total = i;
      }
      // 对外的接口
      void addNum(int number)
      {
          total += number;
      }
      // 对外的接口
      int getTotal()
      {
          return total;
      };
   private:
      // 对外隐藏的数据
      int total;
};
int main( )
{
   Adder a;
   
   a.addNum(10);
   a.addNum(20);
   a.addNum(30);
 
   cout << "Total " << a.getTotal() <<endl;
   return 0;
}
```
## 11.17. 数据封装

所有的 C++ 程序都有以下两个基本要素：
- 程序语句（代码）：这是程序中执行动作的部分，它们被称为函数。
- 程序数据：数据是程序的信息，会受到程序函数的影响。

封装是面向对象编程中的把数据和操作数据的函数绑定在一起的一个概念，这样能避免受到外界的干扰和误用，从而确保了安全。数据封装引申出了另一个重要的 OOP 概念，即数据隐藏。

数据封装是一种把数据和操作数据的函数捆绑在一起的机制，数据抽象是一种仅向用户暴露接口而把具体的实现细节隐藏起来的机制。

通常情况下，我们都会设置类成员状态为私有（private），除非我们真的需要将其暴露，这样才能保证良好的封装性。

## 11.18. 接口 （抽象类）
接口描述了类的行为和功能，而不需要完成类的特定实现。

C++ 接口是使用抽象类来实现的，抽象类与数据抽象互不混淆，数据抽象是一个把实现细节与相关的数据分离开的概念。

设计抽象类（通常称为 ABC）的目的，是为了给其他类提供一个可以继承的适当的基类。抽象类不能被用于实例化对象，它只能作为接口使用。如果试图实例化一个抽象类的对象，会导致编译错误。

因此，如果一个 ABC 的子类需要被实例化，则必须实现每个虚函数，这也意味着 C++ 支持使用 ABC 声明接口。如果没有在派生类中重写纯虚函数，就尝试实例化该类的对象，会导致编译错误。

可用于实例化对象的类被称为具体类。

```c++
#include <iostream>
 
using namespace std;
 
// 基类
class Shape 
{
public:
   // 提供接口框架的纯虚函数
   virtual int getArea() = 0;
   void setWidth(int w)
   {
      width = w;
   }
   void setHeight(int h)
   {
      height = h;
   }
protected:
   int width;
   int height;
};
 
// 派生类
class Rectangle: public Shape
{
public:
   int getArea()
   { 
      return (width * height); 
   }
};
class Triangle: public Shape
{
public:
   int getArea()
   { 
      return (width * height)/2; 
   }
};
 
int main(void)
{
   Rectangle Rect;
   Triangle  Tri;
 
   Rect.setWidth(5);
   Rect.setHeight(7);
   // 输出对象的面积
   cout << "Total Rectangle area: " << Rect.getArea() << endl;
 
   Tri.setWidth(5);
   Tri.setHeight(7);
   // 输出对象的面积
   cout << "Total Triangle area: " << Tri.getArea() << endl; 
 
   return 0;
}
```
# 12. string类和标准模板库

## 12.1. 模板

模板是泛型编程的基础，泛型编程即以一种独立于任何特定类型的方式编写代码。

模板是创建泛型类或函数的蓝图或公式。库容器，比如迭代器和算法，都是泛型编程的例子，它们都使用了模板的概念。

每个容器都有一个单一的定义，比如 向量，我们可以定义许多不同类型的向量，比如 vector <int> 或 vector <string>。

### 12.1.1. 函数模板

```c++
template <typename type> 
ret-type func-name(parameter list)
{
   // 函数的主体
}
```

```c++
#include <iostream>
#include <string>
 
using namespace std;
 
template <typename T>
inline T const& Max (T const& a, T const& b) 
{ 
    return a < b ? b:a; 
} 
int main ()
{
 
    int i = 39;
    int j = 20;
    cout << "Max(i, j): " << Max(i, j) << endl; 
 
    double f1 = 13.5; 
    double f2 = 20.7; 
    cout << "Max(f1, f2): " << Max(f1, f2) << endl; 
 
    string s1 = "Hello"; 
    string s2 = "World"; 
    cout << "Max(s1, s2): " << Max(s1, s2) << endl; 
 
   return 0;
}
```

### 12.1.2. 类模板

```c++
template <class type> class class-name {
.
.
.
}
```

## 12.2. 标准模板库
C++ STL（标准模板库）是一套功能强大的 C++ 模板类，提供了通用的模板类和函数，这些模板类和函数可以实现多种流行和常用的算法和数据结构，如向量、链表、队列、栈。
C++ 标准模板库的核心包括以下三个组件：

1. 容器（Containers）：容器是用来管理某一类对象的集合。C++ 提供了各种不同类型的容器，比如 deque、list、vector、map 等。
2. 算法（Algorithms）：	算法作用于容器。它们提供了执行各种操作的方式，包括对容器内容执行初始化、排序、搜索和转换等操作
3. 迭代器（iterators）：迭代器用于遍历对象集合的元素。这些集合可能是容器，也可能是容器的子集。

```c++
#include <iostream>
#include <vector>
using namespace std;
 
int main()
{
   // 创建一个向量存储 int
   vector<int> vec; 
   int i;
 
   // 显示 vec 的原始大小
   cout << "vector size = " << vec.size() << endl;
 
   // 推入 5 个值到向量中
   for(i = 0; i < 5; i++){
      vec.push_back(i);
   }
 
   // 显示 vec 扩展后的大小
   cout << "extended vector size = " << vec.size() << endl;
 
   // 访问向量中的 5 个值
   for(i = 0; i < 5; i++){
      cout << "value of vec [" << i << "] = " << vec[i] << endl;
   }
 
   // 使用迭代器 iterator 访问值
   vector<int>::iterator v = vec.begin();
   while( v != vec.end()) {
      cout << "value of v = " << *v << endl;
      v++;
   }
 
   return 0;
}
```

C++ 标准库可以分为两部分：

- 标准函数库： 这个库是由通用的、独立的、不属于任何类的函数组成的。函数库继承自 C 语言
- 面向对象类库： 这个库是类及其相关函数的集合。
# 13. 输入、输出和文件

# 14. 其他

## 14.1. Typedefs

定义一种类型的别名，而不只是简单的宏替换。可以用作同时声明指针型的多个对象

## 14.2. 预处理

预处理器是一些指令，指示编译器在实际编译之前所需完成的预处理。

所有的预处理器指令都是以井号（#）开头，只有空格字符可以出现在预处理指令之前。预处理指令不是 C++ 语句，所以它们不会以分号（;）结尾。

C++ 还支持很多预处理指令，比如 #include、#define、#if、#else、#line 等，让我们一起看看这些重要指令。




## 14.3. 有用的资源

- [C++ FAQ](http://www.sunistudio.com/cppfaq/):C++ 常见问题
- [Free Country ](https://www.thefreecountry.com/sourcecode/cpp.shtml):Free Country 提供了免费的 C++ 源代码和 C++ 库，这些源代码和库涵盖了压缩、存档、游戏编程、标准模板库和 GUI 编程等 C++ 编程领域。


```c++

```

# 15. 参考
1. [菜鸟教程：C++ 教程](https://www.runoob.com/cplusplus/cpp-tutorial.html)
2. 