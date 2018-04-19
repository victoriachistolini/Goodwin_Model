% given a set of base parameters creates new parameter such that
% each parameter is scaled by up to +/- 10 % of its value 

function ret = create_paramsets(base_params, num_params)

    ret = ones(num_params,1);
    for i = 1 : num_params
        percent_perturb = normrnd(1,0.1);
        new_param = base_params(i)*percent_perturb;
        ret(i)=new_param;
    end
    


end
