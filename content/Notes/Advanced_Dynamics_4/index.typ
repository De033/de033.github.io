#import "../index.typ": *
#import "@preview/theorion:0.4.1": *
#import "@preview/tablem:0.3.0": *

#import "@preview/cmarker:0.1.8"
#import "@preview/mitex:0.2.6": *


#show: template.with(
  title: "高等动力学Lecture5",
  description: "Hamilton力学",
)

== Hamilton力学
$n$个自由度的完整系统，对应的第二类拉格朗日方程$ d/(d t) ((partial L) /(partial dot(q_i)))-(partial L)/(partial q_i)=Q_i $<Eular-Lagrange方程>
定义广义动量$P_i=(partial L)/(partial dot(q_i))$<动量定义>，代入得$ dot(P_i)=(partial L)/(partial q_i)+Q_i $<e3>
#tufted.margin-note[为了使得方程更加对称，应可能把$L$改写为包含$q,p$的函数]
定义广义能量$h(q,dot(q),p,t)=sum_(i=1)^n P_i dot(q_i)-L(q,dot(q),p,t)$
#quote-box[
  勒让德变换\
  $f(x,y)$为二元函数，$d f=u d x+v d y$\
  引入$g=f-u x$，微分得$d g=d f-u d x -x d u=v d y -x d u$
]
定义Jacobi矩阵$J=(partial(p_1,p_2,...,p_n)/(partial(dot(q_1),dot(q_2),...,dot(q_n))))$，是Lagrange量的Hessian矩阵
#tufted.margin-note[Jacobi矩阵是系统的质量矩阵]
$p_i=p_i(q,dot(q),t)$以$dot(q)$为变量,$M$一般为正定矩阵，根据反函数定理，所以$dot(q_i)=dot(q_i) (p,t)$
定义Hamilton量$ H(q,p,t)&= [sum_(i=1)^n p_i dot(q_i)-L(q,dot(q),t)]_(dot(q)=dot(q) (q,p,t))\ & =p^T dot(q) -L $<Hamilton量定义>
$ => (partial H)/(partial q_k) =&p_i (partial dot(q_i))/(partial q_k)-(partial L)/(partial q_k)- (partial L)/(partial dot(q_i)) (partial dot(q_i))/(partial q_k) \ &= - (partial H)/(partial p_k) \ & =-dot(p_k)+Q_k $
$ dot(p_k)=- (partial H)/(partial q_k)+hat(Q_k) (q,p,t) $<e9>
$ => (partial H)/(partial p_k) &= partial /(partial p_k) (p_i dot(q_i)) - (partial L)/(partial p_k)\ &= dot(q_k)-p_i (partial dot(q_i))/(partial p_k) -  (partial L)/(partial p_k) (partial dot(q_i))/(partial p_k)\ &= dot(q_k) $<e10>
联立 @e9 和 @e10 得Hamilton正则方程：$ dot(q_k)= (partial H)/(partial p_k)\ dot(p_k)=- (partial H)/(partial q_k)+hat(Q_k) $
如果为保守系统$hat(Q_k)=0$，正则方程化为$ dot(q_k)= (partial H)/(partial p_k)\ dot(p_k)=- (partial H)/(partial q_k) $
$ (d H (q,p,t))/d t &=  (partial H)/(partial t)  dot(q_k)+(partial H)/(partial q_k) dot(q_k)+(partial H)/(partial t)\ &=(partial H)/(partial q_k) (partial H )/(partial p_k)+(partial H)/(partial p_k)(-(partial H)/(partial q_k))+(partial H)/(partial t) $
$ (d H)/(d t)=(d h)/(d t)=(partial H (q,p,t))/(partial t)=-(partial L)/(partial t) $<e11>

== 对称性和守恒量
如果$L(q,dot(q),t)=L(q,dot(q))$，即不显含时间，根据@e11 则Hamilton量$H(q,p,t)$是守恒量，表示系统的广义能量保持不变。\
所以时间对称平移，对应广义能量守恒\
如果$L(q,dot(q),t)$不显含广义坐标$q_s$，$(partial L)/(partial q_s)=0$，则对应的广义动量守恒\
此时$L(q_1,...,q_s,...,q_n,dot(q),t)=L(q_1,...,q_s+c,...,q_n,dot(q),t)$\
$q_s$称为循环坐标，或可逆坐标\
所以$"空间对称性"<=>"广义动量守恒"$

== 基本步骤
$ L&=T-V \ &=1/2 dot(q)^T M dot(q)+b(q,t) dot(q)+T_0 - V $
对应广义动量$ p&=(partial L)/(partial dot(q))\ &=M dot(q)+b(q,t) $
对应广义能量$ h=1/2 dot(q)^T M dot(q)+T_0 - V $
若$Q=0$，且$L$和$H$都不显含时间，则广义能量守恒，$h="const"$

== 例：椭圆摆
在光滑的平面上，有一小球可在x轴上随意的运动，悬挂一根长度为$l$，质量为$m$的杆，无摩擦力，求运动方程，广义坐标$theta,x$
$ T=1/2 m v_c^2 +1/2 J_c dot(theta)^2 $
$ v^2_c=dot(x)^2+dot(y)^2 $
$ => L=1/2 m dot(x)^2 +1/6 m l^2 dot(theta)^2+1/2 m l dot(x) dot(theta) cos(theta)+1/2 m g l cos(theta) $
$ (partial L)/(partial x)=0 => p_x="const" $
$ (partial L)/(partial t)=0,Q=0 $
$ =>h=T_2+V="const" $
$ => E&=1/2 m dot(x)^2 +1/6 m l^2 dot(theta)^2+1/2 m l dot(x) dot(theta) cos(theta)-1/2 m g l cos(theta)\ &= "const" $ 
考察在平衡点 $theta approx 0$ 附近的微振动：

+ 势能的一阶导与二阶导：
   - $V'(theta) = 1/2 m g l sin theta => V'(0) = 0$ （平衡位置）
   - $V''(theta) = 1/2 m g l cos theta => V''(0) = 1/2 m g l$

+ 固有频率计算：
#mitex(`\omega = \sqrt{\frac{V''(0)}{M(0)}} = \sqrt{\frac{\frac{1}{2} m g l}{\frac{1}{12} m l^2}} = \sqrt{6 \frac{g}{l}}`)

#tufted.margin-note[
  *注意*：此频率与普通单摆（长度为 #mi("l")）的频率 #mi("\sqrt{g/l}") 不同，体现了基座滑动对频率的放大效应。
]
特殊情况分析：$p_x = 0$ 时的轨迹

若初始状态下系统水平方向动量 #mi("p_x = 0")，由于水平方向无外力，根据动量守恒：
#mitex(`\dot{x} = -\frac{1}{2} l \dot{\theta} \cos \theta`)

积分得：
#mitex(`x = -\frac{l}{2} \sin \theta + C`)
若取初始条件 #mi("x(t=0) = 0")，则 #mi("C = 0")。

此时，杆末端 $B$ 点的坐标为：
#mitex(`
\begin{cases}
x_B = x + l \sin \theta = \frac{l}{2} \sin \theta \\
y_B = -l \cos \theta
\end{cases}
`)

消去参数 $theta$，得到 $B$ 点的运动轨迹方程：
#mitex(`\left( \frac{x_B}{l/2} \right)^2 + \left( \frac{y_B}{l} \right)^2 = 1`)
#tufted.margin-note[
  *结论*：在 $p_x = 0$ 的条件下，杆端 $B$ 点的轨迹是一个*椭圆*，这也是“椭圆摆”名称的由来。
]

