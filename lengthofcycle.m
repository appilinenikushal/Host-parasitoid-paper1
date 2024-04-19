function [loc] = lengthofcycle(a,b)
%finding no of generations between 2 maximums

loc = zeros(1000,1);
t = length(a(1,:));
if a(2,t) == 0 || b(2,t) == 0
    loc = loc - 1;
else
    for i=1:1000
        if rand>0.5         %use first patch
            c = a(2,t-20000 + 1:t);
            k = 1 + randi(19000);
            sd = k;
            m=0;
            while m==0
                if c(1,k) > c(1,k-1) && c(1,k) > c(1,k+1)   %search for the first maximum
                    m=1;
                else
                    k=k+1;
                end
            end
            j = k+1;
            m = 0;
            while m==0
                if c(1,j) > c(1,j-1) && c(1,j) > c(1,j+1)   %search for the second maximum
                    m=1;
                else
                    j=j+1;
                end
            end
            loc(i,1) = j-k ;
        else                 %use second patch
            c = b(2,t-20000 + 1:t);
            k = 1  + randi(19000);
            sd = k;
            m=0;
            while m==0
                if c(1,k) > c(1,k-1) && c(1,k) > c(1,k+1)   %search for the first maximum
                    m=1;
                else
                    k=k+1;
                end
            end
            j = k+1;
            m = 0;
            while m==0
                if c(1,j) > c(1,j-1) && c(1,j) > c(1,j+1)   %search for the second maximum
                    m=1;
                else
                    j=j+1;
                end
            end
            loc(i,1) = j-k ;
        end
    end
end
loc = mean(loc);
end
