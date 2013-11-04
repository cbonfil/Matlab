function [Inst] = VCapStamp( Inst)
global nCl Gl nGl;

nGl = nGl + 1;
Gl(nGl,1) = Inst.n1;
Gl(nGl,2) = Inst.n3;
Gl(nGl,3) = 1;


nGl = nGl + 1;
Gl(nGl,1) = Inst.n2;
Gl(nGl,2) = Inst.n3;
Gl(nGl,3) = -1;


nGl = nGl + 1;
Gl(nGl,1) = Inst.n3;
Gl(nGl,2) = Inst.n3;
Gl(nGl,3) = 1;

end

