function ret = create_paramsets(base_params, num_params)

    ret = ones(num_params,1);
    for i = 1 : num_params
        percent_perturb = normrnd(1,0.1);
        new_param = base_params(i)*percent_perturb;
        ret(i)=new_param;
    end
    


end
