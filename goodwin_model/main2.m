num_cells = 2;
num_params = 17;
y = ones(1,num_cells*4);

new_params = ones(num_params,num_cells);



% Define Model Parameters
% These are the published parameters for the Goodwin Model.

v1 = 0.7;       % rate constant
K1 = 1;
n = 4;          % hill coeficient 
v2 = 0.35;      % rate constant
K2 = 1;
k3 = 0.7;       % rate constant
v4 = 0.35;      % rate constant
K4 = 1;
k5 = 0.7;       % rate constant
v6 = 0.35;      % rate constant
K6 = 1;
k7 = 0.35;      % rate constant
v8 = 1;         % rate constant
K8 = 1;
vc = 0.4;
Kc = 1;
K  = 0.5;       % sensitivity to VIP


%pulse function
x_fun = @(t)(step_on_end(t,0.5,0.7));

base_params = [v1, K1, n, v2, K2, k3, v4, K4, k5, v6, K6, k7, v8, K8, vc, Kc, K];

new_params(:,1) = base_params;

for i= 1:num_cells-1
   
    new_params(:,i+1)= create_paramsets(base_params,num_params);
end


[t,z] = ode15s(@goodwin,0:0.1:1000, y,odeset('MaxStep',0.1),new_params,x_fun,num_cells);


% getting awesome stuff
figure; plot( t(100:8000), z(100:8000,2) )
new_params(:,2)'