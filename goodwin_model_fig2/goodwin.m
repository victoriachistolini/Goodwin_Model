% defines system of differential equations for Goodwin Model with mean
% field coupling

function rates = goodwin(t,statevars, params,x_fun, n_cells,coupling_strength, light_strenght, light_indicator)

% Define State Variables

x = statevars(1:n_cells)';  % clock gene mRNA
y = statevars(n_cells+1:2*n_cells)';  % clock protein
z = statevars(2*n_cells+1:3*n_cells)';  % transcriptional inhibitor
v = statevars(3*n_cells+1:4*n_cells)';  % neurotransmitter VIP 


% Define Model Parameters
v1 = params(1,:);  % rate constant
K1 = params(2,:);
n = params(3,:);   % hill coeficient 
v2 = params(4,:);  % rate constant
K2 = params(5,:);
k3 = params(6,:);  % rate constant
v4 = params(7,:);  % rate constant
K4 = params(8,:);  
k5 = params(9,:);  % rate constant
v6 = params(10,:); % rate constant
K6 = params(11,:);
k7 = params(12,:); % rate constant
v8 = params(13,:); % rate constant
K8 = params(14,:);
%L  = 0;
vc = params(15,:);
Kc = params(16,:);
K  = params(17,:);  % sensitivity to VIP


L=x_fun(t); % eventually a function of light input 

F = mean(v);
%Model: system of differential equations
mean_field_response = vc.*((K.*F) / (Kc + K.*F));
%mean_field_response=0;

%dx/dt  We can include light here
rates(1:n_cells,1) = v1.*( K1.^n ./ (K1.^n + z.^n)) - v2.*( x ./ (K2 + x)) + coupling_strength*mean_field_response + light_indicator.*light_strenght*L;

%dy/dt
rates(n_cells+1:2*n_cells,1) = k3.*x - v4.*( y ./ (K4 + y));

%dz/dt
rates(2*n_cells+1:3*n_cells,1) = k5.*y - v6.*(z ./ (K6 + z));

%dv/dt
rates(3*n_cells+1:4*n_cells,1) = k7.*x - v8.*(v ./ (K8 + v));

end

