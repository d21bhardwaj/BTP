%Oracle
import Hadmard.*
I = [1,0;0,1];
s = sqrt(2);
H = [1,1;1,-1];
n = 6;
N= power(2,n);
w = 5;
O = zeros(N,N);
J = O;
H_G = Hadmard(n);
J(1,1)=-1;O(w,w)=-1;
for i = 1:N
    if(i~=1) 
        J(i,i)=1;  end
    if(i~=w) 
        O(i,i)=1; end
end
A = [1;0];
%%%%%%%%%%%%%%%Grover Start %%%%%%%%%%%
 psi =A;
 sqrt(power(2,n))*22/28
 L = 800
 for i = 2:n
     psi = kron(psi,A);
 end
 y = zeros(L,1);
 x = [1:L];
 psi = H_G*psi;
 for i = 1:L
     psi = O*psi;
     psi = H_G*psi;
     psi = J*psi;
     psi = H_G*psi;
     psi = mod(psi);
     y(i)=psi(w)*psi(w);
 end
 "Here"
 plot(x,y,'-o')
 function psi = mod(pst)
     a = 0;
     for i = 1:length(pst)
         a = a +pst(i)*pst(i);
     end
     a = sqrt(a);
     psi = pst/a;
 end
