theta0=2*%pi/180;
thetap0=0;
phi0=-1*%pi/180;
phip0=0;
psi0=0;
psip0=0;
Massa=[100,10,10];
A=[1,1,2];
m=1;
g=10;

for i=1:3
    t=linspace(0,20,1000);
    funcprot(0);
      function dy=oscilador(t,y)
      M=Massa(i);
      a=A(i);
      k2=M/(2*m)+1;
      w2=g/a;
      dy(1)=y(2);
      dy(2)=(w2*(y(3)+y(5))-2*k2*w2*y(1))/(2*(k2-1));
      dy(3)=y(4);
      dy(4)=(-w2*(y(3)+y(5))+2*k2*w2*y(1))/(2*(k2-1))-w2*y(3);
      dy(5)=y(6);
      dy(6)=(-w2*(y(3)+y(5))+2*k2*w2*y(1))/(2*(k2-1))-w2*y(5);
    endfunction;
    y=ode([theta0;thetap0;phi0;phip0;psi0;psip0],0,t,oscilador);
    Theta(i,:)=y(1,:);
    Thetap(i,:)=y(2,:);
    Phi(i,:)=y(3,:);
    Phip(i,:)=y(4,:);
    Psi(i,:)=y(5,:);
    Psip(i,:)=y(6,:);
end

f1=scf(1)
plot(t,Theta(1,:),"b")
plot(t,Theta(2,:),"r")
plot(t,Theta(3,:),"g")
xtitle('Theta em função do tempo')
h1=legend(['Condição 1','Condição 2','Condição 3'])
f2=scf(2)
plot(t,Phi(1,:),"b")
plot(t,Phi(2,:),"r")
plot(t,Phi(3,:),"g")
xtitle('Phi em função do tempo')
h1=legend(['Condição 1','Condição 2','Condição 3'])
f3=scf(3)
plot(t,Psi(1,:),"b")
plot(t,Psi(2,:),"r")
plot(t,Psi(3,:),"g")
xtitle('Psi em função do tempo')
h1=legend(['Condição 1','Condição 2','Condição 3'])
