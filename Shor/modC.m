function T = modC(M, a, C,L)
%This is used for calculating a mod C 
%   Detailed explanation goes here
K0 = [1;0];%Ket |0> 
K1 = [0;1];%Ket |1>
B0 = K0.'; % <0|
B1 = K1.'; % <1|
R0 = K0*B0; % Rotation condition when qbit is 0
R1 = K1*B1; % Rotation condition when qbit is 1
I = [1,0;0,1]; % Identity matrix
I = sparse(I);
N = power(2,M);
U = zeros(N); %Unitary matrix
I_M = I;
    for i = 1:M-1
        I_M = kron(I_M,I);
    end
    for i = 1:N
        r = mod((i-1)*a,C);
        if(r~=0)
            U(i,r+1)=1;
        else
            U(i,i)=1;
        end
    end
    U = sparse(U);
%   Matrix for off condition
    T = amodC(L,R0,R1,I,1,U,I_M);
    for i = 2:L
        U = U*U;
        T = T*amodC(L,R0,R1,I,i,U,I_M);
    end
    function T = amodC(L,R0,R1,I,i,U,I_M)
        % For on condition
        for j = 1:L
            if(j==L+1-i) % For the on off condition
                if(j==1) % For initialising T
                    T1 = R0;
                else
                    T1 = kron(T1,R0);
                end
            else        % For filling I matrix
                if(j==1) 
                    T1 = I; 
                else    
                    T1 = kron(T1,I);
                end
            end
        end
        % For off condition
        for j = 1:L
            if(j==L+1-i)    % For the on off condition
                if(j==1)    % For initialising T
                    T2 = R1;
                else
                    T2 = kron(T2,R1);
                end
            else            % For filling I matrix
                if(j==1) 
                    T2 = I; 
                else    
                    T2 = kron(T2,I);
                end
            end
        end
        T = kron(T1,I_M)+kron(T2,U);
    end
end

