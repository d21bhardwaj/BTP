function [Table1, Table2,R,period] = result(L,M, R)
    N = L+M;
    R = modu(R);
%   R = R.*R;
    % Table to store result of x^{~}vs f(x)
    Table1 = zeros([power(2,L) 2]);
    % Table to store result of f(x)vs P(f)
    Table2 = zeros([power(2,M) 2]);
    period=0;
    for i = 1:power(2,L)
        Table1(i,1) = i-1; 
    end
    for i = 1:power(2,M)
        Table2(i,1) = i-1;
    end
    run =100;
%     for i = 1:run
%         v = measure(L+M,R);
%         [x,f]=convt(v,L,M);
%         Table1(x,2) = Table1(x,2)+1;
%         Table2(f,2) = Table2(f,2)+1;
% % %             Table3(x,f)= 1;
%     end
    for i = 1:power(2,N)
        if R(i)>0
            [x,f]=convt(i-1,L,M);
            Table1(x,2) = Table1(x,2)+R(i);
            if(Table2(f,2)==0)
                period = period +1;
            end
            Table2(f,2) = Table2(f,2)+R(i);
%             Table3(x,f)= 1;
        end
    end  
    function [x,f] = convt(v,L,M)
        v = de2bi(v,L+M);
        f = v(1:M);
        x = v(M+1:L+M);
        f = bi2de(f)+1;
        x = fliplr(x);
        x = bi2de(x)+1;
    end
     function si = modu(ps)
         a = 0;
         for i = 1:length(ps)
             ps(i)=abs(ps(i))^2;
             a = a + ps(i);
         end
%          a = sqrt(a);
         si = ps/a;
     end
     
end

