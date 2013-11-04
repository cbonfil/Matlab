close all
clear all


Is=1e-12;
Vt=0.0263;
Vbc=linspace(-15,15,1e4);
Vbe=-25;

af=0.91;
bf=af/(1-af);

ar=0.5;
br=ar/(1-ar);

  ex = inline('exp(V/0.0263)-1');
Ie=Is/af*ex(Vbe)-Is*ex(Vbc);
Ic=Is*exp(Vbe)-Is/ar*exp(Vbc);
Ib=Is/bf*exp(Vbe)-Is/br*exp(Vbc);


plot(Vbc,Ic);