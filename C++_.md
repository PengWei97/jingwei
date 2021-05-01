# 1. 复合类型

## 1.1. 数组的的替代品

模板类vector和array是数组的替代品。

### 1.1.1. 模板类vector

# 2. 函数--c++的编程模板

介绍如何定义函数、给函数传递信息以及从函数那里获得信息。函数是如何工作的，然后着重介绍如何使用函数来处理数组、字符串和结构，最后介绍递归和函数指针。

## 2.1. 基本知识

- 提供函数定义；
- 提供函数原型；
- 调用函数。

库函数是已经定义和编译好的函数，同时可以使用标准库头文件提供其原型，因此只需正确地调用这种函数即可。

```cpp
// calling.cpp -- defining, prototyping, and calling a function
#include <iostream>

void simple ();
// function prototype

int main ()
{
  using namespace std;
  cout << "main() will call the simple() function : \n";
  simple(); //function call
  cout << "main() is finished with the simple function . \n"
  // cin.get();
  return 0;
}

// function definition
void simple()
{
  using namespace std;
  cout << "I'm but a simple function.\n";  
}
```

### 2.1.1. 定义函数
可以将函数分成两类：没有返回值的函数和有返回值的函数。没有返回值的函数被称为void函数

### 2.1.2. 函数原型
原型描述了函数到编译器的接口，也就是说，它将函数返回值的类型（如果有的话）以及参数的类型和数量告诉编译器。

## 2.2. 函数参数和按值传递
C++通常按值传递参数，这意味着将数值参数传递给函数，而后者将其赋给一个新的变量。

```cpp
RankFourTensor
GrainTrackerElasticity::newGrain(unsigned int new_grain_id)
{
  EulerAngles angles;
  // Public Member Functions
  // return RealVectorValue(phi1, Phi, phi2)

  if (new_grain_id < _euler.getGrainNum())
    angles = _euler.getEulerAngles(new_grain_id);
    // _angle.size(); // The number of elements that can currently be stored in the array.
    // 若为bicrystal,则_euler,getGrainNum()=2,
      // angles = _euler.getEulerAngles(0);
      // 赋予三个欧拉角给angles
  else
  {
    if (_random_rotations)
      angles.random();
    else
      mooseError("GrainTrackerElasticity has run out of grain rotation data.");
  }

  RankFourTensor C_ijkl = _C_ijkl;
  C_ijkl.rotate(RotationTensor(RealVectorValue(angles)));
  // _R = RotationTensor(RealVectorValue(angles));

  return C_ijkl;
}
```

## 2.3. const在函数中

### 2.3.1. 函数后加const
如果把不改变数据成员的函数都加上const关键字进行标识，显然，可提高程序的可读性。其实，它还能提高程序的可靠性，已定义成const的成员函数，一旦企图修改数据成员的值，则编译器按错误处理。

后面加 const表示函数不可以修改class的成员

# 3. 函数探幽

- 内联函数
- 引用变量
- 如何按引用传递函数参量
- 默认函数 
- 函数重载
- 函数模板
- 函数模板具体化
- 
## 3.1. 内联函数
内联函数是C++为提高程序运行速度所做的一项改进。常规函数和内联函数之间的主要区别不在于编写方式，而在于C++编译器如何将它们组合到程序中。要了解内联函数与常规函数之间的区别，必须深入到程序内部。

编译过程的最终产品是可执行程序——由一组机器语言指令组成。运行程序时，操作系统将这些指令载入到计算机内存中，因此每条指令都有特定的内存地址。计算机随后将逐步执行这些指令。有时（如有循环或分支语句时），将跳过一些指令，向前或向后跳到特定地址。常规函数调用也使程序跳到另一个地址（函数的地址），并在函数结束时返回。

C++内联函数提供了另一种选择。内联函数的编译代码与其他程序代码“内联”起来了。也就是说，编译器将使用相应的函数代码替换函数调用。对于内联代码，程序无需跳到另一个位置处执行代码，再跳回来。因此，内联函数的运行速度比常规函数稍快，但代价是需要占用更多内存。如果程序在10个不同的地方调用同一个内联函数，则该程序将包含该函数代码的10个副本（参见图8.1）。

应有选择地使用内联函数。如果执行函数代码的时间比处理函数调用机制的时间长，则节省的时间将只占整个过程的很小一部分。如果代码执行时间很短，则内联调用就可以节省非内联调用使用的大部分时间。另一方面，由于这个过程相当快，因此尽管节省了该过程的大部分时间，但节省的时间绝对值并不大，除非该函数经常被调用。

## 3.2. 引用变量
引用是已定义的变量的别名（另一个名称）。引用变量的主要用途是用作函数的形参。通过将引用变量用作参数，函数将使用原始数据，而不是其副本。这样除指针之外，引用也为函数处理大型结构提供了一种非常方便的途径，同时对于设计类来说，引用也是必不可少的。

### 3.2.1. 创建引用变量
C++给&符号赋予了另一个含义，将其用来声明引用。

```cpp
int rats;
int & rodents = rats; // make rodents an alias for rats
```
其中，&不是地址运算符，而是类型标识符的一部分。就像声明中的char*指的是指向char的指针一样，int &指的是指向int的引用。

引用经常被用作函数参数，使得函数中的变量名成为调用程序中的变量的别名。这种传递参数的方法称为按引用传递。按引用传递允许被调用的函数能够访问调用函数中的变量。C++新增的这项特性是对C语言的超越，C语言只能按值传递。

将引用参数声明为常量数据的引用的理由有三个：
- 使用const可以避免无意中修改数据的编程错误；
- 使用const使函数能够处理const和非const实参，否则将只能接受非const数据；
- 使用const引用使函数能够正确生成并使用临时变量。


## 3.3. 默认参数

默认参数指的是当函数调用中省略了实参时自动使用的一个值。

## 3.4. 函数重载

默认参数让您能够使用不同数目的参数调用同一个函数，而函数多态（函数重载）让您能够使用多个同名的函数。术语“多态”指的是有多种形式，因此函数多态允许函数可以有多种形式。类似地，术语“函数重载”指的是可以有多个同名的函数，因此对名称进行了重载。这两个术语指的是同一回事，但我们通常使用函数重载。

函数重载的关键是函数的参数列表——也称为函数特征标（function signature）。如果两个函数的参数数目和类型相同，同时参数的排列顺序也相同，则它们的特征标相同，而变量名是无关紧要的。C++允许定义名称相同的函数，条件是它们的特征标不同。如果参数数目和/或参数类型不同，则特征标也不同。

## 3.5. 函数模板

函数模板是通用的函数描述，也就是说，它们使用泛型来定义函数，其中的泛型可用具体的类型（如int或double）替换。通过将类型作为参数传递给模板，可使编译器生成该类型的函数。由于模板允许以泛型（而不是具体类型）的方式编写程序，因此有时也被称为通用编程。由于类型是用参数表示的，因此模板特性有时也被称为参数化类型（parameterized types）。

C++的函数模板功能能自动完成这一过程，可以节省时间，而且更可靠。函数模板允许以任意类型的方式来定义函数。例如，可以这样建立一个交换模板：

```cpp
template <typename AnyType>
void 
Swap(AnyType &a, AnyType &b)
{
  AnyType temp;
  temp = a;
  a = b;
  b = temp;
}

template <typename T>
void
GrainDataTracker<T>::newGrainCreated(unsigned int new_grain_id)
{
  if (_grain_data.size() <= new_grain_id)
    _grain_data.resize(new_grain_id + 1);

  _grain_data[new_grain_id] = newGrain(new_grain_id);
}
```
第一行指出，要建立一个模板，并将类型命名为AnyType。关键字template和typename是必需的，除非可以使用关键字class代替typename。另外，必须使用尖括号。类型名可以任意选择（这里为AnyType），只要遵守C++命名规则即可；许多程序员都使用简单的名称，如T。模板并不创建任何函数，而只是告诉编译器如何定义函数。

typename关键字使得参数AnyType表示类型这一点更为明显；然而，有大量代码库是使用关键字class开发的。在这种上下文中，这两个关键字是等价的。


### 3.5.1. 重载的模板

需要多个对不同类型使用同一种算法的函数时，可使用模板。然而，并非所有的类型都使用相同的算法。为满足这种需求，可以像重载常规函数定义那样重载模板定义。和常规重载一样，被重载的模板的函数特征标必须不同。

为进一步了解模板，必须理解术语实例化和具体化。记住，在代码中包含函数模板本身并不会生成函数定义，它只是一个用于生成函数定义的方案。编译器使用模板为特定类型生成函数定义时，得到的是模板实例（instantiation）。


# 4. C++中代码重用

模板分为函数模板和类模板两种。函数模板是用于生成函数的，类模板则是用于生成类的。

## 4.1. 类模板

[blog-https](https://blog.csdn.net/qq_34665703/article/details/116003801)


> - 一个类模板允许用户为类定义一种模式，使得类中的某些数据成员、默写成员函数的参数、某些成员函数的返回值，能够取任意类型（包括系统预定义的和用户自定义的）。


> - c++中 `类模板` 的引入是为了提高代码的重用性。模板是创建泛型类或函数的蓝图或公式。继承（公有、私有或保护）和包含并不总是能够满足重用代码的需要。容器类设计用来存储其他对象或数据类型。可以定义专门用于存储double值或string对象的Stack类。然而，与其编写新的类声明，不如编写一个泛型（即独立于类型的）栈，然后将具体的类型作为参数传递给这个类。这样就可以使用通用的代码生成存储不同类型值的栈。

> - C++的类模板为生成通用的类声明提供了一种更好的方法。模板提供参数化（parameterized）类型，即能够将类型名作为参数传递给接收方来建立类或函数。

1. 类模板 vs 模板类
  > 类模板是模板，而模板类是具体的类。由函数模板实例化而得到的函数称为模板函数。由类模板实例化得到的类叫模板类。

### 4.1.1. 定义类模板

template意思是“模板”，该关键字告诉编译器，将要定义一个模板。在template后面的尖括号内的内容为模板的参数表列，关键字class（也可以用typename）表示其后面的是类型参数。在建立类对象时，如果将实际类型指定为int型，编译系统就会用int取代所有的T，如果指定为float型，就用float取代所有的T。这样就能实现“一类多用”。

1. 关键字class vs typename
  > 使用class并不意味着Type(T)必须是一个类；而只是表明Type(T)是一个通用的类型说明符，在使用模板时，将使用实际的类型替换它。较新的C++实现允许在这种情况下使用不太容易混淆的关键字typename代替class

```cpp
template <typename T> //声明一个模板，虚拟类型名为T。注意：这里没有分号。
class GrainDataTracker : public GrainTracker //类模板名为GrainDataTracker
{
public:
  const T & getData(unsigned int grain_id) const;

protected:
  virtual T newGrain(unsigned int new_grain_id) = 0;

};

template <typename T>
const T &
GrainDataTracker<T>::getData(unsigned int grain_id) const
{
  mooseAssert(grain_id < _grain_data.size(), "Requested data for invalid grain index.");
  return _grain_data[grain_id];
}
```
### 4.1.2. 使用模板类

类模板的使用实际上是将类模板实例化成一个具体的类，它的格式为：类名<实际的类型>。即需要声明一个类型为模板类的对象，方法是使用所需的具体类型替换泛型名。模板类是类模板实例化后的一个产物。说个形象点的例子吧。我把类模板比作一个做饼干同的模子，而模板类就是用这个模子做出来的饼干，至于这个饼干是什么味道的就要看你自己在实例化时用的是什么材料了，你可以做巧克力饼干，也可以做豆沙饼干，这些饼干的除了材料不一样外，其他的东西都是一样的了。

```cpp
class GrainTrackerElasticity : public GrainDataTracker<RankFourTensor>
{
public:
  static InputParameters validParams();


protected:
  RankFourTensor newGrain(unsigned int new_grain_id);

};

```

泛型标识符——例如这里的Type——称为类型参数（type parameter），这意味着它们类似于变量，但赋给它们的不能是数字，而只能是类型。
类型参数可以有一个或多个,修改GrainDataTracker，成为template <typename T1,typename T2>

### 4.1.3. 类模板与派生

1. 类模板从普通类中派生
```cpp
template <typename T> //声明一个模板，虚拟类型名为T。注意：这里没有分号。
class GrainDataTracker : public GrainTracker //类模板名为GrainDataTracker
{
public:

protected:
};
```
2. 普通类从类模板中派生类
```cpp
class GrainTrackerElasticity : public GrainDataTracker<RankFourTensor>
{
public:

protected:

};
```
3. ……

### 4.1.4. 使用多个类型参数

模板可以包含多个类型参数。例如，假设希望类可以保存两种值，则可以创建并使用类模板来保存两个不同的值。

### 4.1.5. 模板声明与定义都在头文件内

通常情况下，你会在.h文件中声明函数和类，而将它们的定义放置在一个单独的.cpp文件中。但是在使用模板时，这种习惯性做法将变得不再有用，因为当实例化一个模板时，编译器必须看到模板确切的定义，而不仅仅是它的声明。因此，最好的办法就是将模板的声明和定义都放置在同一个.h文件中。这就是为什么所有的STL头文件都包含模板定义的原因。


### 4.1.6. 类模板的作用

模板是泛型编程的基础，所谓泛型编程就是用独立于任何特定类型的方式编写代码。类是对象的抽象，而模板又是类的抽象，也就用模板能定义出具体类。

在c++里，常说的多态一般分为两种：
- 一种是运行时的多态，也就是虚函数体现的多态
- 另一种是编译时的多态，也就是泛型编程的多态，体现在参数的多态


### 4.1.7. 参考

1. 《C++ Primer Plus》
2. [c++ 类模板和模板类的深入解析](https://www.cnblogs.com/wfwenchao/articles/3791096.html)
3. [C++ 模板常见特性（函数模板、类模板）
](https://zhuanlan.zhihu.com/p/101898043),知网这篇文章讲的非常详细。
4. [模板声明与定义要放在同一文件中？](https://blog.csdn.net/lichengyu/article/details/6792135)
