function [a,b] = CHPaggr(l,g,k,eh, ep,t)
%2 Host parasitoid system with internal dynamics (min function) and diffusive migration.
%Host growth rate = l, Parasitoid growth rte = g;
%parasitoid search is aggregated
%migration fraction of hosts = eh, migration fraction of parasitoids = ep, no of generations = t;

a = zeros(2,t);     %population in patch 1
b = zeros(2,t);     %population in patch 2

a(1,1) = l*rand;    %initial host population in patch 1
a(2,1) = g*rand;    %initial parasitoid population in patch 1
b(1,1) = l*rand;    %initial host population in patch 2
b(2,1) = g*rand;    %initial parasitoid population in patch 2

for i=2:t
    %birth and intraspecific competition (Ricker) and parasitism
    h1 = l*min(1,a(1,i-1))*(1  + a(2,i-1))^(-k);
    p1 =  g*min(1,a(1,i-1))*(1 - (1  + a(2,i-1))^(-k));
    h2 =  l*min(1,b(1,i-1))*(1  + b(2,i-1))^(-k);
    p2 = g*min(1,b(1,i-1))*(1 - (1  + b(2,i-1))^(-k));

    %migration
    a(1,i) = h1 - (h1 - h2)*eh;
    a(2,i) = p1 - (p1 - p2)*ep;
    b(1,i) = h2 + (h1 - h2)*eh;
    b(2,i) = p2 + (p1 - p2)*ep;

end

end