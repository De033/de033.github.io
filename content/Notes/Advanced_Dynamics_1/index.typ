#import "../index.typ": *
#import "@preview/theorion:0.4.1": *
#import "@preview/tablem:0.3.0": *

#import "@preview/cmarker:0.1.8"
#import "@preview/mitex:0.2.6": *

#show: template.with(
  title: "高等动力学Lecture1",
  description: "分析力学引论笔记",
)

= 分析力学引论
== 约束
- 约束：质点系，多刚体系统在运动过程中位形，速度，角速度等量所受到的限制
- 广义坐标
- 自由度Dof：描述刚体系统位形所需要的独立变量的个数
#tufted.margin-note[
  例1：单摆
    - 长度为$l$的刚性轻杆，端点为质量为$m$的质点，$O$点为铰链，取坐标系$[O,i,j]$,$"OA"=x i + y j$
    - 约束为$"OA"=l <=> x^2 + y^2 = l^2$
    - 引入广义坐标$theta$，满足$x = l sin theta, y = -l cos theta$，系统的自由度为1
]

  #tufted.margin-note[
      流形，简单来说，是空间中的曲线和曲面
  ]  
#tufted.margin-note[
  例2：球面摆，$O$点球铰接，取球坐标$(theta,phi)$
  - $theta$:$"OA"$与$-k$夹角
  - $phi$:$("OA",k)$张成的平面与$(i,j)$平面的夹角
  - 约束为$"OA"=l <=> x^2 + y^2 + z^2 = l^2$
  
]
#note-box[

  - 对于质点约束在圆上，此系统的位形流形为$S^1$

    - $S^1={theta| theta in R "mod" 2 pi}$

]
#tufted.margin-note[
  例3：双摆，OA在O处铰接，AB在A处铰接，$A(x_1,y_1),B(x_2,y_2)$
  - 约束方程：$"OA"=l_1,"AB"=l_2$
  - 引入广义坐标$theta_1,theta_2$
    - $x_1 = l_1 sin theta_1, y_1 = -l_1 cos theta_1$
    - $x_2 = l_1 sin theta_1 + l_2 sin theta_2, y_2 = -l_1 cos theta_1 - l_2 cos theta_2$
  - 位形流形为$(theta_1,theta_2) in S^1 times S^1= Q"(环面，甜甜圈)"$
]
- 一般情况下，空间中质点系${m_i, r_i}^n _(i=1)$，受到位形约束$f_k(r_1,r_2,...,r_n,t)=0,(k=1,2,...,m<=n)$，设$r_k=x_k i+y_k j+z_k k$
- 若约束不显含时间$t$，则称为定常约束，否则为非定常约束$<=> (partial f)/(partial t)=0 $则定常
- 假设约束相互独立，即约束方程的雅可比矩阵$J=(partial f_k)/(partial r_i)$的行秩满秩，根据隐函数定理$=>$存在局部的独立变量$q_1,q_2,...,q_n$，其中$n=3N-m$，使得$r_k=r_k (q_1,q_2,...,q_n,t)=>r_k=r_k (q,t)$,$n$为自由度

#quote-box[
  例：圆盘纯滚动，质心为C，与地面接触点为A
  - 约束：$v_A=dot(x) - R dot(theta)=0 $，微分约束(约束方程包含速度)
    - 积分得$x=R theta+C$，从微分约束转化为位形约束

]
#quote-box[
  例：平面上冰刀运动($x,y,phi$)
  - 约束：冰刀朝向可转，但冰刀速度方向始终沿冰刀朝向，微分约束(假设不发生侧滑)
  - 约束方程：$(dot(y))/(dot(x))=tan(phi)=sin(phi)/(cos(phi))<=>dot(x)sin phi - dot(y)cos phi=0$
    - 约束方程不可积，无法转化为位形约束，称为非完整约束

]
- 一般情况下，$f(r_1,r_2,...,r_n,dot(r_1),dot(r_2),...,dot(r_n),t)=0$，如果可通过积分转化为位形约束$g(r_1,r_2,...,r_n,t)=C$，则称为完整约束，否则为非完整约束
- 一般情况下，Pfaff一阶约束$sum_(i=1)^n A_"ij" (x_1,x_2,...,x_n)d x_j = 0$，可写成矩阵形式
#note-box[
  如何判断是否可积？
  - $A(x,y)d x+B(x,y)d y=0$
  - $A(x,y,z)d x + B(x,y,z) d y + C(x,y,z) d z =0$可积$<=> f dot (nabla times f)=0$
]
- 不等式约束(单面约束)

== 虚位移
=== 完整约束下虚位移
#tufted.margin-note[
  为什么需要虚位移？\
  当约束面光滑时，约束反力垂直于约束面，对于非定常约束，约束反力在$d accent(r_j,->)$上可能做功，在$delta accent(r_j,->)$上不做功\
  所以定义虚位移可以避免出现约束反力
]
-设N个质点${m_k,r_k},k=1,2,...,N$，有m个完整约束，$f_i(r_1,r_2,...,r_N,t)=0$，$ sum_(j=0)^(N) (partial f_i)/(partial r_j) delta r_j + (partial f_i)/(partial t) delta t = 0 $<limit>
$ =>(r_j)=x_j accent(i,->)+y_j accent(j,->)+z_j accent(k,->) $ $ => d accent(r,->)=d x_j accent(i,->)+d y_j accent(j,->)+d accent(k,->) $
- 定义 $d r_J$ 为满足约束的可能位移，满足牛顿第二定律称为真实位移
- 虚位移：$delta r_j = d r_j - dot(r)_j delta t$，满足约束方程的位移，且不包含时间增量的部分
$ (partial f)/(delta accent(r_j,->)) delta accent(r_j,->)=(partial f)/(partial x_j) delta x_j+(partial f)/(partial y_j) delta y_j+(partial f)/(partial z_j) delta z_j $

#tufted.margin-note[
  真实位移：满足约束的位移，且包含时间增量的部分，满足牛顿第二定律\
  可能位移：满足约束的位移，不包含时间增量的部分\
  虚位移：满足约束的位移，且不包含时间增量的部分，等时变分$(partial f)/(delta accent(r_j,->)) delta accent(r_j,->)=0$\
]

#quote-box[
  虚位移的另一种定义：\
  - 虚位移：同一时刻，同一位置出发，相同间隔$d t$的可能位移之差，记作$delta accent(r_j,->)$

]

#tufted.margin-note[
  例：一质点被约束在光滑球面$R(t)$,$accent(r,->)=x accent(i,->)+y accent(j,->)+z accent(k,->)$\
  $ x^2+y^2+z^2-R^2 omega=0 $ $ => x d x+ y d y+z d z - R dot(R) d t=0 $ $ delta accent(r,->) = delta x accent(i,->) + delta y accent(j,->) + delta z accent(k,->) $

]

=== 一般约束下虚位移
- 质点系${m_k, r_k}^N_{k=1}$惯性系，受到m个完整约束，s个非完整约束
  - 非完整约束$ sum_(j=1)^N accent(A_(i j),->) (r_1,r_2,dots,r_N,t) dot dot(r_j)+b_i (r_1,r_2,dots,r_N,t)=0$
  - 对应变分：$ sum^N_(j=1)accent(A_(i j),->) dot delta accent(r_j,->)=0 $

== 虚功原理(广义坐标下)

质点系 ${m_k, arrow(r)_k}_{k=1}^N$，受到外力 $arrow(X)_k$，系统平衡
$
sum_(k=1)^N arrow(X)_k dot delta arrow(r)_k = 0 quad 
$

设 $q_1,q_2,...,q_n$ 为广义坐标，则
$
arrow(r)_k = arrow(r)_k(q_1,q_2,...,q_n)
$

于是虚位移
$
delta arrow(r)_k
= sum_(s=1)^n (partial arrow(r)_k)/(partial q_s) delta q_s quad "代入"
$

代入得
$
sum_(k=1)^N sum_(s=1)^n arrow(X)_k dot (partial arrow(r)_k)/(partial q_s) delta q_s = 0
$

令广义力
$
forall s=1,2,...,n:quad
Y_s := sum_(k=1)^N arrow(X)_k dot (partial arrow(r)_k)/(partial q_s)
$
#tufted.margin-note[
  广义力的物理意义：$Y_s$ 表示当广义坐标 $q_s$ 发生单位增量时，外力对系统做的功，表示沿该方向的做功本领
]
则虚功原理化为
$
sum_(s=1)^n Y_s delta q_s = 0
$


== 保守系统与势能判据

- 若系统保守，存在势能 $U(q_1,q_2,...,q_n)$，则
$
Y_s = - (partial U)/(partial q_s),quad s=1,2,...,n
$

- 平衡条件
$
0 = sum_(s=1)^n Y_s delta q_s
= - sum_(s=1)^n (partial U)/(partial q_s) delta q_s
= - delta U
$

因此平衡 $=> delta U = 0$，等价写作
$
nabla U = 0
$

- 稳定性判别（势能最小）
$
delta^2 U > 0 quad (U "取极小")
$

步骤：
1. 写出势能 $U(q)$；
2. 解 $nabla U = 0$ 得平衡位置 $bar(q)$；
3. 判断 Hessian：
$
nabla nabla U
= [ (partial^2 U)/(partial q_i partial q_j) ]
$
若其正定 $=>$ 稳定（否则不稳定/临界）。


== 虚功原理
- 主动力虚功：$delta W_a =sum^N_(k=1) accent(X_k,->) dot delta accent(r_k,->)$
- 约束力虚功：$ delta W_c =sum^N_(k=1) accent(R_k,->) dot delta accent(r_k,->)$
#tufted.margin-note[$R$表示全系统的约束力，$R_k$表示作用在第$k$个质点上的约束力，满足$R = sum^N_(k=1) R_k$]
- 理想约束假设 $=>$ 约束力虚功为 $0$
  $ sum^N_(k=1) accent(R_k,->) dot delta accent(r_k,->) = accent(R,->) dot delta accent(r,->) = 0 $
  其中 $accent(R,->) = [accent(R_1,->), accent(R_2,->), dots, accent(R_N,->)]_(3N)$， $delta accent(r,->) = [dots]_(3N)$
- 又由于 $frac(partial f_i, partial accent(r,->)) dot delta accent(r,->) = 0$，$accent(A_j,->) dot delta accent(r,->) = 0$
  $ exists lambda_i, mu_j quad i=1, 2, dots, m, quad j=1, dots, s $
  使得 $ accent(R,->) =sum^m_(i=1) lambda_i frac(partial f_i, partial accent(r,->)) + sum^s_(j=1) mu_j A_j $
  （注：$accent(R,->) in RR^(1 times 3N)$）



=== 达朗贝尔原理

$ sum_(k=1)^N (arrow(X)_k - m_k arrow(dot.double(r))_k) dot delta arrow(r)_k = 0 $

系统平衡 $<=>$ 主动力虚功为零。


  *推导过程：*
  
  由达朗贝尔原理出发：
  $ sum_k (arrow(X)_k - m_k arrow(dot.double(r))_k) dot delta arrow(r)_k = 0 $
  
  其中加速度定义为：$arrow(dot.double(r))_k = frac(d arrow(v)_k, d t)$
  
  利用 *Leibniz 公式*（导数的乘积法则）对惯性项进行变换：
  
  $ circle(1) quad sum_k m_k arrow(dot.double(r))_k dot delta arrow(r)_k = sum_k frac(d, d t) (m_k arrow(dot(r))_k dot delta arrow(r)_k) - sum_k m_k arrow(dot(r))_k dot frac(d(delta arrow(r)_k), d t) $
  
  这里利用了：
  $ frac(d, d t) (arrow(dot(r))_k dot delta arrow(r)_k) = arrow(dot.double(r))_k dot delta arrow(r)_k + arrow(dot(r))_k dot frac(d, d t)(delta arrow(r)_k) $

  #tufted.margin-note[
    *几何路径点定义：* \
    $A: arrow(r)_k (t)$ \
    $B: arrow(r)_k (t + Delta t)$ \
    $C: (arrow(r)_k + delta arrow(r)_k)(t)$ \
    $D: (arrow(r)_k + delta arrow(r)_k)(t + Delta t)$ \
    由此得： \
    $arrow(A C) = delta arrow(r)_k (t)$ \
    $arrow(B D) = delta arrow(r)_k (t + Delta t)$
  ]

  为了进一步化简，我们需要考察变分算子 $delta$ 与微分算子 $d$ 的关系。根据路径的几何分析，定义变分的随时间变化率为：

  $ frac(d, d t) [delta arrow(r)_k (t)] = lim_(Delta t -> 0) frac(delta arrow(r)_k (t + Delta t) - delta arrow(r)_k (t), Delta t) $


  由此可得变分速度的定义：
  $ delta arrow(v)_k eq.triple frac(d, d t) delta arrow(r)_k = delta (frac(d arrow(r)_k, d t)) = delta arrow(dot(r))_k $
#tufted.margin-note[
    #rect(stroke: 0.5pt + blue, inset: 8pt)[
      *关键结论：* \
      $delta (d arrow(r)_k) = d (delta arrow(r)_k)$ \
      即 $d$ 与 $delta$ 算子可交换
    ]
    $d$：微分算子 \
    $delta$：变分算子
  后续步骤将涉及对时间积分，利用 Hamilton 原理进一步推导 Lagrange 方程。
  ]

  将上述关系代入式 $circle(1)$ 的末项中，可得：

  #tufted.full-width[
  $ sum_k m_k arrow(dot(r))_k dot frac(d, d t) (delta arrow(r)_k) = sum_k m_k arrow(v)_k dot delta arrow(v)_k = sum_k delta (1/2 m_k v_k^2) = delta T $
  ]

