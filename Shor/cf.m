function res = cf(num, den, iter)
%CF - Continued fractions
    prev = 0;
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
        fprintf("%0.4i hi   %0.4i \n",num,den);
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

