function [p1,p2,p] = shor_result(a,M,L,R,C)
    N = M+L;
    p1 = 1;
    p2 =1;
    for i = 1:5
        v = measure(N,R);
        x = convt(v,L,M);
        den = cf(x,2^L,C);
        for j= 1: length(den)-1
            p = den(j);
            if(p<=1)
                break;
            end
            [p1,p2,p]=fac(p,a,C,1);
            if(p1~=1 && p2 ~=1)
                return;
            end
        end
    end     
    function [p1,p2,p] = fac(p,a,C,i)
            p1 = 1; p2 = 1;
            pt = p*i;
            if(pt>=C)
                return;
            end
            if(mod(pt,2)==0)
                pt = pt/2;
                if(mod(a^pt,C)~=-1)
                    x= a^pt;
                    p1 = gcd(x+1,C);
                    p2 = gcd(x-1,C);
                end
                pt = pt*2;
            end
        if(p1==1 || p2 == 1)
            [p1,p2,p]=fac(p,a,C,i+1);
        else
            p = p*i;
            
        end
    end
    function x = convt(v,L,M)
        v = de2bi(v,L+M);
        x = v(M+1:L+M);
        x = fliplr(x);
        x = bi2de(x)+1;
    end
   
end

