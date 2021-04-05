A1 = [1;0];
B1 = [0;1];
A2 = A1.';
B2 = B1.';
H = sqrt(2)*[1,1;1,-1];
I = [1,0;0,1];
psi = kron(A1,kron(A1,A1));
pst = kron(H,kron(H,H))*psi;
rot(4)
kron(H,I)*(kron(A1*A2,I)+kron(B1*B2,rot(2)))
I4 = kron(I,kron(I,kron(I,I)));
A = kron(H,kron(I,I));
A = kron(A,I4);
B = (kron(A1*A2,I)+kron(B1*B2,rot(2)));
B = kron(B,I);
B = kron(B,I4);
C = (kron(A1*A2,kron(I,I))+kron(B1*B2,kron(I,rot(4))));
C = kron(C,I4);
D = kron(I,kron(H,I));
D = kron(D,I4);
E = kron(I,(kron(A1*A2,I)+kron(B1*B2,rot(2))));
E = kron(E,I4);
F = kron(I,kron(I,H));
F = kron(F,I4);
% G = F*E*D*C*B*A*pst;
% G = modu(G)
% G.*G
% H = A*B*C*D*E*F*pst;
% H = modu(H)
% H.*H
U = zeros(16);
Z = U;
X= U;
Y = U;
for i = 1:16
    r = mod((i-1)*7,15);
    if(r~=0)
        U(i,r+1)=1;
    else
        U(i,i)=1;
    end
end
Z=U;
U=X;
for i = 1:16
    r = mod((i-1)*49,15);
    if(r~=0)
        U(i,r+1)=1;
    else
        U(i,i)=1;
    end
end
X=U;
U=Y;
for i = 1:16
    r = mod((i-1)*power(7,4),15);
    if(r~=0)
        U(i,r+1)=1;
    else
        U(i,i)=1;
    end
end
Y=U;
psi = kron(psi,psi);
psi = kron(psi,B1);
I4 = kron(I,kron(I,kron(I,I)));
H4 = kron(H,kron(H,kron(H,I4)));
D1 = (kron(A1*A2,I4)+kron(B1*B2,Z));
D1 = kron(I,kron(I,D1));
D2 = (kron(A1*A2,kron(I,I4))+kron(B1*B2,kron(I,X)));
D2 = kron(I,D2);
D3 = (kron(A1*A2,kron(I,kron(I,I4)))+kron(B1*B2,kron(I,kron(I,Y))));
G = F*E*D*C*B*A*D3*D2*D1*H4*psi;
G = modu(G)
K=G.*G;
for i = 1:power(2,7)
    if K(i)>0
        fprintf('%i %i ',i,K(i))
        fprintf(' %i ',de2bi(i-1,7))
        fprintf('\n')
    end
end
function R = rot(x)
    x = pi/x;
    R = [cos(x),sin(x);sin(x),-cos(x)];
end
 function psi = modu(pst)
     a = 0;
     for i = 1:length(pst)
         a = a +pst(i)*pst(i);
     end
     a = sqrt(a);
     psi = pst/a;
 end
% function r = rot(p)
%     r = [1,1;1,eul(p)];
% end
% 
% function val=eul(p)
%     val = exp(1i*pi/p);
% end

