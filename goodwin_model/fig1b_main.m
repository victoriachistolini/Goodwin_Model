% need to determine strength of 

num_cells = 100;
num_params = 17;


%pulse function
x_fun = @(t)(step_on_end(t,33));

% grab sample of sustained / damped cells
params_sustain = sustained_library(num_cells,1);
params_damped  = damped_library(num_cells,1);


num_damped = 0;
num_sustain = 100;
% initial conditions same for damped/sustained except damped =1.5 and sustained =4

ic = [0.05 0.5 4 1.5 1]; 
y = repelem(ic,[num_cells num_cells num_sustain num_damped num_cells]);
  
   
params = get_params(num_damped, num_sustain,params_damped, params_sustain);
    
% simulate weak system
[t,z] = ode15s(@goodwin,0:0.1:2000, y,odeset('MaxStep',0.1),params,x_fun,num_cells,2,0.0005);
   
% determine FRP
p_mean = mean(z(18000:20000,1:num_cells),2);
per = getPeriod(t(18000:20000), p_mean);

%figure;
%plot( t, z(:,1:num_cells));


figure;
plot( t(18000:20000), z(18000:20000,1:num_cells));

hold on;
plot( t(18000:20000), p_mean,'LineWidth',8);