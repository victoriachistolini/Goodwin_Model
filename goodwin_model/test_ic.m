% script used to create the sustained and damped library 
% parameter sets are chose 'by hand' based on qualitative characteristics
% of either oscialtions maintaining high amplitude (sustained) 
% or decline of a decline of amplitude over time (damped) 



% ******  generate 2 new damped sets; all current damped sets work for the ic= [0.05 0.5 1.5 1]************
num_cells = 1;
num_params = 17;
y = ones(1,num_cells*4);
y = [0.05    0.5   1.5    1];

new_params = ones(num_params,num_cells);


p1 =[ 0.6309    1.0760    3.7371    0.3289    1.0177    0.6785    0.3454    1.0595    0.7733    0.3431    1.0328    0.3417    1.0230    1.0440    0.3753    1.0275    0.5301];

new_params(:,1) = p1';


%pulse function
x_fun = @(t)(step_on_end(t,0.5,0.7));

% simulate system 
[t,z] = ode15s(@goodwin,0:0.1:1000, y,odeset('MaxStep',0.1),new_params,x_fun,num_cells);


% plot clock protein path 
figure; plot( t, z )

% print out parameter set 
