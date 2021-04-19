- [1. Moose begin](#1-moose-begin)
  - [1.1. 创建app](#11-创建app)
  - [1.2. Debugging](#12-debugging)
    - [1.2.1. Debug Executable](#121-debug-executable)
    - [1.2.2. Debuggers](#122-debuggers)
  - [1.3. MOOSE Test System](#13-moose-test-system)
    - [1.3.1. Testing Philosophy](#131-testing-philosophy)
    - [1.3.2. TestHarness](#132-testharness)
  - [1.4. update Moose](#14-update-moose)
- [2. github](#2-github)
  - [2.1. 2.0 ubuntu创建ssh公钥](#21-20-ubuntu创建ssh公钥)
  - [2.2. git查看/修改用户名和邮箱地址](#22-git查看修改用户名和邮箱地址)
  - [2.3. 创建远程仓库](#23-创建远程仓库)
  - [2.4. 同步](#24-同步)
- [3. crystal plastic](#3-crystal-plastic)
  - [3.1. UserObject based Crystal Plasticity System](#31-userobject-based-crystal-plasticity-system)
  - [3.2. materials/ComputeElasticityTensorCP](#32-materialscomputeelasticitytensorcp)
    - [3.2.1. ComputeElasticityTensorCP](#321-computeelasticitytensorcp)
    - [3.2.2. ComputeElasticityTensor](#322-computeelasticitytensor)
    - [3.2.3. ComputeRotatedElasticityTensorBase](#323-computerotatedelasticitytensorbase)
    - [3.2.4. ComputeElasticityTensorBase](#324-computeelasticitytensorbase)
- [4. phase field](#4-phase-field)
  - [4.1. materals/ComputePolycrystalElasticityTensor](#41-materalscomputepolycrystalelasticitytensor)
    - [4.1.1. ComputePolycrystalElasticityTensor](#411-computepolycrystalelasticitytensor)
    - [4.1.2. ComputeElasticityTensorBase](#412-computeelasticitytensorbase)
- [5. Tensor_mechanics](#5-tensor_mechanics)
  - [5.1. Introduction](#51-introduction)
  - [5.2. 探索功能并开始建模](#52-探索功能并开始建模)
    - [5.2.1. 即插即用模块概述-张量模块](#521-即插即用模块概述-张量模块)
    - [5.2.2. 应变材料](#522-应变材料)
  - [5.3. 材料模块--张量力学](#53-材料模块--张量力学)
    - [5.3.1. 应变](#531-应变)
    - [5.3.2. 应力](#532-应力)
    - [5.3.3. 弹性模量](#533-弹性模量)
- [6. Materials](#6-materials)
  - [6.1. MaterialProperty](#61-materialproperty)
- [7. c++](#7-c)
- [8. 耦合](#8-耦合)
  - [8.1. 基于ComputeElasticityTensorCP来耦合.](#81-基于computeelasticitytensorcp来耦合)
- [9. 建模](#9-建模)
  - [9.1. 多晶建模中欧拉角文件生成](#91-多晶建模中欧拉角文件生成)
    - [9.1.1. matlab-人工欧拉角赋予](#911-matlab-人工欧拉角赋予)
    - [9.1.2. matlab-随机赋予欧拉角](#912-matlab-随机赋予欧拉角)

# 1. Moose begin

## 1.1. 创建app

```shell
~/projects/moose/scripts/stork.sh monkey
```

```shell
To store your changes on github:
    1. log in to your account
    2. Create a new repository named monkey
    3. in this terminal run the following commands:
         cd /home/xia/projects/monkey
         git remote add origin https://github.com/YourGitHubUserName/monkey
         git commit -m "initial commit"
         git push -u origin main
```

## 1.2. Debugging

在开发基于MOOSE的应用程序时，您可能需要使用调试器。 调试器将允许您在某些时候停止程序（或在发生诸如内存段错误之类的事情时）。 一旦停止，您就可以仔细地逐步执行该程序，并在检查过程中检查变量值以找到问题的根源。  

特别是，如果您看到“ Segfault”或“ Signal 11”，则意味着该抽出调试器了。 一旦达到段错误，任何调试器将自动停止，从而向您确切显示发生无效内存访问的位置。

```shell
METHOD=dbg make -j 8
```

### 1.2.1. Debug Executable

调试所有内容的第一步是构建调试可执行文件。 默认情况下，基于MOOSE的应用程序以“优化”（优化）模式构建。 这样可以确保最快的解决方案。 但是，优化的可执行文件缺少许多对调试器有用的信息，并且优化过程本身可能导致代码重新排序（甚至跳过！），从而使单步执行程序变得困难。

要构建适合调试的可执行文件，您需要将METHOD环境变量设置为dbg。 您可以在环境中导出它，但是使用UNIX快捷方式通常更简单，该快捷方式允许您在运行命令的同时定义环境变量，如下所示：

### 1.2.2. Debuggers

For debugging MOOSE-based applications we recommend lldb if you're using the clang compiler (default on Mac OSX) and gdb for the gcc compiler (default on Linux).

GDB是一个由GNU开源组织发布的、UNIX/LINUX操作系统下的、基于命令行的、功能强大的程序调试工具。 对于一名Linux下工作的c/c++程序员，gdb是必不可少的工具；

能够让用户在程序运行时观察程序的内部结构和内存的使用情况。

一般来说，GDB主要帮助你完成下面四个方面的功能：
> 按照自定义的方式启动运行需要调试的程序。
> 可以使用指定位置和条件表达式的方式来设置断点。
> 程序暂停时的值的监视。
> 动态改变程序的执行环境。

```shell
l # 查看程序源代码
r # 运行程序
b 10 # 在十行设置断点
quit #退出gdb
help # 帮助
start

```

gdb can be run with a similar command:

```shell
gdb --args ./yourapp-dbg -i inputfile.i
```

Once this is done, your executable will be loaded but won't start running. This is an opportune time to set breakpoints. We usually recommmend setting a breakpoint on MPI_Abort using the b command:

```shell
b MPI_Abort
```

If a breakpoint (or fault) is reached: I recommend first using the bt command to output a "back-trace" so you can see exactly what the current call-stack looks like to figure out where you are.

Another useful command is p (for 'print') which allows you to print out the value of a variable. Just do:

```shell
p variablename
```
## 1.3. MOOSE Test System

MOOSE comes with a rich system for testing MOOSE-based applications.

### 1.3.1. Testing Philosophy

在90年代末和00年代初，“极限编程”和“测试驱动开发”的想法真正推动了自动化测试。 最近，在持续集成和持续部署系统中使用了自动化测试，以使开发人员能够不断集成变更，同时仍然能够及时交付有效的产品。 最近，像GitHub这样的网站已允许在“拉取请求”中对每项更改进行测试_before_集成。

Within MOOSE there are three different testing ideas:

1. The "tests": which are typically "Regression Tests" consisting of input files and known good outputs ("gold" files).
2. Unit tests that test the funcationality of small seperable pieces
3. The TestHarness: a piece of software that was written to _run_ tests and aggregate the results.

MOOSE uses tests to do both continuous integration (CI) and continuous deployment (CD). Each and every change to MOOSE is tested across multiple operating systems, in parallel, with threads, in debug, with Valgrind and several other configurations. On average, our testing clusters are running ~5 Million tests every week as we develop the Framework and applications

### 1.3.2. TestHarness

The TestHarness is a piece of Python software that is responsible for finding and running tests. You can read more about it on the [TestHarness](https://mooseframework.inl.gov/python/TestHarness.html) page.


## 1.4. update Moose

```shell
conda activate moose
# conda update --all

cd ~/projects/moose
git fetch origin
git rebase origin/master
```

```shell
cd ~/projects/YourAppName
make clobberall
make -j4
./run_tests -j4
```









# 2. github

[Ubuntu 20安装Qv2ray 教程](https://iguge.app/helper/?p=257)



## 2.1. 2.0 ubuntu创建ssh公钥

```shell

```

```shell
ssh-keygen -t rsa -C "1248110286@qq.com"
cat ~/.ssh
more id_rsa.pub #复制文件中的所有内容
ssh -T git@github.com #测试验证
```

## 2.2. git查看/修改用户名和邮箱地址

1. 用户名和邮箱地址的查看
   - > git config user.name
   - > git config user.email

2. 修改用户名和邮箱地址
   - > git config --global user.name "username"
   - > git config --global user.name "email"
   - > PengWei97

## 2.3. 创建远程仓库

> git remote add origin git@github.com:PengWei97/monkey.git

这会将 `origin` 与远程仓库相关联

你可以使用如下命令还修改 `remote's URL`
> git romote set-url <REMOTE_URL>

## 2.4. 同步

push an existing repository from the command line

```shell
git remote add origin git@github.com:PengWei97/luwu.git
git branch -M main
git push -u origin main
```

同步某个文件

```shell
git add crystal.i
git commit -m "2011.11.22"
git push -u origin main
```
# 3. crystal plastic

## 3.1. UserObject based Crystal Plasticity System

计算晶体塑性本构的算法将如下网站：
[UserObject based Crystal Plasticity System](https://mooseframework.inl.gov/source/materials/crystal_plasticity/FiniteStrainUObasedCP.html)  

## 3.2. materials/ComputeElasticityTensorCP


### 3.2.1. ComputeElasticityTensorCP
ComputeElasticityTensorCP : public ComputeElasticityTensor

1. 

```c++
// ComputeElasticityTensorCP.h

  class ComputeElasticityTensorCP : public ComputeElasticityTensor

  virtual void computeQpElasticityTensor() override;
  // 定义成员函数，用于计算旋转之后的弹性模量
  // 覆写掉ComputeElasticityTensor基类中'computeQpElasticityTensor()'成员函数定义,之后在*.C中重新定义

  virtual void assignEulerAngles();
  // 定义欧拉角赋予

  MaterialProperty<RealVectorValue> & _Euler_angles_mat_prop;
  // 定义实数值的材料性质

  MaterialProperty<RankTwoTensor> & _crysrot;
  // 二阶张量的材料性质

  RotationTensor _R;
  // 旋转矩阵

// ComputeElasticityTensorCP.C
  _Cijkl.rotate(_R.transpose());
  // 在构造函数中，将旋转之后的弹性模量旋转回来

  void
   ComputeElasticityTensorCP::computeQpElasticityTensor()
   {
     // Properties assigned at the beginning of every call to material calculation
     assignEulerAngles();

     _R.update(_Euler_angles_mat_prop[_qp]);

     _crysrot[_qp] = _R.transpose();
     _elasticity_tensor[_qp] = _Cijkl;
     _elasticity_tensor[_qp].rotate(_crysrot[_qp]);
    //  旋转之后的弹性模量
   }
```


### 3.2.2. ComputeElasticityTensor

ComputeElasticityTensorTempl : public ComputeRotatedElasticityTensorBaseTempl<is_ad>
ComputeElasticityTensorTempl 是一个模板类。
通常使用template来声明。告诉编译器，碰到T不要报错，表示一种泛型.

1. 先将input文件中弹性模量赋予给C_ijkl
2. 根据旋转矩阵旋转弹性模量 `_Cijkl.rotate(R)`
3. 定义了computeQpElasticityTensor，将`_elasticity_tensor[_qp] = _Cijkl`
```c++
// ComputeElasticityTensor.h
   template <bool is_ad>
   class ComputeElasticityTensorTempl : public ComputeRotatedElasticityTensorBaseTempl<is_ad>

   virtual void computeQpElasticityTensor() override;
   // 覆写掉 ComputeElasticityTensor 基类中'computeQpElasticityTensor()'成员函数定义，覆盖了ComputeElasticityTensorBase中的computeQpElasticityTensor()函数

   RankFourTensor _Cijkl;
  //  定义_Cijkl为四阶张量，成员变量的定义方式

  using ComputeRotatedElasticityTensorBaseTempl<is_ad>::isParamValid;
  // 需要使用基类protected中的成员函数

// ComputeElasticityTensor.C
   template <bool is_ad>
   void
   ComputeElasticityTensorTempl<is_ad>::computeQpElasticityTensor()
   {
     // Assign elasticity tensor at a given quad point
     _elasticity_tensor[_qp] = _Cijkl;
   }
```


### 3.2.3. ComputeRotatedElasticityTensorBase
ComputeRotatedElasticityTensorBaseTempl : public ComputeElasticityTensorBaseTempl<is_ad>

ComputeRotatedElasticityTensorBase定义了
1. _Euler_angles：需要input输入
2. _rotation_matrix：根据欧拉角计算

```c++
// ComputeRotatedElasticityTensorBase.h
protected:
  RealVectorValue _Euler_angles;
  // input文件输入三个欧拉角
  const RealTensorValue _rotation_matrix;
  // 通过欧拉角计算旋转矩阵

// ComputeRotatedElasticityTensorBase.C
_rotation_matrix(this->isParamValid("rotation_matrix")
                    ? this->template getParam<RealTensorValue>("rotation_matrix")
                    : RealTensorValue(1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0))
                    // isParamValid 是一个方法，返回一个bool值
                    // this->指针，调用当前类下的非静态成员
```

### 3.2.4. ComputeElasticityTensorBase
class ComputeElasticityTensorBaseTempl : public DerivativeMaterialInterface<Material>,public GuaranteeProvider

这个模板基类里面定义了：
1. _base_name
2. _elasticity_tensor_name
3. _elasticity_tensor
4. _effective_stiffness
5. _prefactor_function


```c++
// ComputeElasticityTensorBase.h
   virtual void computeQpProperties();
   virtual void computeQpElasticityTensor() = 0;
  //  这个需要被继承时override

   /// Base name of the material system
   const std::string _base_name;

   std::string _elasticity_tensor_name;

   GenericMaterialProperty<RankFourTensor, is_ad> & _elasticity_tensor;
  //  定义一个结构体,RankFourTensor：_elasticity_tensor
   GenericMaterialProperty<Real, is_ad> & _effective_stiffness;
  //  定义一个结构体,Real：_effective_stiffness

   /// prefactor function to multiply the elasticity tensor with
   const Function * const _prefactor_function;

// 
```

# 4. phase field


## 4.1. materals/ComputePolycrystalElasticityTensor

### 4.1.1. ComputePolycrystalElasticityTensor

`ComputeRotatedElasticityTensorBase` 和 `ComputePolycrystalElasticityTensor` 都继承自  `ComputeElasticityTensorBase` 不过前者是类模板继承，后者不是

```c++
// ComputePolycrystalElasticityTensor.h
  class ComputePolycrystalElasticityTensor : public ComputeElasticityTensorBase
  #include "ComputeElasticityTensorBase.h"
  #include "GrainDataTracker.h"
  class ComputePolycrystalElasticityTensor : public ComputeElasticityTensorBase

  virtual void computeQpElasticityTensor();
// 没有添加
// 如果加入一个override是否正确，可以正常运行

// ComputePolycrystalElasticityTensor.C
  #include "ComputePolycrystalElasticityTensor.h"
  #include "RotationTensor.h"

```

### 4.1.2. ComputeElasticityTensorBase

# 5. Tensor_mechanics

## 5.1. Introduction

张量力学模块是是一个用于求解连续介质力学问题的工具库。它提供了一个简单方法来实现先进的力学模型。
  - 即插即用的设计使得用户可以将相关的物理原理结合起来，以进行特定的模拟
  - 张量的实现与数学理想想匹配
  - 添加新物理对象的简单程序
张量力学模块可以被用于模拟线形和有限应变力学，包括弹性和Cosserat弹性，塑性和微观塑性，蠕变，以及开裂和性能退化照成的损伤。

## 5.2. 探索功能并开始建模
张量力学模块用与各种纯力学模拟和与其他物理模块相互耦合的模拟，包括：热传递，相场，接触，多孔流和XFEM模型；使用MOOSE组合模拟对多个物理模块进行仿真。

### 5.2.1. 即插即用模块概述-张量模块

张量力学模块使用即插即用系统，其中残差方程使用的主要张量在moose单个材料类中被定义。在张量力学中使用插拔式方法要求至少需要三个独立的材料类来完全描述材料模型。
三个张量必须被定义对于任何力学问题：
 1. 应变 $\epsilon$ 或者 应变增量 $\delta\epsilon$
 2. 弹性模量 $C$ 
 3. 应力 $\sigma$ 
 4. 可选择的张量包括：stress-free stain((eigenstrain, 本征应变) $\epsilon_0$ 和 additional stress $\sigma_0$
  
有时，用户可以在单个块（block）中定义多个力学性质。因此，所有材料特性都可以输入参数base_name定义的名称为前缀。

### 5.2.2. 应变材料

去创建应变（$\epsilon$）或者应变增量的材料基类是 `ComputeStrainBase`; 这个类是纯虚类，要求所有的派生类去覆盖（override）成员函数 `computeQpProperties()`.对于所有的应变，这个基类定义塑性 `total_strain`.对于增量应变，无论是有限应变还是小应变，计算应变基类定义属性 `strian_rate,strain_increment, rotation_increment, and deformation_gradient`. 在应变网页中提供了不同应变范式的讨论。

对于小应变，使用 [ComputeSmallStrain](#531-应变)，其中 $\epsilon = (\nabla u+\nabla u^T)/2$.

对于有限应变问题，使用 [ComputeFiniteStrain](#531-应变)



## 5.3. 材料模块--张量力学

### 5.3.1. 应变

### 5.3.2. 应力

### 5.3.3. 弹性模量



# 6. Materials

## 6.1. MaterialProperty

```c++
struct GenericMaterialPropertyStruct< T, is_ad >
// 结构体

GenericMaterialProperty = typename GenericMaterialPropertyStruct< T, is_ad >::type
 
```

# 7. c++


# 8. 耦合

## 8.1. 基于ComputeElasticityTensorCP来耦合.

关键在于ComputeElasticityTensorCP中输入欧拉角计算所得旋转矩阵

```c++
_R.update(_Euler_angles_mat_prop[_qp]);
_crysrot[_qp] = _R.transpose();

auto grain_id = op_to_grains[op_index];
Real h = (1.0 + std::sin(libMesh::pi * ((*_vals[op_index])[_qp] - 0.5))) / 2.0;
_elasticity_tensor[_qp] += _grain_tracker.getData(grain_id) * h;
```

能不能将本应该在GrainTrackerElasticity赋予欧拉角的旋转矩阵,在材料的弹性模块中被赋予.

# 9. 建模

## 9.1. 多晶建模中欧拉角文件生成

### 9.1.1. matlab-人工欧拉角赋予

> 基底为44 45 46°欧拉角，人工赋予14个欧拉角为90°

1. 挑选unique_grain序号作为人工赋予的90°欧拉角

[unique_grain](./Matlab/Input/unique_grain.xlsx)

ps:赋予的时候，挑选的序号需要+1

1. 使用matlab脚本生成*.tex文件

[euler_45_90.m](./Matlab/script/euler_45_90.m)

1. 之后生成 `grn_6400_rand_2D` 文件

[grn_6400_rand_2D.tex](./Matlab/Output/grn_6400_rand_2D.tex)
 

### 9.1.2. matlab-随机赋予欧拉角

> 使用rand随机赋予欧拉角，对1600个晶粒

