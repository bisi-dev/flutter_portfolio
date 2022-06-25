self.$__dart_deferred_initializers__=self.$__dart_deferred_initializers__||Object.create(null)
$__dart_deferred_initializers__.current=function(a,b,c,$){var B={Bm:function Bm(d,e){this.a=d
this.b=e},
aYT(){var x=new B.ae3(A.c([new B.a0Z(),new B.XT(),new B.UU(),new B.Wm(),new B.Wo(),new B.Xz(),new B.a0X()],y.p))
x.d=B.aW5(null)
return x},
ae3:function ae3(d){var _=this
_.a=d
_.d=_.c=null
_.f=_.e=0
_.ax=_.at=null},
jW:function jW(){},
a0Z:function a0Z(){},
XT:function XT(){},
UU:function UU(){},
Wm:function Wm(){},
Wo:function Wo(){},
Xz:function Xz(){},
a0X:function a0X(){},
a4E:function a4E(){var _=this
_.c=_.b=_.a=null
_.d=0
_.as=_.Q=_.x=_.w=_.f=_.e=null},
aW8(){return new B.qH("Transaction terminated",null,null,null,!1,D.AJ,!1)},
qH:function qH(d,e,f,g,h,i,j){var _=this
_.a=d
_.b=e
_.c=f
_.d=g
_.e=h
_.f=i
_.r=j},
aYC(){return new B.rL(null)},
rL:function rL(d){this.a=d},
Bj:function Bj(d){this.a=d},
Vx:function Vx(d,e,f){var _=this
_.f=_.e=null
_.x=_.w=0
_.bA$=d
_.al$=e
_.a=null
_.b=f
_.c=null},
aoh:function aoh(d){this.a=d},
aoi:function aoi(d){this.a=d},
aoj:function aoj(d){this.a=d},
aog:function aog(d){this.a=d},
Km:function Km(){},
ae5:function ae5(){},
ae6:function ae6(d){this.a=d},
ae7:function ae7(d,e){this.a=d
this.b=e},
aW5(d){var x
if(d==null)return""
x=A.bF("[^0-9]",!0,!1)
return A.ha(d,x,"")},
aDS(d){var x=0,w=A.C(y.H)
var $async$aDS=A.y(function(e,f){if(e===1)return A.z(f,w)
while(true)switch(x){case 0:$.aK5=d
return A.A(null,w)}})
return A.B($async$aDS,w)},
aDR(d,e){var x=0,w=A.C(y.f),v,u,t
var $async$aDR=A.y(function(f,g){if(f===1)return A.z(g,w)
while(true)switch(x){case 0:t=$.aK5
if(t==null||t.length===0)throw A.b(A.R0("not-initialized",null,"You are yet to initialize FlutterPaystackClient",null))
u=$.aPu()
t.toString
t=u.Gq(e,t)
v=t
x=1
break
case 1:return A.A(v,w)}})
return A.B($async$aDR,w)}},A,G,C,F,D,E,J
B=a.updateHolder(c[6],B)
A=c[0]
G=c[22]
C=c[2]
F=c[8]
D=c[23]
E=c[15]
J=c[1]
B.Bm.prototype={
j(d){return"CheckoutMethod."+this.b}}
B.ae3.prototype={
j(d){var x=this
return"PaymentCard{_cvc: "+A.d(x.d)+", expiryMonth: "+x.e+", expiryYear: "+x.f+", _type: "+A.d(x.at)+", _last4Digits: "+A.d(x.ax)+" , _number: "+A.d(x.c)+"}"},
gah(){return null}}
B.jW.prototype={}
B.a0Z.prototype={
j(d){return"Visa"}}
B.XT.prototype={
j(d){return"MasterCard"}}
B.UU.prototype={
j(d){return"American Express"}}
B.Wm.prototype={
j(d){return"Diners Club"}}
B.Wo.prototype={
j(d){return"Discover"}}
B.Xz.prototype={
j(d){return"JCB"}}
B.a0X.prototype={
j(d){return"VERVE"}}
B.a4E.prototype={}
B.qH.prototype={
j(d){var x=this
return"CheckoutResponse{message: "+A.d(x.a)+", card: "+A.d(x.b)+", account: "+A.d(x.c)+", reference: "+A.d(x.d)+", status: "+x.e+", method: "+x.f.j(0)+", verify: "+x.r+"}"},
gaG(d){return this.a}}
B.rL.prototype={
F(d,e){var x=null
return A.wW(x,!1,new B.Bj(x),A.pD(x,x,x,G.w1),"Flutterwave")}}
B.Bj.prototype={
a7(){return new B.Vx(null,null,C.m)}}
B.Vx.prototype={
an(){var x,w=this,v=null,u=A.bx(v,C.aY,v,1,v,w)
w.e=u
x=y.Z
w.f=new A.a3(A.b8(new A.c8(0,1,C.a8),u,v),new A.aa(0,1,x),x.i("a3<ac.T>"))
w.hw(0)
B.aDS("pk_test_d21f9fa5d4ef5cf7227a106d5b3f5c6ff0a35459")
w.aD()},
xC(){var x=0,w=A.C(y.z),v=this,u,t,s,r
var $async$xC=A.y(function(d,e){if(d===1)return A.z(e,w)
while(true)switch(x){case 0:t=new B.a4E()
s=y.N
r=A.J(s,y.z)
t.e=r
t.d=-1
t.w=A.J(s,y.T)
s=A.c([],y.t)
t.f=s
r.m(0,"custom_fields",s)
t.x="en_NG"
t.as="NGN"
t.b="paystackcustomer@qa.team"
t.d=1e5
t.Q="ref_"+Date.now()
s=v.c
s.toString
x=2
return A.m(B.aDR(s,t),$async$xC)
case 2:u=e
if(u.e)A.f_("Charge was successful. Ref: "+A.d(u.d))
else A.f_("Failed: "+A.d(u.a))
return A.A(null,w)}})
return A.B($async$xC,w)},
n(d){var x=this.f
x.gbh(x)
this.e.n(0)
this.a3E(0)},
hw(d){var x=0,w=A.C(y.H),v=this,u
var $async$hw=A.y(function(e,f){if(e===1)return A.z(f,w)
while(true)switch(x){case 0:u=v.e
if(u!=null)u.b9(0)
u=y.z
x=2
return A.m(A.iv(C.aZ,null,u),$async$hw)
case 2:v.H(new B.aoh(v))
x=3
return A.m(A.iv(C.aZ,null,u),$async$hw)
case 3:v.H(new B.aoi(v))
x=4
return A.m(A.iv(C.aZ,null,u),$async$hw)
case 4:v.H(new B.aoj(v))
return A.A(null,w)}})
return A.B($async$hw,w)},
F(d,e){var x,w,v,u=null,t=y.Y,s=A.bP(A.c([new F.v_(1.2,A.hW("assets/item.png",u,u,u,u,$.lh?"flutter_paystack_app":u,u),u)],t),C.q,C.v,C.n),r=C.f.ao(127.5),q=y.X,p=A.c([new A.cl(0,C.at,A.aw(r,255,255,255),D.we,10)],q),o=A.aE("Test Product",u,u,u,u,u,A.aI(u,u,C.l,u,u,u,u,u,u,u,u,22,u,C.aT,u,u,!0,u,0.27,u,u,u,u,u,u),C.ac,u,u),n=A.bL(A.c([A.aE("\u20a6 1000.00",u,u,u,u,u,A.aI(u,u,D.eN,u,u,u,u,u,u,u,u,22,u,C.d1,u,u,!0,u,0.27,u,u,u,u,u,u),C.ac,u,u),A.ah(u,A.bL(A.c([A.aE("5.0",u,u,u,u,u,A.aI(u,u,C.l,u,u,u,u,u,u,u,u,22,u,C.d1,u,u,!0,u,0.27,u,u,u,u,u,u),C.ac,u,u),A.ch(D.He,D.eN,u,24)],t),C.q,u,C.v,C.n),C.i,u,u,u,u,u,u,u,u,u,u)],t),C.q,u,C.b5,C.n),m=this.w
m=A.cJ(F.LC(!1,new A.aN(E.d_,A.aE("Test Product is a beautiful product to purchase.",u,3,C.ab,u,u,A.aI(u,u,C.l,u,u,u,u,u,u,u,u,14,u,C.d1,u,u,!0,u,0.27,u,u,u,u,u,u),C.h3,u,u),u),C.t,C.aZ,m),1)
x=this.x
w=new A.d9(A.aw(51,255,255,255),1,C.au)
v=A.ah(u,A.ah(u,A.ch(D.Hg,D.eN,u,28),C.i,u,u,new A.bn(E.eP,u,new A.dl(w,w,w,w),C.bS,u,u,C.C),u,u,u,u,u,u,u),C.i,u,u,u,u,48,u,u,u,u,48)
q=A.c([new A.cl(0,C.at,A.aw(r,0,182,240),D.we,10)],q)
return A.ah(u,A.eP(u,C.r,A.bP(A.c([s,A.bP(A.c([A.ah(u,new A.aN(C.ic,A.SP(A.ah(u,A.bP(A.c([new A.aN(D.GB,o,u),new A.aN(E.pc,n,u),m,F.LC(!1,new A.aN(D.Gx,A.bL(A.c([v,D.Pv,A.cJ(A.cQ(!1,u,!0,A.ah(u,A.eC(A.aE("Pay with Paystack",u,u,u,u,u,A.aI(u,u,C.l,u,u,u,u,u,u,u,u,18,u,C.aT,u,u,!0,u,0,u,u,u,u,u,u),C.ac,u,u),u,u),C.i,u,u,new A.bn(D.eN,u,u,C.bS,q,u,C.C),u,48,u,u,u,u,u),u,!0,u,u,u,u,u,u,u,u,u,u,new B.aog(this),u,u,u),1)],t),C.q,u,C.ap,C.n),u),C.t,C.aZ,x),new A.bg(u,10,u,u)],t),C.aw,C.ap,C.n),C.i,u,new A.aF(0,1/0,230,230),u,u,u,u,u,u,u,u),u,C.X,u,u,C.Y),u),C.i,u,u,new A.bn(E.eP,u,u,D.ze,p,u,C.C),u,u,u,u,u,u,u)],t),C.q,C.v,C.n)],t),C.q,C.b5,C.n),u),C.i,E.eP,u,u,u,u,u,u,u,u,u)}}
B.Km.prototype={
bz(){this.bZ()
this.bQ()
this.cU()},
n(d){var x=this,w=x.al$
if(w!=null)w.I(0,x.gcJ())
x.al$=null
x.aL(0)}}
B.ae5.prototype={
Gq(d,e){return this.alN(d,e)},
alN(d,e){var x=0,w=A.C(y.f),v,u,t,s,r,q
var $async$Gq=A.y(function(f,g){if(f===1)return A.z(g,w)
while(true)switch(x){case 0:s=new A.a0($.a_,y.D)
r=new A.ax(s,y.g)
q=d.b
q.toString
u=d.d
t=d.Q
t.toString
J.aV4(self.PaystackPop.setup({key:e,email:q,amount:u,ref:t,onClose:A.h9(new B.ae6(r)),callback:A.h9(new B.ae7(r,d))}))
v=s
x=1
break
case 1:return A.A(v,w)}})
return A.B($async$Gq,w)}}
var z=a.updateTypes([])
B.aoh.prototype={
$0(){},
$S:1}
B.aoi.prototype={
$0(){this.a.w=1},
$S:1}
B.aoj.prototype={
$0(){this.a.x=1},
$S:1}
B.aog.prototype={
$0(){this.a.xC()},
$S:1}
B.ae6.prototype={
$0(){this.a.bt(0,B.aW8())},
$S:0}
B.ae7.prototype={
$1(d){var x,w=J.o(d),v=w.gaG(d),u=w.gas_(d)
w=J.e(w.gbh(d),"success")
x=this.b.a
if(x==null)x=B.aYT()
this.a.bt(0,new B.qH(v,x,null,u,w,D.AI,!0))},
$S:456};(function aliases(){var x=B.Km.prototype
x.a3E=x.n})();(function inheritance(){var x=a.mixinHard,w=a.inherit,v=a.inheritMany
w(B.Bm,A.lZ)
v(A.E,[B.ae3,B.jW,B.a4E,B.qH,B.ae5])
v(B.jW,[B.a0Z,B.XT,B.UU,B.Wm,B.Wo,B.Xz,B.a0X])
w(B.rL,A.av)
w(B.Bj,A.a1)
w(B.Km,A.a7)
w(B.Vx,B.Km)
v(A.je,[B.aoh,B.aoi,B.aoj,B.aog,B.ae6])
w(B.ae7,A.dM)
x(B.Km,A.cR)})()
A.kT(b.typeUniverse,JSON.parse('{"Bm":{"Y":[]},"a0Z":{"jW":[]},"XT":{"jW":[]},"UU":{"jW":[]},"Wm":{"jW":[]},"Wo":{"jW":[]},"Xz":{"jW":[]},"a0X":{"jW":[]},"rL":{"av":[],"h":[]},"Bj":{"a1":[],"h":[]},"Vx":{"a7":["Bj*"]}}'))
var y=(function rtii(){var x=A.N
return{f:x("qH"),p:x("l<jW>"),t:x("l<aq<i,@>>"),X:x("l<cl*>"),Y:x("l<h*>"),N:x("i"),Z:x("aa<R*>"),g:x("ax<qH>"),D:x("a0<qH>"),z:x("@"),T:x("i?"),H:x("~")}})();(function constants(){D.ze=new A.cy(E.dr,E.dr,C.a1,C.a1)
D.AI=new B.Bm(0,"card")
D.AJ=new B.Bm(2,"selectable")
D.eN=new A.p(4278236912)
D.Gx=new A.am(16,0,16,16)
D.GB=new A.am(18,32,16,0)
D.He=new A.cc(58873,"MaterialIcons",null,!1)
D.Hg=new A.cc(61224,"MaterialIcons",null,!1)
D.we=new A.r(1.1,1.1)
D.Pv=new A.bg(16,null,null,null)})();(function staticFields(){$.aK5=null})();(function lazyInitializers(){var x=a.lazy
x($,"b8J","aPu",()=>new B.ae5())})()}
$__dart_deferred_initializers__["ZPfoqA8rfIAj6sc6q69KS4s656w="] = $__dart_deferred_initializers__.current
