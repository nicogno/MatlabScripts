%% Script esempio per unire tensori
a1=load('Paci2019_sensitivity_force_time_Cao_matrix_Pacing_1Hz_NuoveEqCalcio.mat');
f1=fieldnames(a1);
a2=load('Paci2019_sensitivity_force_time_Cao_matrix_Pacing_1Hz_NuoveEqCalcio_5mM10mM.mat');
f2=fieldnames(a2);
Cao_steps = [a1.(f1{1}), a2.(f2{1})];
force_time_Cao_matrix = cat(3, a1.(f1{2}), a2.(f2{2}));
save('Data/Paci2019_Sensitivity/External_Calcium_Sensitivity_EqCaModificate/Paci2019_sensitivity_force_time_Cao_matrix_Pacing_1Hz_NuoveEqCalcio.mat', 'force_time_Cao_matrix', 'Cao_steps');

%% Per ordinare i valori
clear all;
load('/Users/Nico/Documents/MATLAB/TesiMagistrale/Data/Paci2019_Sensitivity/External_Calcium_Sensitivity/Paci2019_sensitivity_force_time_Cao_matrix_noPacing_zoom2mM_3mM.mat')
Cao_steps_2 = zeros(1,11);
Cao_steps_2(:,1:4) = Cao_steps(:,1:4);
Cao_steps_2(:,5:7) = Cao_steps(:,9:11);
Cao_steps_2(:,8:11) = Cao_steps(:,5:8);
force_time_Cao_matrix_2 = zeros(1000000,2,11);
force_time_Cao_matrix_2(:,:,1:4) = force_time_Cao_matrix(:,:,1:4);
force_time_Cao_matrix_2(:,:,5:7) = force_time_Cao_matrix(:,:,9:11);
force_time_Cao_matrix_2(:,:,8:11) = force_time_Cao_matrix(:,:,5:8);
Cao_steps = Cao_steps_2;
force_time_Cao_matrix = force_time_Cao_matrix_2;
save('Data/Paci2019_Sensitivity/External_Calcium_Sensitivity/Paci2019_sensitivity_force_time_Cao_matrix_noPacing_zoom2mM_3mM.mat', 'force_time_Cao_matrix', 'Cao_steps');
