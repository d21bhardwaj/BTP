%Factors
import Hadmard.*
import IQFT.*
import modC.*
import pst.*
clear()
M=6;
found =0;
C=55;
L=8;
I = [1,0;0,1];
I_M = I;
for i = 1:M-1
        I_M = kron(I_M,I);
end
U_L = kron(IQFT(L),I_M);

U_H = kron(Hadmard(L),I_M);
for a = 2:C-1
    U_M = modC(M,a,C,L);
    si = pst(L+M);
    T = U_L*U_M*U_H*si;
    A = full(T);
    str = string(a);
    str = append(" Result ",str);
    % [T1, T2,T ]=result(L,M,T);
    % figure
    % plot(T1(:,1),T1(:,2),'o')
    [ Table2,p]=result2(L,M,A);
    figure('Name',str)
    plot(Table2(:,1),Table2(:,2))
    
    if(mod(p,2)==0)
        p = p/2;
        if(mod(a^p,C)~=-1)
            x= a^p;
            p1 = gcd(x+1,C);
            p2 = gcd(x-1,C);
            fprintf("a = %0.3i p = %0.3i p1 = %0.3i p2 = %0.3i",a,2*p,p1,p2)
            fprintf("\n")
        end
    end
end
Table = Table1;
Table(:,1)=Table1(:,1)/2^L;
figure
plot(Table1(:,1),Table1(:,2))
figure
plot(Table2(:,1),Table2(:,2))
figure
plot(Table(:,1),Table(:,2))