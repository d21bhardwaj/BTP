A1 = [1;0];
B1 = [1;0];
Psi = kron(A1,B1);
I = [1,0;0,1];
s = sqrt(2);
H = s*[1,1;1,-1];
C = [1,0,0,0;0,1,0,0;0,0,0,1;0,0,1,0];
H1 = kron(H,I);
Psi = C*H1*Psi;
O = Obs(0,2,Psi);
function  O = Obs(S1,S2,Psi)
    I = [1,0;0,1];
    RA = kron(Rot(S1),I);
    RB = kron(I,Rot(S2));
    pst = RB*RA*Psi;
    q=0;t=0;
     r = randi([1,100000],1)/100000

    pst
    for i = 1 : 4
        a = pst(i);
        t = t+a*a;
    end

    t = sqrt(t);
    for i = 1 : 4
        pst(i) = pst(i)/t;
        
    end
    i=1;
    for i = i : 4
        a = pst(i);
        q = q+ a*a
        if(r<=q)
            break
        end
    end
    O = i
end

function R = Rot(x)
    x = x*pi/3;
    R = [cos(x),sin(x);sin(x),-cos(x)];
end
