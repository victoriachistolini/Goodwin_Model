% script used to create the sustained and damped library 
% parameter sets are chose 'by hand' based on qualitative characteristics
% of either oscialtions maintaining high amplitude (sustained) 
% or decline of a decline of amplitude over time (damped) P11

y = [0.05 0.5 .5 0.2 0.05 0.5 .5 0.2];


%pulse function for light input (not used here)
x_fun = @(t)(step_on_end(t,0.7));


new_params = ones(17,2);

% generate a new guassian scaled parameter set
new_params(:,1) = [ 0.6825    1.0504    3.6429    0.4168    1.0122    0.7733    0.3421    0.9837    0.7483    0.3695    0.8880    0.2964    0.8902    0.8584    0.4024    0.9589    0.4816];







new_params(:,2)  =  [ 0.6825    1.0504    3.6429    0.4168    1.0122    0.7733    0.3421    0.9837    0.7483    0.3695    0.8880    0.2964    0.8902    0.8584    0.4024    0.9589    0.4816];











% simulate a single cell, determine if it oscilates  
[t,z] = ode15s(@goodwin,0:0.1:1000, y,odeset('MaxStep',0.1),new_params,x_fun,2,0,0);


% plot clock protein path 
figure; plot( t, z )
