clear
close all

f=inline('-2*x^3+12*x^2-20*x+8.5');
x0=input('Introduzca el valor inicial para x0: ');
y0=input('Introduzca el valor inicial para y0: ');
DeltaX=input('Introduzca el incremento inicial: ');
Xap=input('Introduzca el valor a aproximar: ');

x=0:DeltaX:Xap
ysol=-0.5*x.^4+4*x.^3-10*x.^2+8.5*x+1;
hold on
plot(x,ysol,'o-g');

%% Eule
y(1)=1;
for i=1:length(x)-1
    y(i+1)=y(i)+DeltaX*f(x(i),y(i));
endfor
disp(x);
disp(y);
plot(x,y,'o-b');

%% RK4
fprintf('RK4\n');
x0(1)=x0
y0(1)=y0
n=1
while x0 < Xap
    x0(n+1)=x0(n) + DeltaX
    K01=f(y0(n),x0(n));
    K02=f(y0(n)+0.5.*K01.*DeltaX, x0(n)+0.5.*DeltaX);
    K03=f(y0(n)+0.5.*K02.*DeltaX, x0(n)+0.5.*DeltaX);
    K04=f(y0(n)+K03.*DeltaX, x0(n)+DeltaX);
    phi=(1/6)*(K01+2.*K02+2.*K03+K04);
    y0(n+1)=y0(n)+phi.*DeltaX
    n=n+1
end

plot(x0,y0,'o-r');
