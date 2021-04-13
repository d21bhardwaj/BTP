%Hadmard gate
function H_G = Hadmard(n)
H = [1,1;1,-1];   
T = sparse(H);
    for i = 1:n-1
        T = kron(T,H);
    end
H_G = T;
end
