% script used to create the sustained and damped library 
% parameter sets are chose 'by hand' based on qualitative characteristics
% of either oscialtions maintaining high amplitude (sustained) 
% or decline of a decline of amplitude over time (damped) 


num_cells = 2;
num_params = 17;
y = [0.05 0.5 .5 0.2 0.05 0.5 .5 0.2];

new_params = ones(num_params,num_cells);



% Define Model Parameters
% These are the published parameters for the Goodwin Model.

v1 = 0.7;       % rate constant
K1 = 1;
n = 4;          % hill coeficient 
v2 = 0.35;      % rate constant
K2 = 1;
k3 = 0.7;       % rate constant
v4 = 0.35;      % rate constant
K4 = 1;
k5 = 0.7;       % rate constant
v6 = 0.35;      % rate constant
K6 = 1;
k7 = 0.35;      % rate constant
v8 = 1;         % rate constant
K8 = 1;
vc = 0.4;
Kc = 1;
K  = 0.5;       % sensitivity to VIP


%pulse function for light input (not used here)
x_fun = @(t)(step_on_end(t,0.5,0.7));

base_params = [v1, K1, n, v2, K2, k3, v4, K4, k5, v6, K6, k7, v8, K8, vc, Kc, K];

new_params(:,1) = base_params;

% generate a new guassian scaled parameter set
for i= 1:num_cells-1
    new_params(:,i+1)= create_paramsets(base_params,num_params);
end


% simulate system 
[t,z] = ode15s(@goodwin,0:0.1:1000, y,odeset('MaxStep',0.1),new_params,x_fun,num_cells);


% plot clock protein path 
figure; plot( t, z(:,2) )

% print out parameter set 
new_params(:,2)'