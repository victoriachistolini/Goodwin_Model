% get the free running period of an oscilator 
function per = getPeriod( t, y )
per = [];
stateIdx = 1;
y = y(:,stateIdx);
m = mean(y);
d = diff( y );
idx_pos = find(y>m);
idx_up = find(diff(y)>0);
ref_idxs = intersect( idx_pos, idx_up );
d = diff(ref_idxs);
idxs = ref_idxs(find(d>1)+1);
per = mean(diff(t(idxs)));
