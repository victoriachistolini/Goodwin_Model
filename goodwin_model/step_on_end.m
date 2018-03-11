function ret = step_on_end(t,timeon, timeoff)
t = mod(t,24);
ret =0;
if (t> timeon && t< timeoff),
    ret =1;
end;
