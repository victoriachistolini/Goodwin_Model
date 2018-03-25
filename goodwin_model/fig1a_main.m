% main code for generating figure 1A

num_cells = 100;
num_params = 17;
num_points = 40;

%output vectors
time_points = zeros(num_points+1,1);
FRPs_weak = zeros(num_points+1,1);

%pulse function
x_fun = @(t)(step_on_end(t,0.5,0.7));

% grab sample of sustained / damped cells
params_sustain = sustained_library(num_cells,1);
params_damped  = damped_library(num_cells,1);


for i= 0:num_points
    
   num_damped = round(i*0.025*num_cells, 0);
   num_sustain = num_cells-num_damped;
   
   % initial conditions same for damped/sustained except damped =1.5 and sustained =4
   ic = [0.05 0.5 4 1.5 1]; 
   y = repelem(ic,[num_cells num_cells num_sustain num_damped num_cells]);
  
   
   params = get_params(num_damped, num_sustain,params_damped, params_sustain);
    
   % simulate weak system
   [t,z] = ode15s(@goodwin,0:0.1:2000, y,odeset('MaxStep',0.1),params,x_fun,num_cells,1.5);
   
   % determine FRP
   p_mean = mean(z(18000:20001,1:num_cells),2);
   per = getPeriod(t(18000:20001), p_mean);
   
   time_points(i+1) = i*0.025;
   FRPs_weak(i+1) = per;
   
    
end

figure;
plot( time_points, FRPs_weak);

