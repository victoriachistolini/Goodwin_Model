num_cells = 18;
damped_cells = damped_library(num_cells, 0);
ic = [0.05 0.5 1.5 1];
pers = zeros(num_cells,1);

for i=1:num_cells
    
   params = damped_cells(i,:)';
    % simulate system
   [t,z] = ode15s(@goodwin,0:0.1:1000, ic,odeset('MaxStep',0.1),params,x_fun,1);
   per = getPeriod(t(2500:6000), z(2500:6000,1));
   pers(i) = per;
   
    
end

histogram(pers);