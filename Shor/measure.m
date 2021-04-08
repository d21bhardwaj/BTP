function v = measure(N,ps)
    N = 2^N;    
    q=0;t=0;
    D=1000;
    r = randi([1,D],1)/D;
    i=1;
    for i = 1 : N
        if(ps(i)>0)
            a = ps(i);
            q = q+ a;
            fprintf("%i  %i  %i   %i",r,a,q,i);
            fprintf("\n");
            if(r<=q)
             fprintf("out at %i \n",i);
             break
            end
        end
    end
    v =i-1;
end

