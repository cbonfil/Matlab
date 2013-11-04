function [ fcir ] = fapd( w )


wa=1e-6 ;         %Absorbtion layer thickness (m)
xg=150e-9;        %Grading layer thickness    (m)
xc=150e-9;        %Charge layer thickness     (m)
xm=200e-9;        %Multiplication layer thickness  (m)
vn=8e4;           %Saturation velocity of the electrons (m/s)
vp=6e4;           %Saturation velocity of the holes     (m/s)
tm=1/(2*pi*120e9); %Avalanche buildup time              (s)
alpha=1.15e6; %Absorbption coefficient of the absorption region
h=6.626068e-34;    %Plancks constant      (m2kg/s) 
v=3e8/1550e-9;    %Frequency of the incident light  (hz)
xt=xg+xc;   %total thickness of the grading and charge layers (m)
D=200e-9;    %Width of the whole depletion region
M=9;    %Multiplication Gain
P0=1; %power of incident light
n=0.60;  %external quantum efficien
q=1.602e-19;
c=q*n*P0/(D*h*v);

R=70;
C=0.15e-12;
L=2.5e-9;

N1=(exp(-1j*w*(xt+xm)/vn)).*(exp(-alpha*wa)-exp(-1j*w*wa/vn)).*(((1j*w).^-1+(alpha*vn+1j*w).^-1))+(1j*w).^-1.*(1-exp(-alpha*wa));
Ns1=(1./(1j*w)+1./(alpha*vn+1j*w)).*(exp(-1j*w*wa/vn)-exp(-alpha*wa)).*(exp(-1j*w*xt/vn).*(1-exp(-1j*w*xm/vn))).*((M-1)./(1+1j*w*(M-1)*tm));
P1=((alpha*vp+1j*w).^-1).*(1-exp(-alpha*wa-(1j*w*wa/vp)))+((-exp(-alpha*wa)./(1j*w)).*(1-exp(-1j*w*wa/vp)));
Ps1=(exp(-1j*w*xt/vn)).*((1j*w).^-1+(alpha*vn+1j*w).^-1).*((1-exp(-1j*w*(xt+wa)/vp))).*(exp(-1j*w*wa/vn)-exp(-alpha*wa)).*((M-1)./(1+1j*w*(M-1)*tm));
Hex=(1+1j*w*R*C-w.^2*C*L).^-1;
fcir=c*(((vn*(Ns1+N1)+vp*(Ps1+P1)).*Hex ));

end

