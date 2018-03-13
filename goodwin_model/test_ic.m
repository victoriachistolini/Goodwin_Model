% script used to create the sustained and damped library 
% parameter sets are chose 'by hand' based on qualitative characteristics
% of either oscialtions maintaining high amplitude (sustained) 
% or decline of a decline of amplitude over time (damped) 



% ******  generate 2 new damped sets; all current damped sets work for the ic= [0.05 0.5 1.5 1]************
num_cells = 1;
num_damped=4;
num_sustained=0;
num_total_cells =4;
num_params = 17;

damped_initialConditions = [0.05    0.5   1.5    1]; % damped set
sustain_initialConditions = [0.05    0.5   4    1];   % sustained set 

ic = [0.05 0.5 1.5 4 1]; % initial conditions same for damped/sustained except damped =1.5 and sustained =4

y = repelem(ic,[num_total_cells num_total_cells num_damped num_sustained num_total_cells]);

new_params = ones(num_params,num_cells);


p1 =[ 0.7070    0.9455    4.1214    0.3290    1.0490    0.7518    0.4099    0.9806    0.5503    0.3206    1.1355    0.3125    1.0961    1.0124    0.4575    0.8039    0.4901];

new_params(:,1) = p1';


%pulse function
x_fun = @(t)(step_on_end(t,0.5,0.7));

% simulate system 
[t,z] = ode15s(@goodwin,0:0.1:1000, y,odeset('MaxStep',0.1),new_params,x_fun,num_cells);


% plot clock protein path 
figure; plot( t, z )

% print out parameter set 
