self.$__dart_deferred_initializers__=self.$__dart_deferred_initializers__||Object.create(null)
$__dart_deferred_initializers__.current=function(a,b,c,$){var A={
b_5(d,e,f){var x,w,v,u,t
if(f<=C.c.gK(e))return C.c.gK(d)
if(f>=C.c.ga2(e))return C.c.ga2(d)
x=C.c.awV(e,new A.aMc(f))
w=d[x]
v=x+1
u=d[v]
t=e[x]
t=B.F(w,u,(f-t)/(e[v]-t))
t.toString
return t},
bgN(d,e,f,g,h){var x,w,v=B.a_P(null,null,y.b)
v.V(0,e)
v.V(0,g)
x=B.aj(v,!1,v.$ti.c)
w=B.a7(x).h("a6<1,n>")
return new A.aAB(B.aj(new B.a6(x,new A.aLE(d,e,f,g,h),w),!1,w.h("az.E")),x)},
aVH(d,e,f){var x,w,v,u
if(d==e)return d
if(d==null)return e.bn(0,f)
if(e==null)return d.bn(0,1-f)
x=A.bgN(d.a,d.IM(),e.a,e.IM(),f)
w=B.rX(d.d,e.d,f)
w.toString
v=B.rX(d.e,e.e,f)
v.toString
u=f<0.5?d.f:e.f
return new A.up(w,v,u,x.a,x.b,null)},
aAB:function aAB(d,e){this.a=d
this.b=e},
aMc:function aMc(d){this.a=d},
aLE:function aLE(d,e,f,g,h){var _=this
_.a=d
_.b=e
_.c=f
_.d=g
_.e=h},
alq:function alq(){},
up:function up(d,e,f,g,h,i){var _=this
_.d=d
_.e=e
_.f=f
_.a=g
_.b=h
_.c=i},
anY:function anY(d){this.a=d}},B,J,C,D
A=a.updateHolder(c[8],A)
B=c[0]
J=c[1]
C=c[2]
D=c[15]
A.aAB.prototype={}
A.alq.prototype={
IM(){var x,w,v,u=this.b
if(u!=null)return u
u=this.a.length
x=1/(u-1)
if(u>4294967295)B.A(B.c2(u,0,4294967295,"length",null))
w=J.mn(new Array(u),y.b)
for(v=0;v<u;++v)w[v]=v*x
return w}}
A.up.prototype={
LB(d,e,f){var x=this,w=x.d.a7(f).a3i(e),v=x.e.a7(f).a3i(e),u=x.IM()
return B.F1(w,v,x.a,u,x.f,null)},
D5(d,e){return this.LB(d,e,null)},
bn(d,e){var x=this,w=x.a,v=B.a7(w).h("a6<1,n>")
return new A.up(x.d,x.e,x.f,B.aj(new B.a6(w,new A.anY(e),v),!0,v.h("az.E")),x.b,null)},
ee(d,e){var x=A.aVH(d,this,e)
return x},
ef(d,e){var x=A.aVH(this,d,e)
return x},
k(d,e){var x=this
if(e==null)return!1
if(x===e)return!0
if(J.a1(e)!==B.y(x))return!1
return e instanceof A.up&&e.d.k(0,x.d)&&e.e.k(0,x.e)&&e.f===x.f&&B.du(e.a,x.a)&&B.du(e.b,x.b)},
gu(d){var x=this,w=B.cZ(x.a),v=x.b
v=v==null?null:B.cZ(v)
return B.V(x.d,x.e,x.f,x.c,w,v,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a)},
j(d){var x=this,w=B.a(["begin: "+x.d.j(0),"end: "+x.e.j(0),"colors: "+B.h(x.a)],y.h),v=x.b
if(v!=null)w.push("stops: "+B.h(v))
w.push("tileMode: "+x.f.j(0))
return"LinearGradient("+C.c.ca(w,", ")+")"}}
var z=a.updateTypes([])
A.aMc.prototype={
$1(d){return d<=this.a},
$S:488}
A.aLE.prototype={
$1(d){var x=this,w=B.F(A.b_5(x.a,x.b,d),A.b_5(x.c,x.d,d),x.e)
w.toString
return w},
$S:489}
A.anY.prototype={
$1(d){var x=B.F(null,d,this.a)
x.toString
return x},
$S:60};(function inheritance(){var x=a.inheritMany,w=a.inherit
x(B.D,[A.aAB,A.alq])
x(B.hH,[A.aMc,A.aLE,A.anY])
w(A.up,A.alq)})()
var y={h:B.W("o<e>"),b:B.W("H")};(function constants(){D.hs=new B.ex(C.B,C.B,C.B,C.B)})()}
$__dart_deferred_initializers__["ObICt4GdtpzLvNiPRis5qDCJH3k="] = $__dart_deferred_initializers__.current
