function [patch] = cellularHP(p1,p2,m,n,o,t,e)
% m time steps in state 1, n time steps in state 2 and o timesteps in state
% 3. t is the total time. e is the diffusion fraction. only reactions
% happen when: state1 + state 2 -> state1 closer to state 2
% state2 + state3 -> state2 closer to state 3
patch = zeros(2,t);
%patch(:,1) = randsample(m+n+o,2);  %intial state with both of them in different states
patch(1,1) = p1;
patch(2,1) = p2;
for i=2:t
    if patch(1,i-1)<=m && m <patch(2,i-1) && patch(2,i-1) <= m+n   %state 1 + state 2 patch 1 in build up, patch 2 in outbreak
        patch(1,i) = mod(patch(1,i-1),m+n+o) + ceil(e/(1/(patch(2,i-1) - patch(1,i-1)))) - sign(e) + 1; %patch 1 moves ahead
        patch(2,i) = mod(patch(2,i-1),m+n+o) + 1;   %patch 2 doesn't change
    elseif patch(1,i-1)<=m+n  && patch(2,i-1) <= m && patch(1,i-1) >m  %state 2 + state 1
        patch(2,i) = mod(patch(2,i-1),m+n+o) + ceil(e/(1/(patch(1,i-1) - patch(2,i-1))))- sign(e) + 1; %patch 2 moves ahead
        patch(1,i) = mod(patch(1,i-1),m+n+o) + 1;   %patch 1 doesn't change
    elseif patch(2,i-1)>m+n && patch(1,i-1) > m  && patch(1,i-1) <=m+n  %state 2 + state 3
        patch(1,i) = mod(patch(1,i-1),m+n+o) + ceil(e/(1/(patch(2,i-1) - patch(1,i-1))))- sign(e) + 1; %patch 1 moves ahead
        patch(2,i) = mod(patch(2,i-1),m+n+o) + 1;   %patch 2 doesn't change
    elseif patch(1,i-1)>m+n && patch(2,i-1) > m  && patch(2,i-1) <=m+n  %state 3 + state 2
        patch(2,i) = mod(patch(2,i-1),m+n+o) + ceil(e/(1/(patch(1,i-1) - patch(2,i-1))))- sign(e) + 1; %patch 2 moves ahead
        patch(1,i) = mod(patch(1,i-1),m+n+o) + 1;   %patch 1 doesn't change
    else
        patch(:,i) = mod(patch(:,i-1),m+n+o) + 1;
    end
end


end