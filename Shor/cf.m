function d = cf(num, den, C)
%CF - Continued fractions
    iter = 1000;
    prev=0;
    v = 0;
    d = [];
    res = ContinuedFractionUtil(num,den,iter,[]);
    s = length(res);
    for cur_size = 2:s+1
        num = 1;
        den = res(cur_size-1);
        for i = (cur_size-2):-1:1
%             fprintf("i= %i hi %i  inside   %i \n",i,num,den);
            prev = den;
            den = (res(i)*den) + num;
            num = prev;
        end
        if(den>C)
            return;
        end
        den = [den];
        d = [den d];
    end

    function res = ContinuedFractionUtil(num, den, iter,res) 
        if (iter == 0 || num == 0) 
            return;
        end
        x = fix(den/num);
        x = [x];
        res = [res x];
        den_new = num;
        num_new = mod(den,num);
        res = ContinuedFractionUtil(num_new,den_new,iter-1,res);
    end


end

