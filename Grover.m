%Oracle
import Hadmard.*
I = [1,0;0,1];
s = sqrt(2);
H = [1,1;1,-1];
n = 8;
N= 64;
w = 5;
O = zeros(n,n);
J = O;
I_t = zeros(power(2,n-1),power(2,n-1)); 
H_t = zeros(power(2,n),power(2,n));
I_t(1:2,1:2,1)=I;
for i = 2:n-1
    I_t(1:power(2,i),1:power(2,i),i)=kron(I_t(1:power(2,i-1),1:power(2,i-1),i-1),I);
end
for(i=1:n)
    if(i ~= n && i~=1)
       T = kron(I_t(1:power(2,i-1),1:power(2,i-1),i-1),H);
       T = kron(T,I_t(1:power(2,n-i),1:power(2,n-i),n-i));
    elseif(i == n)
        T = kron(I_t(1:power(2,i-1),1:power(2,i-1),i-1),H);
    else
        T = kron(H,I_t(1:power(2,n-1),1:power(2,n-1),n-1));
    end
    H_t(:,:,i)=T;
end

%%%%%%%%%%%%%%%Grover Start %%%%%%%%%%%
% H1 = kron(H,kron(I,I));
% H2 = kron(I,kron(H,I));
% H3 = kron(I,kron(I,H));
% psi = H3*H2*H1*psi;
% y = zeros(N);
% x = [1:N];
% PSI = zeros(
% for i = 1:N
%     psi = O*psi;
%     psi = H3*H2*H1*psi;
%     psi = J*psi;
%     psi = H3*H2*H1*psi;
%     psi = mod(psi);
%     y(i)=psi(w)*psi(w);
% end
% plot(x,y,'--')
% function psi = mod(pst)
%     a = 0;
%     for i = 1:length(pst)
%         a = a +pst(i)*pst(i);
%     end
%     a = sqrt(a);
%     psi = pst/a;
% end
