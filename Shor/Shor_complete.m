%Factors
clear();
M=6;
found =0;
C=39;
L=6;
I = [1,0;0,1];
I_M = I;
for i = 1:M-1
        I_M = kron(I_M,I);
end
U_L = kron(IQFT(L),I_M);

U_H = kron(Hadmard(L),I_M);
a =2;

for i = 1:10
     a = (randi([2 (C-1)],1));
     a = 10;
    if(gcd(a,C)>1)
        continue;
    end
    U_M = modC(M,a,C,L);
    T = U_L*U_M*U_H*pst(L+M);
    A = full(T);
    R = modu(A); 
    [p1,p2,p] = shor_result(a,M,L,R,C);
 
    
    if(p1~=1 && p2 ~= 1)
        break;
    end
end
fprintf("a = %0.2i p1 = %0.2i  p2 = %0.2i  p = %0.2i \n",a, p1,p2,p);


function si = modu(ps)
     a = 0;
     for i = 1:length(ps)
         ps(i)=abs(ps(i))^2;
         a = a + ps(i);
     end

     si = ps/a;
end