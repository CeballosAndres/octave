clear
close all

f=inline('9.8-0.196*y');
x0=input('Introduzca el valor inicial para x0: ');
y0=input('Introduzca el valor inicial para y0: ');
DeltaX=input('Introduzca el incremento inicial: ');
Xap=input('Introduzca el valor a aproximar: ');

x=0:DeltaX:Xap
ysol=50-50*e.^(-0.196*x);
hold on
plot(x,ysol,'o-g');

fprintf('RK4\n');
x0(1)=x0
y0(1)=y0
n=1
while x0 < Xap
    x0(n+1)=x0(n) + DeltaX
    K01=f(x0(n),y0(n));
    K02=f(x0(n)+0.5.*DeltaX, y0(n)+0.5.*K01*DeltaX);
    K03=f(x0(n)+0.5.*DeltaX, y0(n)+0.5.*K02*DeltaX);
    K04=f(x0(n)+DeltaX, y0(n)+K03*DeltaX);
    phi=(1/6)*(K01+2.*K02+2.*K03+K04);
    y0(n+1)=y0(n)+phi.*DeltaX
    n=n+1
end

plot(x0,y0,'-r');
