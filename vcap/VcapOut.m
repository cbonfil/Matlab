function [] = VCapOut(Inst,mode,time)
global V;

if mode == 'o'
    n1 = Inst.n1;
    V1_r = Vval(n1);
    n2 = Inst.n2;
    V2_r = Vval(n2);
    dV = V1_r-V2_r;
    
    fprintf('Vcap: %s V: %f\n',...
        Inst.Name,real(Vval(Inst.n1)-real(Vval(Inst.n2))));

end

