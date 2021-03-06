% main code  for figure 3A

% Conditions: 
% 100% self-sustained cells for the entire SCN 
% only VL cells are light-sensitive.
% 25% VL cells; 75% DM cells 



num_cells = 100;
num_params = 17;

num_vl = 0.25*num_cells;
num_dm = 0.75*num_cells;

num_vl_damped = 0;
num_vl_sustained = 25;

%80

num_dm_damped = 75;
num_dm_sustained = 0;

num_damped = num_dm_damped + num_vl_damped;
num_sustain = num_vl_sustained + num_dm_sustained;

ligth_strength = 0.002;

%pulse function
x_fun = @(t)(step_on_end(t,28.5));

% grab sample of sustained / damped cells
params_sustain = sustained_library(num_cells,1);
params_damped  = damped_library(num_cells,1);


% initial conditions same for damped/sustained except damped =1.5 and sustained =4

ic = [0.05 0.5 4 1.5 1]; 
y = repelem(ic,[num_cells num_cells num_sustain num_damped num_cells]);

% allow light sensitivity only for the vm cells 
light = [1 0 1 0];
light_sensitivity_indicator = repelem(light,[num_vl_sustained num_dm_sustained num_vl_damped num_dm_damped]);
params = get_params(num_damped, num_sustain,params_damped, params_sustain);
    
% simulate weak system
[t,z] = ode15s(@goodwin,0:0.1:2000, y,odeset('MaxStep',0.1),params,x_fun,num_cells,2,ligth_strength,light_sensitivity_indicator);
   
% determine FRP
p_mean = mean(z(4000:5000,1:num_cells),2);
per = getPeriod(t(4000:5000), p_mean);

figure;
plot( t, z(:,1:num_cells));


figure;
plot( t(4000:5000), z(4000:5000,1:num_cells));

hold on;
plot( t(4000:5000), p_mean,'LineWidth',8);