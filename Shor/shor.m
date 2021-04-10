import Hadmard.*
import IQFT.*
import modC.*
import pst.*
clear()
M=6;
a=10;
C=39;
L=8;
I = [1,0;0,1];
I_M = I;
for i = 1:M-1
        I_M = kron(I_M,I);
end
U_L = kron(IQFT(L),I_M);
U_M = modC(M,a,C,L);
U_H = kron(Hadmard(L),I_M);
si = pst(L+M);
T = U_M*U_H*si;
A = full(U_L*T);
% [T1, T2,T ]=result(L,M,T);
% figure
% plot(T1(:,1),T1(:,2),'o')
[Table1, Table2,A ]=result(L,M,A);
Table = Table1;
Table(:,1)=Table1(:,1)/2^L;
figure
plot(Table1(:,1),Table1(:,2))
figure
plot(Table2(:,1),Table2(:,2))
figure
plot(Table(:,2),Table(:,1))
% K0 = [1;0];%Ket |0>
% K1 = [0;1];%Ket |1>
% B0 = K0.'; %    <0|
% B1 = K1.'; %    <1|
% %%%%%%%%%%%%%%%%
% A1 = [1;0];
% B1 = [0;1];
% A2 = A1.';
% B2 = B1.';
% %------------------------------------%
% H = [1,1;1,-1];
% I = [1,0;0,1];
