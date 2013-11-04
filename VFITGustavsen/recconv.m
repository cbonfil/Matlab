function [ ok ] = recconv( r,p,k )
ni=2e3;

maxt=20e-10;
time=linspace(0,maxt,ni);
dt=maxt/(ni+1);

% poly=t/b=[ t(1)*s^n t(2)*s^n-1 ... t(0)*s^0]/[ t(1)*s^n t(2)*s^n-1 ... t(0)*s^0]
% r1=0.5;
% c1=1;
% t = [c1 0];
% b = [ r1*c1 1];
% 
% [r,p,k] = residue(t,b);


V=inline('0.5*sign(t-1e-10)-0.5*sign(t-8e-10)');

[n1,n2]=size(r);
nr=max([n1 n2]);
Iout=zeros(ni,1);
I=zeros(nr,1);
J=I;
C=I;
e=exp(p*dt);

IDC=0.5*k*(V(time)+V(time-dt));


for t=2:ni


for i=1:nr

    J(i)=I(i)*e(i);
    C(i)=(V(time(t)))*r(i)*(e(i)-1)/p(i);
    I(i)=J(i)+C(i);
end

if isempty(k)
    k=0;
end

Iout(t)=sum(I)+IDC(t);
end



ht=zeros(1,ni);

for i=1:nr
   
    ht=ht+r(i).*exp(p(i)*time);
    
end
Vf=V(time);

Ctest=conv(Vf,ht,'full')*max(time)/length(time);

% hold on

plot(time,(Iout),time,1*Ctest(1:ni)+IDC,time,V(time),'r')
% axis([0 maxt -1.3 1.3])
legend('Recursive Conv','Regular Conv','Input');
% hold off


ok=1;
end

