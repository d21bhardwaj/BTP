I = [1,0;0,1];
J = sparse(I);
A = kron(J,I);
B = full(A);
K0 = [1;0];
K0 = sparse(K0);
% J = 5;
% L = de2bi(J,5);
% K = bi2de(L(2:5));
% Table1 = zeros([2 4]);
% H = [1,1;1,-1];\
L = 6;
U = zeros(L);

for j = 1:2^L
    for k = 1:2^L
        U(k,j)=(1/sqrt(2^L))*exp(2*pi*1i*(j-1)*(k-1)/(2^L));
    end
end
H = IQFT(L);
U = sparse(U);
