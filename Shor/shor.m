%Finding probability state for a given value of 'a'
M=6;
a=10;
C=39;
L=8;
%Creating Matirx for matrix operations as done in Shor_complete.m
I = [1,0;0,1];
I_M = I;
for i = 1:M-1
        I_M = kron(I_M,I);
end
U_L = kron(IQFT(L),I_M);
U_M = modC(M,a,C,L);
U_H = kron(Hadmard(L),I_M);
si = pst(L+M);
%Matrix operation
T = U_M*U_H*si;
A = full(U_L*T);
%Printing Result
[Table1, Table2,A ]=result(L,M,A);
Table = Table1;
Table(:,1)=Table1(:,1)/2^L;
figure
plot(Table1(:,1),Table1(:,2))
figure
bar(Table2(:,1),Table2(:,2))
figure
plot(Table(:,2),Table(:,1))

