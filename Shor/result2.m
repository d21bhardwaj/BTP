function [Table2,period] = result2(L,M, R)
    N = L+M;
    R = modu(R);
    
    Table2 = zeros([power(2,M) 2]);
    period=0;
    for i = 1:power(2,M)
        Table2(i,1) = i-1;
    end
    run =100;
    for i = 1:power(2,N)
        if R(i)>0
            f=convt(i-1,L,M);
            if(Table2(f,2)==0)
                period = period +1;
            end
            Table2(f,2) = Table2(f,2)+R(i);
        end
    end  
    function f = convt(v,L,M)
        v = de2bi(v,L+M);
        f = v(1:M);
        f = bi2de(f)+1;
    end
    function si = modu(ps)
         a = 0;
         for i = 1:length(ps)
             ps(i)=abs(ps(i))^2;
             a = a + ps(i);
         end

         si = ps/a;
     end

     
end