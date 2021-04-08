%Hadmard gate
function H_G = Hadmard(n)
H = [1,1;1,-1];
H = sparse(H);
T = H;
    for i = 1:n-1
        T = kron(T,H);
    end
H_G = T;
end
% function H_G = Hadmard(n)
%     I = [1,0;0,1];
%     H = [1,1;1,-1];
%     if(n<2)
%         H_G = H;
%         return
%     end
%     I_t = zeros(power(2,n-1),power(2,n-1)); 
%     H_T = zeros(power(2,n),power(2,n));
%     I_t(1:2,1:2,1)=I;
%     for i = 2:n-1
%         I_t(1:power(2,i),1:power(2,i),i)=kron(I_t(1:power(2,i-1),1:power(2,i-1),i-1),I);
%     end
%     for(i=1:n)
%         if(i ~= n && i~=1)
%            T = kron(I_t(1:power(2,i-1),1:power(2,i-1),i-1),H);
%            T = kron(T,I_t(1:power(2,n-i),1:power(2,n-i),n-i));
%         elseif(i == n)
%             T = kron(I_t(1:power(2,i-1),1:power(2,i-1),i-1),H);
%         else
%             T = kron(H,I_t(1:power(2,n-1),1:power(2,n-1),n-1));
%         end
%         H_T(:,:,i)=T;
%     end
%     H_G = H_T(:,:,1);
%     for i =2:n
%         H_G = H_G*H_T(:,:,i);
%     end
% end
%     

