%% Cell 1 graph the goodwin model with published parameters 

y = [1,1,1,1];
num_cells = 1;
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

params =  [v1, K1, n, v2, K2, k3, v4, K4, k5, v6, K6, k7, v8, K8, vc, Kc, K];
new_params(:,1) = params;

[t,z] = ode15s(@goodwin,0:0.1:1000, y,odeset('MaxStep',0.1),new_params,x_fun,num_cells);

clock_gene = z(5000:5500,1);
clock_protein = z(5000:5500,2);
inhibitor = z(5000:5500,3);
vip = z(5000:5500,4);


figure;
plot(t(1:501),clock_gene,'Linewidth',2);
xlabel('time (h)');
ylabel('mRNA and protein concentration (nM)');

hold on;
plot(t(1:501),clock_protein,'Linewidth',2);
plot(t(1:501),inhibitor,'Linewidth',2);
plot(t(1:501),vip,'Linewidth',2);

legend('Clock Gene', 'Clock Protein', 'Inhibitor', 'VIP');


%% Cell 2 graph the goodwin model with published parameters and n_cell other cells

num_cells = 10;
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


% plot the clock protein of all 10 cells
figure; plot( t(2500:6000), z(2500:6000,1:10) )

