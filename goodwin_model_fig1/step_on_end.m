function ret = step_on_end(t,t_cycle)
t = mod(t,t_cycle);
ret =0;
if (t < t_cycle/2)
    ret =1;
end
