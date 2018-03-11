% return subset of damped and sustained parameter set matrix
function params = get_params( num_damped, num_sustained, damped_set, sustained_set )

if num_damped>0 && num_sustained > 0 
    
    p_sustain = sustained_set(:,1:num_sustained);
    p_damped = damped_set(:,1:num_damped);
    params = [p_sustain,p_damped];
 
elseif num_damped > 0
    params = damped_set(:,1:num_damped);

elseif num_sustained > 0 
    params = sustained_set(:,1:num_sustained);
end

end
