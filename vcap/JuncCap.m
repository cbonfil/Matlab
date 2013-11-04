function [f,dfdV1,dfdV2] = JuncCap (V1,V2,time,dVdt)

global dt;

%V=V1-V2;
%f=C(V)dV/dt;
%C(V)= K/sqrt(V-Vbi);
%dV/dt=(V_t2-V_t1)/dt=( (V2_t2 - V1_t2) - (V1_t1 - V1_t1) )/dt;

 A=1;
 mu=1.4;
 ro=6.4e2;
 Vbi= 0.7;
 er=11.9;
 e0=8.854187817e-12;

 
K=(er*e0*A)/sqrt(2*mu*ro);
if time == 0.00
    C=0;
else
    
    if (V1-V2+Vbi)>0 %Capacitor has to be real valued
        C=K/sqrt((V1-V2+Vbi));
    else
        C=1e-20;
    end
    
end

f=C*dVdt;

dCdV1=K*(-1/2)*(V1-V2-Vbi)^(-3/2);
dCdV2=K*(1/2)*(V1-V2-Vbi)^(-3/2);

dVdtdV1 =  1/dt;
dVdtdV2 = -1/dt;

dfdV1=dCdV1*dVdt + C*dVdtdV1;
dfdV2=dCdV2*dVdt + C*dVdtdV2;
end


