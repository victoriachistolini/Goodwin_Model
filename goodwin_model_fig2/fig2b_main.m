% main code  for figure 2A

% Conditions: 
% 100% self-sustained cells for the entire DM 
% only VL cells are light-sensitive.
% 70% self-sustained for VL
% 25% VL cells; 75% DM cells 



num_cells = 100;
num_params = 17;

num_vl = 0.25*num_cells;
num_dm = 0.75*num_cells;

num_vl_damped = round(0.7*num_vl,0)-1;
num_vl_sustained = round(0.3*num_vl,0);

num_dm_damped = 0*num_vl;
num_dm_sustained = 1*num_dm;

num_damped = num_dm_damped + num_vl_damped;
num_sustain = num_vl_sustained + num_dm_sustained;


%pulse function
x_fun = @(t)(step_on_end(t,33.5));

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
[t,z] = ode15s(@goodwin,0:0.1:2000, y,odeset('MaxStep',0.1),params,x_fun,num_cells,2,0.005,light_sensitivity_indicator);

dm_sustained_end = num_vl_sustained+1 + num_dm_sustained;

% determine FRP
p_vl_mean_sustained = mean(z(18000:20000,1:num_vl_sustained),2);
p_dm_mean_sustained = mean(z(18000:20000,num_vl_sustained+1:dm_sustained_end),2);
p_vl_mean_damped = mean(z(18000:20000,dm_sustained_end+1:num_cells),2);


%figure;
%plot( t, z(:,1:num_cells));


figure;
plot( t(18000:20000), p_vl_mean_sustained,'LineWidth',2);

hold on;
plot( t(18000:20000), p_dm_mean_sustained,'LineWidth',2);
plot( t(18000:20000), p_vl_mean_damped,'LineWidth',2);
xlabel('time (hours)');
ylabel('FRP');
legend('VL Sustained','DM', 'VL Damped');