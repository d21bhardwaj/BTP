%Complete code for finding factors via random a 
M=6;%f register
C=45;
L=6;%x register
I = [1,0;0,1];
I_M = I;
%Identity matrix for f registers (size 2^M x 2^M)
for i = 1:M-1
        I_M = kron(I_M,I);
end
%Matrix U0 and so on to U2^M-1
U_L = kron(IQFT(L),I_M);
U_H = kron(Hadmard(L),I_M);
for i = 1:10
     a = (randi([2 (C-1)],1));
    % If found factor without finding period
    if(gcd(a,C)>1)
        continue;
    end
    U_M = modC(M,a,C,L);
    T = U_L*U_M*U_H*pst(L+M);
    A = full(T);
    R = modu(A);
    %For finding the period by using Continued fraction
    [p1,p2,p] = shor_result(a,M,L,R,C);
    %If solution is found stop the loop
    if(p1~=1 && p2 ~= 1)
        break;
    end
end
%Printing result
fprintf("a = %0.2i p1 = %0.2i  p2 = %0.2i  p = %0.2i \n",a, p1,p2,p);

%Finding the probability matrix for the basis state ps
function si = modu(ps)
     a = 0;
     for i = 1:length(ps)
         ps(i)=abs(ps(i))^2;
         a = a + ps(i);
     end

     si = ps/a;
end