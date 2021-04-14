A1 = [1;0];
B1 = [1;0];
Psi = kron(A1,B1);
I = [1,0;0,1];
s = sqrt(2);
H = s*[1,1;1,-1];
C = [1,0,0,0;0,1,0,0;0,0,0,1;0,0,1,0];
H1 = kron(H,I);
Run = 1000000;
%Observatin Cell stores the Result of each Simulation%
Observations =cell(1,Run);
Psi = C*H1*Psi;
Table1 = zeros([9 6]);
Table2 = [repmat({0},5,3)];
for i = 1:3
    Table2{2+i,1}=i;
    for j = 1:3
        Table1(3*(i-1)+j, 1)=i;
        Table1(3*(i-1)+j,2)=j;
    end
end
Table2{1,1}='R';
Table2{2,1}='G';
%Runing the simulation
for i=1:Run
    %Generating random Switch setting for Alice and Bob
    Sw1 = (randi([0 2],1)); Sw2 = (randi([0 2],1));
    A = Sw1+1; B = Sw2+1;
    %A_C & B_C stores the Light corresponding to the switch setting
    %generated above.
    [A_C,B_C] = Obs(Sw1,Sw2,Psi);
    %Storing Results in the Table 1 and Table 2
    row = (A-1)*3+B;col = 3+(2*A_C+B_C);
    Table1(row,col)= Table1(row,col)+1;
    Table2{A_C+1,2}= Table2{A_C+1,2}+1;
    Table2{B_C+1,3}= Table2{B_C+1,3}+1;
    Table2{A+2,2}= Table2{A+2,2}+1;
    Table2{B+2,3}= Table2{B+2,3}+1;
    %temp is used to combine the result of switches and light
    %ALice switch 1 and light red and with Bob's switch 2 and light Green
    %temp will be 12RG
    temp = string(A);
    temp = append(temp,string(B));
    if(A_C)
        temp = append(temp,'G');
    else 
        temp = append(temp,'R');
    end
    if(B_C)
        temp = append(temp,'G');
    else
        temp = append(temp,'R');
    end
    Observations{1,i}=temp;
end
%Converting values into ratio Occurance/Total Cases
sum = 0;
%No of time RR and GG were flashed and RG and GR flashed
same_colour = 0;different_colour = 0;
%Ratio in Table 1
%Iterating over row
Table1
for i = 1:9
    sum=0;%Stores no of times switch setting 12 or 11 took place
    %Iterating in columns of Table 1
    for j = 3:6
        if(j==4||j==5)
            different_colour = different_colour + Table1(i,j);
        else
            same_colour = same_colour + Table1(i,j);
        end
        sum = sum+ Table1(i,j); 
    end
    %Converting results into ratio
    for j = 3:6
        Table1(i,j) = Table1(i,j)/sum;
    end
end
%Repeating the steps in previous Table1 to Table 2
%Iterating over column
for i = 2:3
    sum=0;
    %Iterating from row 1 to row 2 i.e. Total R/G colour flash for Alice
    for j =1:2
        sum = sum + Table2{j,i};
    end
    %Determing the ratio
    for j =1:2
        Table2{j,i}= Table2{j,i}/sum;
    end
    %Iterating from row 3 to 5 i.e Total 1,2,3 switch setting for Alice
    sum=0;
    for j = 3:5
       sum = sum + Table2{j,i};
    end
    for j = 3:5
       Table2{j,i}= Table2{j,i}/sum;
    end
end
%Printing the results
Table1
Table2
same_colour
different_colour
function [A_C, B_C]= Obs(S1,S2,Psi)
    I = [1,0;0,1];
    RA = kron(Rot(S1),I);
    RB = kron(I,Rot(S2));
    pst = RB*RA*Psi;
    q=0;t=0;
     r = randi([1,100000],1)/100000;

    pst;
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
        q = q+ a*a;
        if(r<=q)
            break
        end
    end
    
    if(i==1)
        A_C = 0;
        B_C = 0;
    elseif(i==2)
         A_C = 0;B_C=1;
    elseif (i==3)
          A_C = 1;B_C=0;
    else 
         A_C =1; B_C=1;
    end
end

function R = Rot(x)
    x = x*pi/3;
    R = [cos(x),sin(x);sin(x),-cos(x)];
end

