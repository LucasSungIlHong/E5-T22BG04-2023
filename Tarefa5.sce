Massa=[100,10,10];
A=[1,1,2];

for i=1:3
    M=Massa(i);
    a=A(i);
    m=1;
    g=10;
    k2=M/(2*m)+1;
    w2=g/a;

    MMatrix=[2*k2,1,1;
    1,1,0;
    1,0,1];

    K=[2*k2*w2,0,0;
    0,w2,0;
    0,0,w2];

    [R,q]=spec(inv(K)*MMatrix);
    
    disp(M,'Para M=')
    disp(a,'E com a=')
    disp(sqrt(1/q),'As frequências são:');
    disp(R,'E os autovetores respectivamente associados são:')
end

