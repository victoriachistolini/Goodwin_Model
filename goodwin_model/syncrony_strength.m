% main code for generating figure 1A

num_cells = 20;
num_params = 17;
num_total = 40;
coupling_strength = 0.5;

%pulse function
x_fun = @(t)(step_on_end(t,0.5,0.7));

% grab sample of sustained / damped cells
params_sustain = sustained_library(num_cells,1);
params_damped  = damped_library(num_cells,1);

    
num_damped = num_cells;
num_sustain = num_cells;
   
   
% initial conditions same for damped/sustained except damped =1.5 and sustained =4
ic = [0.05 0.5 4 1.5 1]; 
y = repelem(ic,[num_total num_total num_sustain num_damped num_total]);
  
params = get_params(num_damped, num_sustain,params_damped, params_sustain);
    
% simulate weak system
[t,z] = ode15s(@goodwin,0:0.1:2000, y,odeset('MaxStep',0.1),params,x_fun,num_total,1.1);
   
% determine FRP
p_mean = mean(z(16000:20001,1:num_total),2);
per = getPeriod(t, p_mean)
  
   

figure;
plot( t(16000:20001), z(16000:20001,1:num_total));
hold on;
plot( t(16000:20001), p_mean,'LineWidth',8);

