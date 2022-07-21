% Script to generate Table 1
clear; close all;

% Input parameters
Params = [2.798268 49.889025 20.086178 6.873361 0.993574 2.431832 284.973370 3.763416 1.835671 7.793137 14.090266 3.085521 14.572550 10.458438 0.183496]; %916030

%% Base model
mdlName = 'ICN_with_BR_input_model4test_clusterParams_ICNtune_v13';
simIn = Simulink.SimulationInput(mdlName);
simIn = simIn.setBlockParameter([mdlName '/Autonomic Nervous System/ICN/PN-NA/minval_NA_PN'], 'Value', num2str(Params(1)), ...
    [mdlName '/Autonomic Nervous System/ICN/PN-NA/fmax_NA_PN'], 'Value', num2str(Params(2)), ... 
    [mdlName '/Autonomic Nervous System/ICN/PN-NA/midptNA_PN'], 'Value', num2str(Params(3)), ...
    [mdlName '/Autonomic Nervous System/ICN/PN-NA/kNA'], 'Value', num2str(Params(4)), ...
    [mdlName '/Autonomic Nervous System/ICN/LCN/minval_LCN'], 'Value', num2str(Params(5)), ... 
    [mdlName '/Autonomic Nervous System/ICN/LCN/fmax_LCN'], 'Value', num2str(Params(6)), ... 
    [mdlName '/Autonomic Nervous System/ICN/LCN/midptLCN'], 'Value', num2str(Params(7)), ...
    [mdlName '/Autonomic Nervous System/ICN/LCN/kLCN'], 'Value', num2str(Params(8)), ...
    [mdlName '/Autonomic Nervous System/ICN/PN-DMV/minval_DMV_PN'], 'Value', num2str(Params(9)), ... 
    [mdlName '/Autonomic Nervous System/ICN/PN-DMV/fmax_DMV_PN'], 'Value', num2str(Params(10)), ... 
    [mdlName '/Autonomic Nervous System/ICN/PN-DMV/midptDMV_PN'], 'Value', num2str(Params(11)), ...
    [mdlName '/Autonomic Nervous System/ICN/PN-DMV/kDMV_PN'], 'Value', num2str(Params(12)), ...
    [mdlName '/Autonomic Nervous System/ICN/LCN/LCN_fevEmaxgain'], 'Value', num2str(Params(13)), ... 
    [mdlName '/Autonomic Nervous System/ICN/LCN/LCN_BRgain'], 'Value', num2str(Params(14)), ...
    [mdlName '/Autonomic Nervous System/ICN/LCN/LCN_feshgain'], 'Value', num2str(Params(15)));

simOut = sim(simIn);
disp('Base model')
PhysOutputs_Gen_TS(simOut)
%% No Local reflex
ParamsNLR = Params;
ParamsNLR(14) = 0;
mdlName = 'ICN_with_BR_input_model4test_clusterParams_ICNtune_v13_NLR';
simInNLR = Simulink.SimulationInput(mdlName);
simInNLR = simInNLR.setBlockParameter([mdlName '/Autonomic Nervous System/ICN/PN-NA/minval_NA_PN'], 'Value', num2str(ParamsNLR(1)), ...        
    [mdlName '/Autonomic Nervous System/ICN/PN-NA/fmax_NA_PN'], 'Value', num2str(ParamsNLR(2)), ... 
    [mdlName '/Autonomic Nervous System/ICN/PN-NA/midptNA_PN'], 'Value', num2str(ParamsNLR(3)), ...
    [mdlName '/Autonomic Nervous System/ICN/PN-NA/kNA'], 'Value', num2str(ParamsNLR(4)), ...
    [mdlName '/Autonomic Nervous System/ICN/LCN/minval_LCN'], 'Value', num2str(ParamsNLR(5)), ... 
    [mdlName '/Autonomic Nervous System/ICN/LCN/fmax_LCN'], 'Value', num2str(ParamsNLR(6)), ... 
    [mdlName '/Autonomic Nervous System/ICN/LCN/midptLCN'], 'Value', num2str(ParamsNLR(7)), ...
    [mdlName '/Autonomic Nervous System/ICN/LCN/kLCN'], 'Value', num2str(ParamsNLR(8)), ...
    [mdlName '/Autonomic Nervous System/ICN/PN-DMV/minval_DMV_PN'], 'Value', num2str(ParamsNLR(9)), ... 
    [mdlName '/Autonomic Nervous System/ICN/PN-DMV/fmax_DMV_PN'], 'Value', num2str(ParamsNLR(10)), ... 
    [mdlName '/Autonomic Nervous System/ICN/PN-DMV/midptDMV_PN'], 'Value', num2str(ParamsNLR(11)), ...
    [mdlName '/Autonomic Nervous System/ICN/PN-DMV/kDMV_PN'], 'Value', num2str(ParamsNLR(12)), ...
    [mdlName '/Autonomic Nervous System/ICN/LCN/LCN_fevEmaxgain'], 'Value', num2str(ParamsNLR(13)), ... 
    [mdlName '/Autonomic Nervous System/ICN/LCN/LCN_BRgain'], 'Value', num2str(ParamsNLR(14)), ...
    [mdlName '/Autonomic Nervous System/ICN/LCN/LCN_feshgain'], 'Value', num2str(ParamsNLR(15)));
    

% Run simulation
simOutNLR = sim(simInNLR);
disp('No local reflex')
PhysOutputs_Gen_TS(simOutNLR)

%% No RSA gate
mdlName = 'ICN_with_BR_input_model4test_clusterParams_ICNtune_v13_noRSA';
simIn = Simulink.SimulationInput(mdlName);
simIn = simIn.setBlockParameter([mdlName '/Autonomic Nervous System/ICN/PN-NA/minval_NA_PN'], 'Value', num2str(Params(1)), ...
    [mdlName '/Autonomic Nervous System/ICN/PN-NA/fmax_NA_PN'], 'Value', num2str(Params(2)), ... 
    [mdlName '/Autonomic Nervous System/ICN/PN-NA/midptNA_PN'], 'Value', num2str(Params(3)), ...
    [mdlName '/Autonomic Nervous System/ICN/PN-NA/kNA'], 'Value', num2str(Params(4)), ...
    [mdlName '/Autonomic Nervous System/ICN/LCN/minval_LCN'], 'Value', num2str(Params(5)), ... 
    [mdlName '/Autonomic Nervous System/ICN/LCN/fmax_LCN'], 'Value', num2str(Params(6)), ... 
    [mdlName '/Autonomic Nervous System/ICN/LCN/midptLCN'], 'Value', num2str(Params(7)), ...
    [mdlName '/Autonomic Nervous System/ICN/LCN/kLCN'], 'Value', num2str(Params(8)), ...
    [mdlName '/Autonomic Nervous System/ICN/PN-DMV/minval_DMV_PN'], 'Value', num2str(Params(9)), ... 
    [mdlName '/Autonomic Nervous System/ICN/PN-DMV/fmax_DMV_PN'], 'Value', num2str(Params(10)), ... 
    [mdlName '/Autonomic Nervous System/ICN/PN-DMV/midptDMV_PN'], 'Value', num2str(Params(11)), ...
    [mdlName '/Autonomic Nervous System/ICN/PN-DMV/kDMV_PN'], 'Value', num2str(Params(12)), ...
    [mdlName '/Autonomic Nervous System/ICN/LCN/LCN_fevEmaxgain'], 'Value', num2str(Params(13)), ... 
    [mdlName '/Autonomic Nervous System/ICN/LCN/LCN_BRgain'], 'Value', num2str(Params(14)), ...
    [mdlName '/Autonomic Nervous System/ICN/LCN/LCN_feshgain'], 'Value', num2str(Params(15)));

simOut_noRSA = sim(simIn);
disp('No RSA')
PhysOutputs_Gen_TS(simOut_noRSA)

%% No Local reflex, no RSA
ParamsNLR = Params;
ParamsNLR(14) = 0;
mdlName = 'ICN_with_BR_input_model4test_clusterParams_ICNtune_v13_NLR';
simInNLR = Simulink.SimulationInput(mdlName);
simInNLR = simInNLR.setBlockParameter([mdlName '/Autonomic Nervous System/ICN/PN-NA/minval_NA_PN'], 'Value', num2str(ParamsNLR(1)), ...        
    [mdlName '/Autonomic Nervous System/ICN/PN-NA/fmax_NA_PN'], 'Value', num2str(ParamsNLR(2)), ... 
    [mdlName '/Autonomic Nervous System/ICN/PN-NA/midptNA_PN'], 'Value', num2str(ParamsNLR(3)), ...
    [mdlName '/Autonomic Nervous System/ICN/PN-NA/kNA'], 'Value', num2str(ParamsNLR(4)), ...
    [mdlName '/Autonomic Nervous System/ICN/LCN/minval_LCN'], 'Value', num2str(ParamsNLR(5)), ... 
    [mdlName '/Autonomic Nervous System/ICN/LCN/fmax_LCN'], 'Value', num2str(ParamsNLR(6)), ... 
    [mdlName '/Autonomic Nervous System/ICN/LCN/midptLCN'], 'Value', num2str(ParamsNLR(7)), ...
    [mdlName '/Autonomic Nervous System/ICN/LCN/kLCN'], 'Value', num2str(ParamsNLR(8)), ...
    [mdlName '/Autonomic Nervous System/ICN/PN-DMV/minval_DMV_PN'], 'Value', num2str(ParamsNLR(9)), ... 
    [mdlName '/Autonomic Nervous System/ICN/PN-DMV/fmax_DMV_PN'], 'Value', num2str(ParamsNLR(10)), ... 
    [mdlName '/Autonomic Nervous System/ICN/PN-DMV/midptDMV_PN'], 'Value', num2str(ParamsNLR(11)), ...
    [mdlName '/Autonomic Nervous System/ICN/PN-DMV/kDMV_PN'], 'Value', num2str(ParamsNLR(12)), ...
    [mdlName '/Autonomic Nervous System/ICN/LCN/LCN_fevEmaxgain'], 'Value', num2str(ParamsNLR(13)), ... 
    [mdlName '/Autonomic Nervous System/ICN/LCN/LCN_BRgain'], 'Value', num2str(ParamsNLR(14)), ...
    [mdlName '/Autonomic Nervous System/ICN/LCN/LCN_feshgain'], 'Value', num2str(ParamsNLR(15)));
    

% Run simulation
simOutNLR_NRSA = sim(simInNLR);
disp('No local reflex, no RSA')
PhysOutputs_Gen_TS(simOutNLR_NRSA)