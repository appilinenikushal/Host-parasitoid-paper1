function [a,b] = CHPwS(l,g,o,eh, ep,t)
%2 Host parasitoid system with internal dynamics (Smith and Slatkin Growth) and diffusive migration.
%Host growth rate = l, Parasitoid growth rte = g;
%migration fraction of hosts = eh, migration fraction of parasitoids = ep, no of generations = t;

a = zeros(2,t);     %population in patch 1
b = zeros(2,t);     %population in patch 2

a(1,1) = l*rand;    %initial host population in patch 1
a(2,1) = g*rand;    %initial parasitoid population in patch 1
b(1,1) = l*rand;    %initial host population in patch 2
b(2,1) = g*rand;    %initial parasitoid population in patch 2

for i=2:t
    %birth and intraspecific competition (Ricker) and parasitism
    h1 = l*(a(1,i-1)/(1 + (l-1)*a(1,i-1)^o))*exp(-a(2,i-1));
    p1 =  g*(a(1,i-1)/(1 + (l-1)*a(1,i-1)^o))*(1 - exp(-a(2,i-1)));
    h2 =  l*(b(1,i-1)/(1 + (l-1)*b(1,i-1)^o))*exp(-b(2,i-1));
    p2 = g*(b(1,i-1)/(1 + (l-1)*b(1,i-1)^o))*(1 - exp(-b(2,i-1)));

    %migration
    a(1,i) = h1 - (h1 - h2)*eh;
    a(2,i) = p1 - (p1 - p2)*ep;
    b(1,i) = h2 + (h1 - h2)*eh;
    b(2,i) = p2 + (p1 - p2)*ep;

end

end
