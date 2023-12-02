// Condições iniciais:
Theta0=[20*%pi/180,20*%pi/180,30*%pi/180,30*%pi/180];
thetap0=0;
Phi0=[30*%pi/180,30.1*%pi/180,30*%pi/180,30.1*%pi/180];
phip0=0;
Psi0=[60*%pi/180,60.1*%pi/180,60*%pi/180,60.1*%pi/180];
psip0=0;
Massa=[10,10,1,1];
m=1;
a=1;
g=9.8;

// Espaço de estados:
funcprot(0);
 function dy=oscilador(t, y)
 a11=2*(M/(2*m)+1);
 a12=cos(y(1)-y(3));
 a13=cos(y(1)-y(5));
 a21=cos(y(1)-y(3));
 a31=cos(y(1)-y(5));
 b1=sin(y(1)-y(3))*(y(4))^2+sin(y(1)-y(5))*(y(6))^2+2*(M/(2*m)+1)*(g/a)*sin(y(1));
 b2=-sin(y(1)-y(3))*(y(2))^2+(g/a)*sin(y(3));
 b3=-sin(y(1)-y(5))*(y(2))^2+(g/a)*sin(y(5));
 dy(1)=y(2);
 dy(2)=(-a13*b3-a12*b2+b1)/(-a11+a12*a21+a13*a31);
 dy(3)=y(4);
 dy(4)=(a21*a13*b3+a11*b2-a13*a31*b2-a12*b1)/(-a11+a12*a21+a13*a31);
 dy(5)=y(6);
 dy(6)=(a11*b3-a12*a21*b3+a12*a31*b2-a13*b1)/(-a11+a12*a21+a13*a31);
endfunction;

// Solução da EDO:
i=1;
res=1000;
t=linspace(0,44,res);
while i<5
    M=Massa(i);
    theta0=Theta0(i);
    phi0=Phi0(i);
    psi0=Psi0(i);
    y=ode([theta0;thetap0;phi0;phip0;psi0;psip0],0,t,oscilador);
    Theta(i,:)=y(1,:);
    Thetap(i,:)=y(2,:);
    Phi(i,:)=y(3,:);
    Phip(i,:)=y(4,:);
    Psi(i,:)=y(5,:);
    Psip(i,:)=y(6,:);
    i=i+1;
end

// Encontrar onde 'Perturbada' e 'Referência' se separam:
n=1;
margem=0.1;
while abs((Psi(1,n)-Psi(2,n))/Psi(1,n))<=margem;
    n=n+1;
end
disp(n)
h=1;
while abs((Psi(3,h)-Psi(4,h))/Psi(3,h))<=margem;
    h=h+1;
end
disp(h)

// Divisão em linhas:
Rtheta1=[];
Rthetap1=[];
Rphi1=[];
Rphip1=[];
Rpsi1=[];
Rpsip1=[];
Ptheta1=[];
Pthetap1=[];
Pphi1=[];
Pphip1=[];
Ppsi1=[];
Ppsip1=[];
Rtheta2=[];
Rthetap2=[];
Rphi2=[];
Rphip2=[];
Rpsi2=[];
Rpsip2=[];
Ptheta2=[];
Pthetap2=[];
Pphi2=[];
Pphip2=[];
Ppsi2=[];
Ppsip2=[];
for j=n-15:res
    Rtheta1($+1)=Theta(1,j);
    Rthetap1($+1)=Thetap(1,j);
    Rphi1($+1)=Phi(1,j);
    Rphip1($+1)=Phip(1,j);
    Rpsi1($+1)=Psi(1,j);
    Rpsip1($+1)=Psip(1,j);
    Ptheta1($+1)=Theta(2,j);
    Pthetap1($+1)=Thetap(2,j);
    Pphi1($+1)=Phi(2,j);
    Pphip1($+1)=Phip(2,j);
    Ppsi1($+1)=Psi(2,j);
    Ppsip1($+1)=Psip(2,j);
end
for j=h-15:res
    Rtheta2($+1)=Theta(3,j);
    Rthetap2($+1)=Thetap(3,j);
    Rphi2($+1)=Phi(3,j);
    Rphip2($+1)=Phip(3,j);
    Rpsi2($+1)=Psi(3,j);
    Rpsip2($+1)=Psip(3,j);
    Ptheta2($+1)=Theta(4,j);
    Pthetap2($+1)=Thetap(4,j);
    Pphi2($+1)=Phi(4,j);
    Pphip2($+1)=Phip(4,j);
    Ppsi2($+1)=Psi(4,j);
    Ppsip2($+1)=Psip(4,j);
end
Rtheta1=Rtheta1.';
Rthetap1=Rthetap1.';
Rphi1=Rphi1.';
Rphip1=Rphip1.';
Rpsi1=Rpsi1.';
Rpsip1=Rpsip1.';
Ptheta1=Ptheta1.';
Pthetap1=Pthetap1.';
Pphi1=Pphi1.';
Pphip1=Pphip1.';
Ppsi1=Ppsi1.';
Ppsip1=Ppsip1.';
Rtheta2=Rtheta2.';
Rthetap2=Rthetap2.';
Rphi2=Rphi2.';
Rphip2=Rphip2.';
Rpsi2=Rpsi2.';
Rpsip2=Rpsip2.';
Ptheta2=Ptheta2.';
Pthetap2=Pthetap2.';
Pphi2=Pphi2.';
Pphip2=Pphip2.';
Ppsi2=Ppsi2.';
Ppsip2=Ppsip2.';

// Gráficos:
f1=scf(1);
xtitle("CI1: psi em função de theta e phi","theta","phi","psi");
comet3d(Rtheta1,Rphi1,Rpsi1,"colors",1);
comet3d(Ptheta1,Pphi1,Ppsi1,"colors",2);
f2=scf(2);
xtitle("CI1: d(psi)/dt em função de d(theta)/dt e d(phi)/dt","d(theta)/dt","d(phi)/dt","d(psi)/dt");
comet3d(Rthetap1,Rphip1,Rpsip1,"colors",1);
comet3d(Pthetap1,Pphip1,Ppsip1,"colors",2);
f3=scf(3);
xtitle("CI2: psi em função de theta e phi","theta","phi","psi");
comet3d(Rtheta2,Rphi2,Rpsi2,"colors",1);
comet3d(Ptheta2,Pphi2,Ppsi2,"colors",2);
f4=scf(4);
xtitle("CI2: d(psi)/dt em função de d(theta)/dt e d(phi)/dt","d(theta)/dt","d(phi)/dt","d(psi)/dt");
comet3d(Rthetap2,Rphip2,Rpsip2,"colors",1);
comet3d(Pthetap2,Pphip2,Ppsip2,"colors",2);

