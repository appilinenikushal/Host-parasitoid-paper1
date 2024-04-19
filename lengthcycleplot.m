function [A] = lengthcycleplot(l,g)
%length of cycle for different l and g
eps = 1:5:1000;
eps = (eps-1)/100000;
eps1 = 2:30;
eps1 = eps1/1000;
eps = [eps eps1];
A =cell(1,50);
parfor i1=1:50
    e = eps(i1);
    ui = zeros(1,5000);
    for i=1:5000
        [a,b] = CHP(l,g,e,e,30000);
       while a(2,length(a)) ==0
           [a,b] = CHP(l,g,e,e,30000);
       end

       ui(i) = lengthofcycle(a,b);
    end
    A{i1} = ui;
end
end