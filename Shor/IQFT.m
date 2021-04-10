function FT = IQFT(L)
H = (1/sqrt(2))*[1,1;1,-1]; %Hadmard Gate
H = sparse(H);
if(L==1)
    FT = H;
    return;
end
K0 = [1;0];%Ket |0>
K1 = [0;1];%Ket |1>
B0 = K0.'; % <0|
B1 = K1.'; % <1|
R0 = K0*B0; % Rotation condition when qbit is 0
R1 = K1*B1; % Rotation condition when qbit is 1
I = [1,0;0,1]; % Identity matrix
I = sparse(I);
T1 = H;    % Temporary Matrix;
    for i = 1:L-1
        T1 = kron(T1,I);
    end
    for i = 1:L-1
        T2 = R0; %Temporary
        T3 = R1;
        % for loop for conditions when the qubit is 0
        for j = 1:L-1
            T2 = kron(T2,I);
        end
        %For loop for conditions when qbit is 1
        for j = 1:L-1
            if(i==j)
                T3 = kron(T3,rot(power(2,i)));
            else
                T3 = kron(T3,I);
            end
        end
        %Adding T2 and T3 to get the correct matrix;
        T1 = (T2+T3)*T1;
    end
    FT = T1;
   FT = kron(I,IQFT(L-1))*FT; %Recursive call for IQFT_{L-1}
%  function R = rot(x)
%         x = pi/x;
%         R = [cos(x),sin(x);-sin(x),cos(x)];
%     end
    function R = rot(x)
        x = pi/x;
        R = [1,0;0,exp(1i*x)];
    end
end
