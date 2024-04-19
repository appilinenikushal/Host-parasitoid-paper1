function [a,b] = CHP(l,g,eh, ep,t)
%2 Host parasitoid system with internal dynamics and diffusive migration.
%Competition is exact given by min function, parasitoid search is
%independent
%Host growth rate = l, Parasitoid growth rte = g;
%migration fraction of hosts = eh, migration fraction of parasitoids = ep, no of generations = t;
a = zeros(2,t);     %population in patch 1
b = zeros(2,t);     %population in patch 2

a(1,1) = l*rand;    %initial host population in patch 1
a(2,1) = g*rand;    %initial parasitoid population in patch 1
b(1,1) = l*rand;    %initial host population in patch 2
b(2,1) = g*rand;    %initial parasitoid population in patch 2

for i=2:t
    %intraspecific competition and parasitism
    h1 = min(a(1,i-1),1)*exp(-a(2,i-1));
    p1 = min(a(1,i-1),1)*(1 - exp(-a(2,i-1)));
    h2 = min(b(1,i-1),1)*exp(-b(2,i-1));
    p2 = min(b(1,i-1),1)*(1 - exp(-b(2,i-1)));

    %migration
    a(1,i) = h1 - (h1 - h2)*eh;
    a(2,i) = p1 - (p1 - p2)*ep;
    b(1,i) = h2 + (h1 - h2)*eh;
    b(2,i) = p2 + (p1 - p2)*ep;

    %reproduction
    a(1,i) = l*a(1,i);
    a(2,i) = g*a(2,i);
    b(1,i) = l*b(1,i);
    b(2,i) = g*b(2,i);

end

end