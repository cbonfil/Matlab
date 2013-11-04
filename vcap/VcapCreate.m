function [ Inst ] = VCapCreate(Name,PInput,NInput,CapFct)

global nNodes;

Inst.Name = Name;


Inst.n1 = AddNode(PInput);
Inst.n2 = AddNode(NInput);
Inst.n3 = AddNode(strcat(Name,':I'));


Inst.StampFct = @VCapStamp;
Inst.UpdateFct = @VCapUpdate;
Inst.InitFct = @VCapInit;
Inst.OutFct = @VCapOut;

Inst.CapFct = CapFct;

end

