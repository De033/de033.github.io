#import "../index.typ": *
#import "@preview/theorion:0.4.1": *
#import "@preview/tablem:0.3.0": *

#import "@preview/cmarker:0.1.8"
#import "@preview/mitex:0.2.6": *


#show: template.with(
  title: "高等动力学Lecture2",
  description: "广义坐标、Hamilton 原理、变分法",
)

= 广义坐标、Hamilton 原理、变分法

== 1. 广义坐标与约束

在惯性系下，考察质点系 #mi("\{m_k, \vec{r}_k\}_{k=1}^N")。

#quote-box[
*完整约束 (Holonomic Constraints)*：
#mitex(`f_k(\vec{r}_1, \vec{r}_2, \dots, \vec{r}_N, t) = 0, \quad k=1, 2, \dots, m`)
]

#quote-box[
*非完整约束 (Non-holonomic Constraints)*：
#mitex(`\sum_j \vec{A}_{ij}(\vec{r}_1, \dots, \vec{r}_N, t) \cdot \dot{\vec{r}}_j + b_i(\vec{r}_1, \dots, \vec{r}_N, t) = 0, \quad i=1, 2, \dots, s`)
]

- *构型空间维数*：#mi("n = 3N - m") （仅由完整约束决定）。
- *系统自由度 (D.o.F)*：#mi("3N - m - s") （受非完整约束影响）。

#tufted.margin-note[注意：非完整约束通常以微分形式或速度约束形式给出。]

=== 约束的变分形式
1. 对于完整约束：
#mitex(`\sum_{j=1}^N \frac{\partial f_i}{\partial \vec{r}_j} \cdot \delta \vec{r}_j = 0, \quad i=1, 2, \dots, m`)

2. 对于非完整约束：
#mitex(`\sum_{j=1}^N \vec{A}_{ij}(\vec{r}, t) \cdot \delta \vec{r}_j = 0, \quad i=1, 2, \dots, s`)

=== 引入广义坐标
取广义坐标 #mi("q_1, q_2, \dots, q_n")，其中 #mi("n = 3N - m")。
定义广义坐标向量 #mi("q = [q_1, q_2, \dots, q_n]^T")。

则有位置矢量关于广义坐标的函数关系：
#mitex(`\vec{r}_j = \vec{r}_j(q, t)`)

该关系满足所有完整约束 #mi("f_k(\vec{r}_1(q,t), \dots, \vec{r}_N(q,t), t) = 0")（由隐函数定理决定）。

#tufted.margin-note[在广义坐标下，我们仅需考虑非完整约束。]

由定义可知虚位移的关系：
#mitex(`\delta \vec{r}_j = \sum_{k=1}^n \frac{\partial \vec{r}_j}{\partial q_k} \delta q_k`)

代入非完整约束的变分形式 ②：
#mitex(`\sum_{j=1}^N \vec{A}_{ij} \cdot \left( \sum_{k=1}^n \frac{\partial \vec{r}_j}{\partial q_k} \delta q_k \right) = 0 \implies \sum_{k=1}^n \left( \sum_{j=1}^N \vec{A}_{ij} \cdot \frac{\partial \vec{r}_j}{\partial q_k} \right) \delta q_k = 0`)

定义系数 #mi("a_{ik} = \sum_{j=1}^N \vec{A}_{ij} \cdot \frac{\partial \vec{r}_j}{\partial q_k}")，则非完整约束在广义坐标下表示为：
#mitex(`\sum_{k=1}^n a_{ik}(q, t) \delta q_k = 0, \quad i=1, 2, \dots, s`)

== 2. D'Alembert-Lagrange 原理

#quote-box[
*D'Alembert-Lagrange 原理（理想约束假设）*：
#mitex(`\sum_i (\vec{X}_i - m_i \ddot{\vec{r}}_i) \cdot \delta \vec{r}_i = 0`)
]

其中主动力 #mi("\vec{X}_i") 可分为保守力与非保守力：
#mitex(`\vec{X}_i = -\frac{\partial V}{\partial \vec{r}_i} + \vec{Y}_i`)

将上述原理转化至广义坐标系：
#mitex(`\delta(T - V) + \sum_{j=1}^n Q_j \delta q_j - \frac{d}{dt} \left( \sum_{i,j,k}^{N,n,n} m_i \frac{\partial \vec{r}_i}{\partial q_j} \frac{\partial \vec{r}_i}{\partial q_k} \dot{q}_j \delta q_k \right) + \dots = 0`)

推导中涉及项：
#mitex(`\vec{r}_i \cdot \vec{r}_i = \left( \frac{\partial \vec{r}_i}{\partial q_j} \dot{q}_j + \frac{\partial \vec{r}_i}{\partial t} \right) \cdot \left( \frac{\partial \vec{r}_i}{\partial q_k} \dot{q}_k + \frac{\partial \vec{r}_i}{\partial t} \right)`)
（此处对 #mi("j, k") 约定求和）

== 3. 动能的结构

系统的动能 #mi("T(\dot{q}, q, t)") 可以表示为三项之和：
#mitex(`T(\dot{q}, q, t) = T_2 + T_1 + T_0`)

- *二次元项*：#mi("T_2 = \frac{1}{2} M_{jk}(q, t) \dot{q}_j \dot{q}_k")，其中 #mi("M_{jk} = \sum_{i=1}^N m_i \frac{\partial \vec{r}_i}{\partial q_j} \cdot \frac{\partial \vec{r}_i}{\partial q_k}")。
- *一次元项*：#mi("T_1 = b_j(q, t) \dot{q}_j")，其中 #mi("b_j = \sum_{i=1}^N m_i \frac{\partial \vec{r}_i}{\partial q_j} \cdot \frac{\partial \vec{r}_i}{\partial t}")。
- *零次元项*：#mi("T_0 = \frac{1}{2} \sum m_i \frac{\partial \vec{r}_i}{\partial t} \cdot \frac{\partial \vec{r}_i}{\partial t}")。

#tufted.margin-note[#mi("T_2") 是关于 #mi("\dot{q}") 的正定二次型；#mi("T_1") 是关于 #mi("\dot{q}") 的线性函数；#mi("T_0") 与 #mi("\dot{q}") 无关。]

=== 非完整系统的动力学方程组
对于具有 #mi("s") 个非完整约束的系统：
#mitex(`\begin{cases}
\delta(T - V) + \sum_{j=1}^n Q_j \delta q_j - \dots = 0 & \text{③} \\
\sum_{j=1}^n a_{ij}(q, t) \delta q_j = 0, \quad i=1, \dots, s & \text{④}
\end{cases}`)

*注*：
1. #mi("q = (q_1, \dots, q_n)") 作为构型空间广义坐标是相互独立的。
2. 但由于非完整约束，广义速度 #mi("\dot{q}") 并不独立。

== 4. 变分法基础 (Calculus of Variations)

=== 泛函 (Functional)
泛函是“函数的函数”。
设 #mi("x(t) \in C^1[t_1, t_2]") 为陪试函数，泛函 #mi("J") 定义为：
#mitex(`J: C^1[t_1, t_2] \to \mathbb{R}, \quad x(t) \to J(x)`)

定义邻域 #mi("B_\epsilon(x(t)) = \{ y(t) \in C^1[t_1, t_2], \|y - x\| < \epsilon \}")，其中范数 #mi("\|y - x\| = \sup |y(t) - x(t)|, t \in [t_1, t_2]")。



=== 泛函的变分与 Euler 方程
考察泛函：
#mitex(`J(x) = \int_{t_1}^{t_2} F(x, \dot{x}, t) dt`)

定义泛函变分 #mi("\delta J = J(x + \delta x) - J(x)")。
假设边界点固定：#mi("\delta x(t_0) = \delta x(t_1) = 0")。

推导过程：
#mitex(`\delta J = \int_{t_0}^{t_1} \left[ F(x+\delta x, \dot{x}+\delta \dot{x}, t) - F(x, \dot{x}, t) \right] dt`)
#mitex(`\delta J = \int_{t_0}^{t_1} \left[ \frac{\partial F}{\partial x} \delta x + \frac{\partial F}{\partial \dot{x}} \delta \dot{x} \right] dt`)

利用分部积分 #mi("u dv = d(uv) - v du")，其中 $delta dot(x) = d/(d t) delta x$：
#mitex(`\int_{t_0}^{t_1} \frac{\partial F}{\partial \dot{x}} \frac{d}{dt}(\delta x) dt = \left[ \frac{\partial F}{\partial \dot{x}} \delta x \right]_{t_0}^{t_1} - \int_{t_0}^{t_1} \delta x \frac{d}{dt} \left( \frac{\partial F}{\partial \dot{x}} \right) dt`)

由于边界固定，第一项为 0。则有：
#mitex(`\delta J = \int_{t_0}^{t_1} \left[ \frac{\partial F}{\partial x} - \frac{d}{dt} \left( \frac{\partial F}{\partial \dot{x}} \right) \right] \delta x dt = 0`)

由于 #mi("\delta x") 是邻域内的任意函数，由变分法基本引理得：
#quote-box[
*Euler-Lagrange 方程*：
#mitex(`\frac{\partial F}{\partial x} - \frac{d}{dt} \left( \frac{\partial F}{\partial \dot{x}} \right) = 0`)
]

== 5. 算例：最速降线问题 (Brachistochrone)

*问题描述*：质点在重力作用下，沿光滑曲线从 A 点运动到 B 点，求所需时间最短的曲线。


根据机械能守恒：#mi("\frac{1}{2} m v^2 = m g y \implies v = \sqrt{2gy}")。\
速度定义：#mi("v = \frac{ds}{dt} \implies dt = \frac{ds}{v} = \frac{\sqrt{dx^2 + dy^2}}{\sqrt{2gy}}")。

总时间泛函：
#mitex(`J = t = \int_0^{y_B} \frac{1}{\sqrt{2g}} \sqrt{\frac{1 + (x')^2}{y}} dy, \quad \text{其中 } x' = \frac{dx}{dy}`)

被积函数 #mi("F(x, x', y) = \sqrt{\frac{1 + (x')^2}{y}}")。
由于 #mi("F") 不显含 #mi("x")，则根据 Euler 方程：
#mitex(`\frac{\partial F}{\partial x} - \frac{d}{dy} \left( \frac{\partial F}{\partial x'} \right) = 0 \implies \frac{\partial F}{\partial x'} = \text{const} = \frac{1}{\sqrt{2C}}`)

解得：
#mitex(`\frac{x'}{\sqrt{y(1+(x')^2)}} = \text{const} \implies x' = \sqrt{\frac{Cy}{1-Cy}}`)

引入参数 #mi("Cy = \sin^2 \phi")，积分可得摆线（旋轮线）方程：
#mitex(`x = \int \sqrt{\frac{Cy}{1-Cy}} dy = \frac{2}{C} \int \sin^2 \phi d\phi = \frac{1}{C} (\phi - \sin \phi \cos \phi)`)

== 6. 变分原理的意义
1. 此原理与 Newton 定律等价。
2. 不止适用于经典力学，还广泛应用于几何学、电磁学、相对论及量子力学。
3. 类似等价原理：
   - *Jourdan 原理*：#mi("\sum_i (\vec{X}_i - m_i \ddot{\vec{r}}_i) \cdot \delta \dot{\vec{r}}_i = 0")
   - *Gauss 最小曲率原理*。

对于保守系统：
#mitex(`\delta W = 0 \implies \delta \int_{t_1}^{t_2} L(q, \dot{q}, t) dt = 0`)
此即为 *Hamilton 原理*。