close all
clear all

for t=1:1e6
tic 
a=50/2;
t1=toc;

tic 
b=50*0.5;
t2=toc;

tz(t)=t1/t2;
tf(t)=mean(tz);

if mod(t,1e3)==0
plot(tf)
getframe;
end


end
