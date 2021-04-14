function v = measure(n,ps)
    N = 2^n;    
    q=0;t=0;
    %random value from 0 to 1
    r = rand; 
    i=1;
    for i = 1 : N
        if(ps(i)>0)
            a = ps(i);
            q = q+ a;
            if(r<=q)
             break
            end
        end
    end
    v =i;
end

