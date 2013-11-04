close all
clear all

ni=1e3;
I=0.5;
f=inline('1e-15*(exp(38*V)-1)-I');
df=inline('1e-15*38*exp(38*V)');

% f=inline('x^2-I');
% df=inline('2*x');

Iin=logspace(-20,0,ni);


 V0=0.7;
  V1=0.7; 
  tic
 
for t=1:ni
  
 
I=Iin(t);

for i=1:265
    
   V1=V0- (f(I,V0)/df(V0));
   dV(i)=V0-V1;
   V0=V1;
   V0;
    if abs(dV(i))<1e-6
        break;
    end
end
nit(t)=i;
% V0
dVt(t)=dV(i);
V(t)=V0;


end
toc
avit=mean(nit)
plot(I(5:t))
% loglog(Iin(5:t),V(5:t))
% getframe;
