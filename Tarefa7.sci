//Condições iniciais:
alpha=%pi/6;
theta0=alpha/(2*k);
phi0=alpha;
psi0=0;
thetap0=0;
phip0=0;
psip0=0;
a=1;
g=10;
M=100;
m=0.1;
k=sqrt(M/(2*m)+1);
kq=k^2;
wq=g/a;

t=linspace(0,80,1000);

funcprot(0);
function dy=oscilador(t,y)
    y=kq-1;
    z=y(3)+y(5);
    dy(1)=y(2);
    dy(2)=(wq*z/(2*y))-((2*kq*wq*y(1))/(2*y));
    dy(3)=y(4);
    dy(4)=(-wq*z)/(2*y)+(kq+wq*y(1))/y-wq*y(3);
    dy(5)=y(6);
    dy(6)=(-wq*z)/(2*y)+(kq*wq*y(1))/y-wq*y(5);
endfunction

y=ode([theta0;thetap0;phi0;phip0;psi0;psip0],0,t,oscilador);
theta=y(1,:);
thetap=y(2,:);
phi=y(3,:);
phip=y(4,:);
psi=y(5,:);
psip=y(6,:);

f1=scf(1);
plot(t,psi,'r');
plot(t,phi,'g');
plot(t,theta,'b');
h1=legend(["Psi", "Phi", "Theta"], "in_upper_right");
