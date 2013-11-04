global nNodes Devices nDevices Plots;
nNodes = 0;

Devices{1} = VsouCreate('V1',1,0,0.1,1,'p',...
            [100e-9,200e-9,340e-9,340e-9]);
Devices{2} = ResCreate('R1',1,2,1e5);
Devices{3} = IndCreate('L1',2,3,1e-9);
Devices{4} = VCapCreate('VC',3,0,@JuncCap);

Devices{5} = VsouCreate('V2',4,0,0.1,1,'p',...
            [100e-9,200e-9,340e-9,340e-9]);
Devices{6} = ResCreate('R2',4,5,1e5);
Devices{7} = IndCreate('L2',5,6,1e-9);
Devices{8} = CapCreate('VC2',6,0,  2.9749e-12);


nDevices = 8;
AddPlot('n',1,1);
AddPlot('n',1,3);
AddPlot('n',1,6);

% AddPlot('n',1,1);
% AddPlot('n',1,4);

Simulator = 'Transient'; TimeToSim = 12.0e-7;
Nt = 1500;
dt = TimeToSim/Nt;

