function v = measure(n,ps)
    N = 2^n;    
    q=0;t=0;
    r = rand;
    i=1;
    for i = 1 : N
        if(ps(i)>0)
            a = ps(i);
            q = q+ a;
%             fprintf("%i  %i  %i   %i",r,a,q,i);
%             fprintf("\n");
            if(r<=q)
%              fprintf("out at %i \n",i);
             break
            end
        end
    end
    v =i-1;
end

