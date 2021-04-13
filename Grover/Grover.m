%No of qubits
n = 8;
N= power(2,n);
w = 0;
%Matlab Matrix starts from one.
w = w+1;
O = speye(N); J = O;
J(1,1)=-1;O(w,w)=-1;
%Hadmard Gate for n qubits H
H_G = Hadmard(n);
A = [1;0];
%Initialising the basic state
psi =A;
 for i = 2:n
     psi = kron(psi,A);
 end
psi = H_G*psi;
m=int64(sqrt(power(2,n))*22/28);
fprintf("Value of m = %i for maximum probablility of finding w = %i \n",m,w)
% Maximum value of m for Till which the loop will function
L = 400;
%For Storing the results after each Application of Gorvers Diffusor circuit
y = zeros(L,1);
x = [1:L];
%Applying Grovers Diffusor Circuit 
G = H_G*J*H_G*O;
G = sparse(G);
 for i = 1:L
     psi = G*psi;
     psi = mod(psi);
     y(i)=psi(w)*psi(w);
     if (i==m)
         y1 = zeros(N,2);
         y1(:,1)=[0:N-1];
          ps = psi.*psi;
         for j = 1:100
             v = measure(n,ps);
             y1(v,2) = y1(v,2)+1;
         end
         bar(y1(:,1),y1(:,2));
     end
 end
 figure
 plot(x,y,'-o')
 %Finds the Probability of states in psi, use full for storing information
 function psi = mod(pst)
     a = 0;
     for i = 1:length(pst)
         a = a +pst(i)*pst(i);
     end
     a = sqrt(a);
     psi = pst/a;
 end
