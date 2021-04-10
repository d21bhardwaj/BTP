function ps = pst(N)
K0 = [1;0];%Ket |0>
K1 = [0;1];%Ket |1>
ps = sparse(K0);
    for i = 1:N-2
        ps = kron(ps,K0);
    end
ps = kron(ps,K1);
end

