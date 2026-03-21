#import "../index.typ": *
#import "@preview/theorion:0.4.1": *
#import "@preview/tablem:0.3.0": *

#import "@preview/cmarker:0.1.8"
#import "@preview/mitex:0.2.6": *


#show: template.with(
  title: "高等动力学Lecture3",
  description: "Euler-Lagrange 方程与算例分析",
)

= Lecture 4：Euler–Lagrange 方程

== 1. 变分原理与 Euler–Lagrange 方程（含外力）

设系统有 #mi("n") 个自由度，广义坐标为 #mi("q_k \,(k=1,\dots,n)")。Hamilton 原理为

#mitex(`
\int_{t_1}^{t_2} (\delta L + \delta W)\,dt = 0
`)

其中拉格朗日量

#mitex(`
L(q,\dot q,t)=T-V
`)

广义力的虚功

#mitex(`
\delta W=\sum_{k=1}^n Q_k\,\delta q_k
`)

对 #mi("L") 取变分：

#mitex(`
\delta L=\sum_{k=1}^n\left(\frac{\partial L}{\partial q_k}\delta q_k+
\frac{\partial L}{\partial \dot q_k}\delta \dot q_k\right)
`)

将 #mi("\delta \dot q_k") 项分部积分：

#mitex(`
\int_{t_1}^{t_2}\frac{\partial L}{\partial \dot q_k}\delta \dot q_k\,dt
=
\left[\frac{\partial L}{\partial \dot q_k}\delta q_k\right]_{t_1}^{t_2}
-
\int_{t_1}^{t_2}\frac{d}{dt}\left(\frac{\partial L}{\partial \dot q_k}\right)\delta q_k\,dt
`)

于是

#mitex(`
\int_{t_1}^{t_2}\sum_{k=1}^n\left(
\frac{\partial L}{\partial q_k}
-\frac{d}{dt}\frac{\partial L}{\partial \dot q_k}
+Q_k\right)\delta q_k\,dt
+\left[\frac{\partial L}{\partial \dot q_k}\delta q_k\right]_{t_1}^{t_2}=0
`)

#tufted.margin-note[端点变分为零：#mi("\delta q_k(t_1)=\delta q_k(t_2)=0")]

由任意性得 *Euler–Lagrange 方程（含外力）*：

#mitex(`
\frac{d}{dt}\left(\frac{\partial L}{\partial \dot q_k}\right)
-\frac{\partial L}{\partial q_k}
=
Q_k,\qquad k=1,\dots,n
`)



== 例：可变绳长摆（带径向外力）

人拉细线，末端有质点$m$,线长$l(t)$，受主动力$F(t)$。

取广义坐标 $(l,theta)$：

#mitex(`
T=\tfrac12 m(\dot l^{\,2}+l^2\dot\theta^2),\quad
V=-mgl\cos\theta
`)

#mitex(`
L=\tfrac12 m(\dot l^{\,2}+l^2\dot\theta^2)+mgl\cos\theta
`)

虚功：沿绳方向，#mi("Q_l=-F(t)")，角向无力 #mi("Q_\theta=0")。

对 #mi("l") 的方程

#mitex(`
\frac{\partial L}{\partial \dot l}=m\dot l,\quad
\frac{\partial L}{\partial l}=m l\dot\theta^2+m g\cos\theta
`)

#mitex(`
\frac{d}{dt}(m\dot l)-\left(m l\dot\theta^2+m g\cos\theta\right)=Q_l=-F(t)
`)

#mitex(`
\boxed{\ddot l-l\dot\theta^2-g\cos\theta=-\frac{F(t)}{m}}
`)

对 #mi("\theta") 的方程

#mitex(`
\frac{\partial L}{\partial \dot\theta}=m l^2\dot\theta,\quad
\frac{\partial L}{\partial \theta}=-m g l\sin\theta
`)

#mitex(`
\frac{d}{dt}(m l^2\dot\theta)+m g l\sin\theta=0
`)

#mitex(`
\boxed{l^2\ddot\theta+2l\dot l\,\dot\theta+g l\sin\theta=0}
`)

约束给定 #mi("l=l(t)") 时

若 #mi("l(t)") 为已知函数，则系统仅一自由度 #mi("\theta")，仍有

#mitex(`
l^2\ddot\theta+2l\dot l\,\dot\theta+g l\sin\theta=0
`)

此时外力 #mi("F(t)") 不出现在方程中。


== 例：双杆系统（含外力）

// [此处有示意图：两杆 OA、AB，转角 #mi("\theta_1,\theta_2")，在杆上点 #mi("D_1,D_2") 施力 #mi("F_1,F_2")]

- 广义坐标：$(theta_1,theta_2)$
- 力作用点到杆端距离：#mi("a_1,a_2")
- 力与杆夹角：#mi("\alpha_1,\alpha_2")

虚功分解：

#mitex(`
\delta W=\delta W_1+\delta W_2=Q_1\delta\theta_1+Q_2\delta\theta_2
`)

由几何关系得到（板书结果）：

#mitex(`
Q_1=F_1 a_1\sin\alpha_1+F_2 l_1\sin(\theta_2-\theta_1+\alpha_2)
`)

#mitex(`
Q_2=F_2 a_2\sin\alpha_2
`)

动能与势能由两杆质心速度计算：

#mitex(`
T=T_1+T_2,\qquad V=V_1+V_2
`)

并可写成矩阵形式

#mitex(`
T=\tfrac12 \dot q^T M(\theta_1,\theta_2)\dot q>0
`)

其中 #mi("M") 为对称正定质量矩阵。



== 4. 例：小车–摆系统（带水平外力）

// [此处有示意图：水平小车质量 #mi("M")，上有细杆质量 #mi("m")、长 #mi("l")，杆与竖直夹角 #mi("\theta")，车受水平力 #mi("F")]

取广义坐标 $(x,theta)$。

质心坐标与速度

#mitex(`
x_c=x+\tfrac{l}{2}\sin\theta,\qquad
y_c=y_0+\tfrac{l}{2}\cos\theta
`)

#mitex(`
\dot x_c=\dot x+\tfrac{l}{2}\dot\theta\cos\theta,\quad
\dot y_c=-\tfrac{l}{2}\dot\theta\sin\theta
`)

#mitex(`
v_c^2=\dot x^2+\tfrac14 l^2\dot\theta^2+l\dot x\dot\theta\cos\theta
`)

动能、势能与拉氏量

#mitex(`
T=\tfrac12 M\dot x^2+\tfrac12 m v_c^2+\tfrac12\left(\tfrac{1}{12}m l^2\right)\dot\theta^2
`)

#mitex(`
V=\tfrac12 m g l\cos\theta
`)

#mitex(`
L=\tfrac12(M+m)\dot x^2+\tfrac12 m l\dot x\dot\theta\cos\theta
+\tfrac16 m l^2\dot\theta^2-\tfrac12 m g l\cos\theta
`)

广义力：#mi("Q_x=F"), #mi("Q_\theta=0")。

对 #mi("x") 的方程

#mitex(`
\frac{d}{dt}\left[(M+m)\dot x+\tfrac12 m l\dot\theta\cos\theta\right]=F
`)

#mitex(`
(M+m)\ddot x+\tfrac12 m l\ddot\theta\cos\theta-\tfrac12 m l\dot\theta^2\sin\theta=F
`)

对 #mi("\theta") 的方程

#mitex(`
\frac{d}{dt}\left(\tfrac13 m l^2\dot\theta+\tfrac12 m l\dot x\cos\theta\right)
+\tfrac12 m g l\sin\theta=0
`)

化简：

#mitex(`
\tfrac13 m l^2\ddot\theta+\tfrac12 m l\ddot x\cos\theta-\tfrac12 m g l\sin\theta=0
`)
消去 #mi("\ddot x") 得到仅含 #mi("\theta") 的方程

由前式消去 #mi("\ddot x")，得到：

#mitex(`
\left(\tfrac13-\frac{m}{4(M+m)}\right)\ddot\theta
+\frac{m}{4(M+m)}\dot\theta^2\sin\theta\cos\theta
+\frac{\cos\theta}{2(M+m)l}F
-\frac{g}{2l}\sin\theta=0
`)


== 5. 含完整约束的拉格朗日方程

若系统存在 #mi("S") 个完整约束

#mitex(`
f_k(q,t)=0,\qquad k=1,\dots,S
`)

引入拉格朗日乘子 #mi("\lambda_k")，则 *第一类拉格朗日方程*：

#mitex(`
\frac{d}{dt}\left(\frac{\partial L}{\partial \dot q_i}\right)
-\frac{\partial L}{\partial q_i}
=
Q_i+\sum_{k=1}^S\lambda_k\frac{\partial f_k}{\partial q_i},
\qquad i=1,\dots,m
`)

配合约束方程 #mi("f_k=0") 可解出 #mi("q_i,\lambda_k")。


== 提示

- 质量矩阵 #mi("M(q)") 对称正定，#mi("T=\tfrac12\dot q^T M \dot q>0")。
- 选择广义坐标应尽量减少约束力出现。