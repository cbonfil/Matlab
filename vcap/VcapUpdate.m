function [ Inst ] = VCapUpdate( Inst, mode, time)

global TimeStepUpdate OP_TIMESTEPUPDATE

 V1 = real(Vval(Inst.n1)); 
 V2 = real(Vval(Inst.n2));
 
 if time == 0.0 && TimeStepUpdate == OP_TIMESTEPUPDATE
     % DC or operating point or t = 0
     Inst.Vt_0 = 0; 
     Inst.Vt_1 = (V1-V2);
    
 else
     
     Inst.Vt_0 = Inst.Vt_1;
     Inst.Vt_1 = V1-V2;
     
 end
 
 global dt;

 dVdt = (Inst.Vt_1-Inst.Vt_0)/dt;

 [f,dfdV1,dfdV2] = Inst.CapFct(V1,V2,time,dVdt);
  
 
 AddToFVec(Inst.n3,f);
 AddToJMat(Inst.n3,Inst.n1,dfdV1);
 AddToJMat(Inst.n3,Inst.n2,dfdV2);
 
end







