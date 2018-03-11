% main code for generating figure 1A

num_cells = 20;
num_params = 17;
num_points = 10;
y = ones(1,num_cells*4);
time_points = zeros(num_points+1,1);
FRPs = zeros(num_points+1,1);

%pulse function
x_fun = @(t)(step_on_end(t,0.5,0.7));


for i= 0:num_points
    
   num_damped = round(i*0.1*num_cells, 0);
   num_sustain = num_cells-num_damped;
   
   % grab sample of sustained / damped cells
   params_sustain = sustained_library(num_sustain);
   params_damped  = damped_library(num_damped);
   params = [params_sustain,params_damped];
   
   % simulate system
   [t,z] = ode15s(@goodwin,0:0.1:1000, y,odeset('MaxStep',0.1),params,x_fun,num_cells);
   
   % determine FRP
   p_mean = mean(z(2500:6000,1:num_cells),2);
   per = getPeriod(t(2500:6000), p_mean);
   
   time_points(i+1) = i*0.1;
   FRPs(i+1) = per;
    
end

figure;plot( time_points, FRPs);