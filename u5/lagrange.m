x = load('clase');
x

function[La1]=L1(Xa, X0, X1, Y0, Y1)
    L0 = (Xa-X1)/(X0-X1);
    L1 = (Xa-X0)/(X1-X0);
    La1 = L0*Y0+L1*Y1;
endfunction

function[La2]=L2(Xa,X0,X1,X2,Y0,Y1,Y2)
    L0 = ((Xa-X1)/(X0-X1))*((Xa-X2)/(X0-X2));
    L1 = ((Xa-X0)/(X1-X0))*((Xa-X2)/(X1-X2));
    L2 = ((Xa-X0)/(X2-X0))*((Xa-X1)/(X2-X1));
    La2 = L0*Y0+L1*Y1+L2*Y2;
endfunction      

o1 = L1(1.5,x(3,1),x(4,1),x(3,2),x(4,2));
o1
o2 = L2(1.5,x(3,1),x(4,1),x(5,1),x(3,2),x(4,2),x(5,2));
o2
