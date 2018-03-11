% main code for generating figure 1A

num_cells = 10;
num_params = 17;
y = ones(1,num_cells*4);

%pulse function
x_fun = @(t)(step_on_end(t,0.5,0.7));


% grab sample of sustained / damped cells
params = sustained_library(num_cells);


% run simulation
[t,z] = ode15s(@goodwin,0:0.1:1000, y,odeset('MaxStep',0.1),params,x_fun,num_cells);

% determine the FRP:
% average cells clock trajectory together, then call getPeriod on this
% store result.

% plot the clock protein of all 10 cells
figure; plot( t(2500:6000), z(2500:6000,1:10) )