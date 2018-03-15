
num_cells = 22;
sustained_cells = sustained_library(num_cells, 0);
ic = [0.05 0.5 4 1];
pers = zeros(num_cells,1);

%pulse function
x_fun = @(t)(step_on_end(t,0.5,0.7));

%get sustained cells per
for i=1:num_cells
    
    params = sustained_cells(i,:)';
    % simulate system
   [t,z] = ode15s(@goodwin,0:0.1:1000, ic,odeset('MaxStep',0.1),params,x_fun,1);
   per = getPeriod(t(2500:6000), z(2500:6000,1));
   pers(i) = per;
   
    
end



histogram(pers);