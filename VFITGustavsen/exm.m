% ex1.m             
%
% Fitting an artificially created frequency response (single element)
%
% -Creating a 3rd order frequency response f(s)
% -Fitting f(s) using vectfit3.m 
%   -Initial poles: 3 logarithmically spaced real poles
%   -1 iteration
%
% This example script is part of the vector fitting package (VFIT3.zip) 
% Last revised: 08.08.2008. 
% Created by:   Bjorn Gustavsen.
%
clear all
close all


% %Frequency samples:
% Ns=2001;
% s=2*1i*linspace(1e9,70e10,Ns); 
% N=10; %order of approximation
% 
% [ f ] = fapd( -1j*s );
% f=abs(f);
% % f=(rand(1,Ns)+2*s);
% % f=abs(f);
% % f=(0.7./(s+10))+(1./(s+2))+(0.9./(s+1));
% 
% % r1=abs(5*rand(N,1));
% % p1=20*(rand(N,1)-2);
% % k=0;
% % f=0;
% % for i=1:N
% % f=f+r1(i)./(s-p1(i));
% % end
% % f=f+k;
% % [R,P,K] = residue(B,A)
% 
% %Initial poles for Vector Fitting:
% 
% poles=-2*pi*logspace(0,10,N); %Initial poles
% 
% weight=ones(1,Ns); %All frequency points are given equal weight
% 
% opts.relax=1;      %Use vector fitting with relaxed non-triviality constraint
% opts.stable=1;     %Enforce stable poles
% opts.asymp=2;      %Include both D, E in fitting    
% opts.skip_pole=0;  %Do NOT skip pole identification
% opts.skip_res=0;   %Do NOT skip identification of residues (C,D,E) 
% opts.cmplx_ss=1;   %Create complex state space model
% 
% opts.spy1=0;       %No plotting for first stage of vector fitting
% opts.spy2=1;       %Create magnitude plot for fitting of f(s) 
% opts.logx=1;       %Use logarithmic abscissa axis
% opts.logy=1;       %Use logarithmic ordinate axis 
% opts.errplot=1;    %Include deviation in magnitude plot
% opts.phaseplot=1;  %Also produce plot of phase angle (in addition to magnitiude)
% opts.legend=1;     %Do include legends in plots
% 
% 
% disp('vector fitting...')
% [SER,poles,rmserr,fit]=vectfit3(f,s,poles,weight,opts); 
% disp('Done.')
% 
% disp('Resulting state space model:')
% A=full(SER.A);
% B=SER.B;
% C=SER.C;
% D=SER.D;
% E=SER.E;
% rmserr 
% 
% r=(C.*B')';
% p=diag(A);
% k=D;
p =1.0e+11 *[
  -0.6532 + 6.5249i;
  -0.6532 - 6.5249i;
  -0.9506 + 4.4434i;
  -0.9506 - 4.4434i;
  -1.2721 + 2.9742i;
  -1.2721 - 2.9742i;
  -1.4246 + 1.6007i;
  -1.4246 - 1.6007i;
  -0.1400 + 0.4970i;
  -0.1400 - 0.4970i;
  -1.1074 + 0.4152i;
  -1.1074 - 0.4152i;
  -0.7518 + 0.0000i];


r =2*1.0e+11 *[
  -0.0003 + 0.0000i;
  -0.0003 - 0.0000i;
  -0.0005 - 0.0028i;
  -0.0005 + 0.0028i;
  -0.0407 - 0.0003i;
  -0.0407 + 0.0003i;
   0.1917 + 0.4057i;
   0.1917 - 0.4057i;
  -0.2334 - 0.0096i;
  -0.2334 + 0.0096i;
   1.1119 - 3.1049i;
   1.1119 + 3.1049i;
  -2.0584 + 0.0000i];


k = 0;

[ q] = recconv( r,p,k );

