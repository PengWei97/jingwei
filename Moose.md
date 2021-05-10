- [1. Moose begin](#1-moose-begin)
  - [1.1. 创建app](#11-创建app)
  - [1.2. Debugging](#12-debugging)
    - [1.2.1. Debug Executable](#121-debug-executable)
    - [1.2.2. Debuggers](#122-debuggers)
  - [1.3. MOOSE Test System](#13-moose-test-system)
    - [1.3.1. Testing Philosophy](#131-testing-philosophy)
    - [1.3.2. TestHarness](#132-testharness)
  - [1.4. update Moose](#14-update-moose)
  - [Restart](#restart)
    - [Grain growth simulation stuck at Nonlinear |R| step #17422](#grain-growth-simulation-stuck-at-nonlinear-r-step-17422)
  - [Contributing](#contributing)
    - [TIP:Start a Discussion](#tipstart-a-discussion)
    - [Code Standards](#code-standards)
    - [Referencing Issues](#referencing-issues)
    - [Work In A Fork](#work-in-a-fork)
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
  - [GrainTracker](#graintracker)
    - [Grain Tracking](#grain-tracking)
    - [Grain Remapping](#grain-remapping)
    - [code](#code)
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
  - [张量模块](#张量模块)
    - [Tensor Operators](#tensor-operators)
  - [Crystal Plasticity -- Stress](#crystal-plasticity----stress)
    - [ComputeCrystalPlasticityStress](#computecrystalplasticitystress)
    - [材料属性](#材料属性)
    - [晶体塑性中的单位设置](#晶体塑性中的单位设置)
- [6. Materials](#6-materials)
  - [6.1. MaterialProperty](#61-materialproperty)
- [7. c++](#7-c)
- [8. 进一步阅读](#8-进一步阅读)
  - [flood](#flood)
- [耦合](#耦合)
  - [8.1. 基于ComputeElasticityTensorCP来耦合.](#81-基于computeelasticitytensorcp来耦合)
- [9. 建模](#9-建模)
  - [9.1. 多晶建模中欧拉角文件生成](#91-多晶建模中欧拉角文件生成)
    - [9.1.1. matlab-人工欧拉角赋予](#911-matlab-人工欧拉角赋予)
    - [9.1.2. matlab-随机赋予欧拉角](#912-matlab-随机赋予欧拉角)
  - [尺度建立](#尺度建立)
    - [相场模拟尺度](#相场模拟尺度)
    - [晶体塑性尺度](#晶体塑性尺度)

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

[Debugging](https://mooseframework.inl.gov/application_development/debugging.html)

```shell
METHOD=dbg make -j 8

gdb --args ./yourapp-dbg -i inputfile.i

b MPI_Abort
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



## Restart

1. grain_growth_2D_graintracker.i vs grain_growth_2D_voronoi.i

发现前者多了如下代码：
```bash
  [./grain_tracker]
    type = GrainTracker
    threshold = 0.2
    connecting_threshold = 0.08
    compute_halo_maps = true # Only necessary for displaying HALOS
  [../]
```
> 需要尝试去使用restart来看一看是否可以被继续执行-> 尝试了可以进行restart

> E:\MOOSE\moose-next\moose-next\modules\phase_field\examples\grain_growth\

2. grain_growth_2D_graintracker.i vs poly_grain_growth_2D_eldrforce.i

> 相比前者，后者主要修改了grain_tracker文件
```bash
  [./grain_tracker]
    type = GrainTrackerElasticity
    threshold = 0.2
    compute_var_to_feature_map = true
    execute_on = 'initial timestep_begin'
    flood_entity_type = ELEMENTAL

    C_ijkl = '1.27e5 0.708e5 0.708e5 1.27e5 0.708e5 1.27e5 0.7355e5 0.7355e5 0.7355e5'
    fill_method = symmetric9
    euler_angle_provider = euler_angle_file
  [../]
```

事实证明，是GrainDataTracker.h是造成不能restart的原因

> E:\MOOSE\moose-next\moose-next\modules\combined\examples\phase_field-mechanics\


### Grain growth simulation stuck at Nonlinear |R| step #17422

https://github.com/idaholab/moose/discussions/17422

E:\MOOSE\moose-next\moose-next\modules\phase_field\examples\grain_growth\3D_6000_gr.i


## Contributing

驼鹿是一个合作的努力，我们总是欢迎贡献！在为MOOSE做贡献时，你需要记住，每天都有成百上千的人依靠这个代码来完成他们的工作。因此，我们有特定的策略、过程和自动化流程来保持高代码质量，同时允许每天对代码进行许多更改。

### TIP:Start a Discussion

在投入时间之前，建议你与社区讨论一下你的贡献。这有助于确定最佳的工作方法，甚至可以避免把时间花在已经可能的事情上。驼鹿有着广泛的能力和活跃的社区，参与社区活动肯定是有益的。


### Code Standards

当修改或添加到MOOSE时，您需要遵循严格的MOOSE代码标准。这些准则确保了MOOSE中所有代码的通用外观，允许开发人员在代码段之间无缝移动，并为用户提供一致的界面。

### Referencing Issues

[example issues](https://github.com/idaholab/moose/issues/16064)
[example pull requests](https://github.com/idaholab/moose/pull/17405)

对MOOSE的每一次修改都必须引用一个issue number。这意味着每个流入MOOSE的 Pull Request (PR)必须至少包含一个提交，该提交引用了与您正在处理的问题相关的问题（例如refs#<number>（其中<number>是MOOSE GitHub问题页上的问题号，例如1234）。如果您的PR完全解决了一个问题，您可以通过在问题引用前加上“closes”或“fixes”来自动关闭它（例如，closes#1234）。我们的测试系统会自动检查问题编号。

### Work In A Fork

The first step in modifying MOOSE is to create your own fork where you can commit your set of changes.

1. Fork MOOSE

> git clone git@github.com:username/moose.git

2. Add the upstream Remote:

> 
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


## GrainTracker

E:\MOOSE\moose-next\moose-next\modules\phase_field\src\postprocessors

**Grain Tracker是一种实用程序，可用于相场仿真中，以减少为大型多晶系统建模所需的序参数。  GrainTracker利用FeatureFloodCount对象从求解域中识别和提取单个晶粒。 一旦FeatureFloodCount对象标识了所有颗粒，GrainTracker便会执行以下两项操作：**
1. 将当前时间步中的晶粒与上一个时间步中的晶粒进行匹配。
2. 重新映射“接近”接触的晶粒。

### Grain Tracking
对于许多仿真类型，随着时间的推移跟踪特征的能力是很重要的。 在这里，我们提出一种算法，用于随时间推移跟踪非结构化网格上的任意特征。 跟踪阶段负责随时间推移对任意数量的移动和交互特征保持一致且唯一的标识。 跟踪阶段是算法中唯一需要时间步长之间有状态数据的阶段。 从实现的角度来看，这很重要，因为它可能会影响模拟检查点，终止并成功重启的能力。 重新启动功能对于处理硬件故障或在高性能计算环境中常见的几个执行窗口上分散长时间运行的仿真很有用。

在特征跟踪阶段的第一次调用期间，没有先前的特征数据可与之进行比较，因此不执行跟踪。 相反，必须将一组ID分配给每个识别的特征。 如果需要，可以从外部提供这些ID。 实际上，如果从外部提供ID，则没有任何限制。 这些ID不必是连续的，也不必是唯一的。 但是，如果为单独特征分配了重复的ID，并且这些要素在模拟过程中接触，则数据将合并在一起，这可能会或可能不会导致正确的模拟。 如果不需要外部分配，功能跟踪算法将为每个单独的功能分配一组连续且唯一的ID。 首先，通过存储在每个要素数据结构中的最小元素ID对识别出的要素进行排序，然后根据排序后的位置分配一个数字，即可实现这一点。 此策略可确保对不同的网格划分不敏感的稳定排序。

在随后的调用中，将上一时间步骤中的特征信息与当前时间步骤中的所有特征进行比较，并进行组织，以便正确确定所有特征的最佳匹配。 比较标准是同时全局最小化所有特征的质心距离。 通过对构成每个特征的元素质心进行平均来计算质心。 遍历新的特征列表时，我们选择上一个列表中按质心距离最近的特征。 在处理其余功能时，此配对将保存到“最佳匹配”数据结构中。

在上一个时间步中，功能可能会争夺相同的“最佳匹配”功能。 这表明特征已在当前步骤中被吸收或以其他方式消失，并且其与上一步骤相对应的特征错误地将无关的特征识别为最佳匹配。 通过将质心距离不匹配较大的特征标记为不活动来处理这种情况。

比较所有对后，将标记（“匹配”）最佳匹配数据结构中的所有要素，并将上一时间步长的ID保存到当前时间步长中的相应匹配中。 然后处理新列表和先前列表中不匹配的特征。 上一个列表中不匹配的特征标记为不活动。 当前列表中不匹配的功能是“新的”，这意味着它们以前没有被识别。 前一种情况是在当前列表中的特征完全为零时发生的，这意味着前一个列表中的任何特征都将保持不匹配状态。 当特征拆分或创建新要素时，可能会发生后一种情况。

### Grain Remapping
使用递归回溯算法可以实现晶粒的重新映射，该算法能够执行多个变量交换，以将颜色不正确的谷物图转换为合适的谷物图。 这种回溯算法仅在根进程上运行，而根进程是唯一包含完整全局晶粒图的处理器。 当一对晶粒位于图1和图2紧密接近时，可以任意选择其中一个，并将其指定为“目标”晶粒，这表明我们试图将其定义变量值重新映射到其他解决方案变量。 根据一个图具有的邻居数和代表每个邻居的变量，可能或不可能通过仅重新映射目标晶粒来创建有效图。 在这种情况下，将执行深度受限，深度优先的搜索，以查找一系列邻居交换，以使图保持有效状态。

首先，构建并填充一个大小为m的列表数组，其中m是使用的变量（颜色）的数量。 对于每个变量，将定位由该变量表示的最接近的谷物（由边界框距离确定），并将其距离与谷物ID本身一起存储在列表中的相应数组位置处。 如果给定变量的最接近边界框与目标颗粒重叠，则我们将维持负计数，该计数代表重叠的总数以及每个重叠的颗粒的ID。 否则，我们将存储给定变量最接近边界框边缘到边界框边缘的距离。 我们不必费心为具有匹配的变量索引的谷物或存在于保留的订购参数上的谷物计算或存储任何信息，因为这些变量不符合重新映射的资格。 如果有任何空阶参数（表示零晶粒的阶参数），则将无穷远距离（\infty∞）输入到相应位置，优先处理这些变量以进行重新映射。 然后以相反的顺序对这个颜色距离''阵列进行排序，将谷物放在最靠近正面的位置，而将那些具有多个重叠的谷物放在背面附近。

我们遍历距离数组，寻找适用于重新映射目标晶粒的可用变量。 如果遇到正值，则可以立即重新映射谷物，并且算法返回“成功”。 但是，如果遇到负值，我们必须首先对每个相应的颗粒光晕进行精细检查，以查看这些颗粒是否实际重叠。 如果没有，我们可以立即重新映射目标颗粒并返回“成功”。 如果遇到只有一个真正重叠的颗粒（边界框和光晕相交）的情况，该算法将用其他颗粒的变量临时标记目标颗粒，从而有效地模拟了重新映射操作。 然后，它在另一个相邻的谷物上重复进行，使其成为新的目标。 如果该算法能够在递归调用中找到成功的重新映射，则返回的“成功”值向调用方指示可以删除临时标记。 然后，“成功”值可以在调用堆栈上传播。 如果“颜色距离”数组中的所有项目都用尽，而未找到成功的交换或一组交换，则算法将返回“失败”。 如果我们正在进行递归调用，则将暂定标记删除，并检查数组中的下一个值。 我们发现将深度优先搜索限制在相对较小的深度（2或3）可以很好地工作，以更快地摆脱不可能的紧密着色的图形。 这还有助于避免无限回溯算法可能带来的巨大运行时间损失和指数增长率。 注意：暂时标记是通过打开要素数据结构中的DIRTY状态标志来表示的。  DIRTY状态使用一个独立的位，因此它可以与另一个状态同时存在。


### code


```c++
void
GrainTracker::updateFieldInfo()
// 此方法用于填充用于存储字段数据（节点或元素）的任何数据结构。

// 在finalize结束时调用它，并且可以利用在执行此后处理器期间创建的任何数据结构。
{
  TIME_SECTION(_update_field_info);
  // typedef unsigned int PerfID
  // const PerfID GrainTracker::_update_field_info

  for (MooseIndex(_maps_size) map_num = 0; map_num < _maps_size; ++map_num)
    _feature_maps[map_num].clear();
  // _maps_size: Convenience variable holding the size of all the datastructures size by the number of maps.


  std::map<dof_id_type, Real> tmp_map;

  for (const auto & grain : _feature_sets)
  // 基于范围的for循环(C++11)
  // _feature_sets:The data structure used to hold the globally unique features.
  {
    std::size_t curr_var = grain._var_index;
    std::size_t map_index = (_single_map_mode || _condense_map_info) ? 0 : curr_var;

    for (auto entity : grain._local_ids)
    {
      // Highest variable value at this entity wins
      Real entity_value = std::numeric_limits<Real>::lowest();
      if (_is_elemental)
      {
        const Elem * elem = _mesh.elemPtr(entity);
        std::vector<Point> centroid(1, elem->centroid());
        if (_poly_ic_uo && _first_time)
        {
          entity_value = _poly_ic_uo->getVariableValue(grain._var_index, centroid[0]);
        }
        else
        {
          _fe_problem.reinitElemPhys(elem, centroid, 0, /* suppress_displaced_init = */ true);
          entity_value = _vars[curr_var]->sln()[0];
        }
      }
      else
      {
        auto node_ptr = _mesh.nodePtr(entity);
        entity_value = _vars[curr_var]->getNodalValue(*node_ptr);
      }

      if (entity_value != std::numeric_limits<Real>::lowest() &&
          (tmp_map.find(entity) == tmp_map.end() || entity_value > tmp_map[entity]))
      {
        mooseAssert(grain._id != invalid_id, "Missing Grain ID");
        _feature_maps[map_index][entity] = grain._id;

        if (_var_index_mode)
          _var_index_maps[map_index][entity] = grain._var_index;

        tmp_map[entity] = entity_value;
      }

      if (_compute_var_to_feature_map)
      {
        auto insert_pair = moose_try_emplace(
            _entity_var_to_features, entity, std::vector<unsigned int>(_n_vars, invalid_id));
        auto & vec_ref = insert_pair.first->second;

        if (insert_pair.second)
        {
          // insert the reserve op numbers (if appropriate)
          for (MooseIndex(_n_reserve_ops) reserve_index = 0; reserve_index < _n_reserve_ops;
               ++reserve_index)
            vec_ref[reserve_index] = _reserve_grain_first_index + reserve_index;
        }
        vec_ref[grain._var_index] = grain._id;
      }
    }

    if (_compute_halo_maps)
      for (auto entity : grain._halo_ids)
        _halo_ids[grain._var_index][entity] = grain._var_index;

    for (auto entity : grain._ghosted_ids)
      _ghosted_entity_ids[entity] = 1;
  }

  communicateHaloMap();
}

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

## 5.3. 材料模块--张量力学

### 5.3.1. 应变

去创建应变（$\epsilon$）或者应变增量的材料基类是 `ComputeStrainBase`; 这个类是纯虚类，要求所有的派生类去覆盖（override）成员函数 `computeQpProperties()`.对于所有的应变，这个基类定义塑性 `total_strain`.对于增量应变，无论是有限应变还是小应变，计算应变基类定义属性 `strian_rate,strain_increment, rotation_increment, and deformation_gradient`. 在应变网页中提供了不同应变范式的讨论。

对于小应变，使用 [ComputeSmallStrain](#531-应变)，其中 $\epsilon = (\nabla u+\nabla u^T)/2$.

对于有限应变问题，使用 [ComputeFiniteStrain](#531-应变)，计算应变增量和旋转增量

在 `TensorMechanics master action` 中，应力范式可以通过如下代码设置

### 5.3.2. 应力

用于计算应力 $\sigma$ 本构方程的基类是 `ComputeStressBase`. 这个基类定义了属性应力和弹性应变。这是一个纯虚类，要求~
不同的本构方程详见 `stress web`

[Stress Divergence](https://mooseframework.inl.gov/modules/tensor_mechanics/StressDivergence.html)

[Stresses in Tensor Mechanics](https://mooseframework.inl.gov/modules/tensor_mechanics/Stresses.html)

Inelastic Stress Calculations
 1. User Objects, which perform the stress calculations in both MOOSE code UserObjects and Materials, and
 2. StressUpdate Materials, which calculate the stress within a specific type of MOOSE Materials code.

User Objects Plasticity Models

This approach to modeling plasticity problems uses as stress material to call several UserObjects, where each user object calculates and returns a specific materials property, e.g. a crystal plasticity lip system strength. The stress material then calculates the current stress state based on the returned material properties.


张量力学模块包括用于计算弹性应力，塑性应力，蠕变应力和应力计算方法组合的多个类别。
 

### 5.3.3. 弹性模量

创建弹性模量 $C_{ijkl}$ 的主要类是 `ComputeElasticityTensor`. 这个类定义属性 `_elasticity_tensor`.若需要计算旋转之后的弹性模量，欧拉角需要提供。弹性模量还可以作为专用弹性模量的基类，包括：
  - 用于晶体塑性的弹性模量： `ComputeElasticityTensorCP` 
  - A Cosserat elasticity tensor
  - 各向同性弹性模量： `ComputeIsopicElasticityTensor`
  - 


## 张量模块

### Tensor Operators
https://mooseframework.inl.gov/source/utils/MooseUtils.html

## Crystal Plasticity -- Stress

基于UserObject的晶体可塑性系统旨在以模块化方式促进不同本构定律的实施。 现象学本构模型和基于位错的本构模型都可以通过该系统实现。
该系统由一个基于FiniteStrainUObased的材料类和四个用户对象类组成：
  - `CrystalPlasticitySlipRateGSS` 
  - `CrystalPlasticitySlipResistanceGSS`
  - `CrystalPlasticityStateVarRateComponentGSS`
  - `CrystalPlasticityStateVariable`

### ComputeCrystalPlasticityStress

[ComputeCrystalPlasticityStress](https://mooseframework.inl.gov/moose/source/materials/crystal_plasticity/ComputeCrystalPlasticityStress.html)

使用晶体塑性本构关系计算应力

在许多晶体固体力学的领域中，晶体塑性理论已被确立为探索晶体微观结构演变与工程规模相应之间关系的有效关系。在连续力学框架内制定晶体可塑性，相比于能够明确跟踪每个单个的位错和缺陷原子和位错动力学模型，这些模型可用于更长的时间尺度和更大的长度尺度。

`ComputeCrystalPlasticityStress` 类调用指定的晶体可塑性本构模型类，并存储由晶体可塑性模型计算出的柯西应力。`ComputeCrystalPlasticityStress`设计为与晶体可塑性模型结合使用，以计算非弹性应变响应。

`ComputeCrystalPlasticityStress` 计算初始弹性应变 “trial” 值和相应的初始 “trial” 柯西应力值。 这些初始值传递给本构晶体可塑性模型，在该模型中，通过CrystalPlasticityUpdate基类，将演化方程假定为以更新的拉格朗日增量形式实现。 根据本构模型定义，在每个网格正交点上的每次模拟迭代中都会计算局部收敛的应力（请参阅牛顿-拉普森干涉）。

鉴于 `CrystalPlasticityUpdate` 基类在计算应变和柯西应力增量时所起的重要作用，下面概述了用于计算和收敛一般晶体塑性本构模型的应变和应力增量的算法。

### 材料属性

1. a0, $\alpha_0$, 参考剪切速率，$s^{-1}$
2. xm, $m$ 滑移速率敏感性的材料参数，没有单位
3. q, $q_{\alpha\beta}$,没有单位
4. h0, $h_0$, 滑移硬化参数，MPa
5. tau_init, $\tau_{init}$, 初始滑移阻力,MPa
6. tau_sat, $\tau_{sat}$, 滑移阻力的饱和值,MPa
7. a, $a$, 滑移硬化参数, 没有单位
8. gss $\tau^\alpha_c$, 滑移阻力,MPa


### 晶体塑性中的单位设置

mm-MPa-s unit system
- Mesh dimensions should be constructed in mm
- Elastic constant values (e.g. Young's modulus and shear modulus) are entered in MPa
- Initial slip system strength values are entered in MPa
- Simulation times are given in s
- Strain rates and displacement loading rates are given in 1/s and mm/s, respectively


# 6. Materials

## 6.1. MaterialProperty

```c++
struct GenericMaterialPropertyStruct< T, is_ad >
// 结构体

GenericMaterialProperty = typename GenericMaterialPropertyStruct< T, is_ad >::type
 
```
$ y_{n+1} = y_n + \dot{y}\cdot dt $
# 7. c++


# 8. 进一步阅读

##　ComputeMultipleCrystalPlasticityStress 

[Refactor crystal plasticity base class to account for multiple crystal plastic deformation mechanisms #17405](https://github.com/idaholab/moose/pull/17405)



 
## flood 


# 耦合

## 8.1. 基于ComputeElasticityTensorCP来耦合.

关键在于ComputeElasticityTensorCP中输入欧拉角计算所得旋转矩阵

```c++
_R.update(_Euler_angles_mat_prop[_qp]);
_crysrot[_qp] = _R.transpose();

auto grain_id = op_to_grains[op_index];
Real h = (1.0 + std::sin(libMesh::pi * ((*_vals[op_index])[_qp] - 0.5))) / 2.0;
_elasticity_tensor[_qp] += _grain_tracker.getData(grain_id) * h;
```

能不能将本应该在 `GrainTrackerElasticity` 赋予欧拉角的旋转矩阵,在材料的弹性模块中被赋予.

- 2021.04.21 
  - 感觉耦合有各种各样的bug：
      1. 新建自定义对象创建一个二阶张量赋予给newgrain，用于输入旋转矩阵给材料模块中的弹性模量，编译没有问题，但是在运行*.i文件的时候不能运行，显示：
       ```powershell
       Assertion 'grain_id < _grain_data.size()' failed Requested data for invalid grain index.
       at/hone/projectsosedules/phase_fieldild /header_synlinks/GrainDataTracker .h，line 46
       ```

      2. 在 `GrainTrackerElasticity` 的基础上新建一个成员函数，但是出现覆盖四阶张量的情况
       ```powershell
       error: 'RankTwoTensor GrainTrackerElasticityPW::newGrain(unsigned int)' cannot be overloaded with 'RankFourTensor GrainTrackerElasticityPW::newGrain(unsigned int)'
       ```
  - 计划：
      1. 补c++的知识，主要是泛式编程部分
      2. 将现在的工作上传到github上，期望得到专家的指导。

- 2021.04.22
  - 进度
    - 你是
  - 计划
    - 1. 
# 9. 建模

## 9.1. 多晶建模中欧拉角文件生成

### 9.1.1. matlab-人工欧拉角赋予

> 基底为44 45 46°欧拉角，人工赋予14个欧拉角为90°

1. 挑选unique_grain序号作为人工赋予的90°欧拉角

[unique_grain](./Matlab/Input/unique_grain.xlsx)

ps:赋予的时候，挑选的序号需要+1

2. 使用matlab脚本生成*.tex文件

[euler_45_90.m](./Matlab/script/euler_45_90.m)

3. 之后生成 `grn_6400_rand_2D` 文件

[grn_6400_rand_2D.tex](./Matlab/Output/grn_6400_rand_2D.tex)
 

### 9.1.2. matlab-随机赋予欧拉角

> 使用rand随机赋予欧拉角，对1600个晶粒


## 尺度建立

### 相场模拟尺度

1. length_scale = 1e-09 # nm
2. time_scale = 1e-09 # nm

test：
```powershell
length_scale = 1e-03 # mm
time_scale = 1e-01 # s
```
### 晶体塑性尺度

1. $20 \mu m\times 20 \mu m$；15 grains；the average grain diameter: 5.9 $\mu m$
   1. MPa, mm

###　耦合尺度

要求：



Thanks very much for your enthusiastic answer, @GiudGiud 
I think what you said is correct. I performed the `restart` operation on `grain_growth_2D_graintracker.i`, and it proved that it was operational. However, the problematic `poly_grain_growth_2D_eldrforce.i` used a derived class of `GrainDataTracker.h`, namely `GrainTrackerElasticity`, and `GrainDataTracker.h` is a template class that inherits `GrainDataTracker`.

Therefore, I also think that restart is interrupted somewhere in `GrainDataTracker.h`.
I will do my best to solve this problem, and hope you can provide more opinions for moose beginners like me.

Thanks,
wei.