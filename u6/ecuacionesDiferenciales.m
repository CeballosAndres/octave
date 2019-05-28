clear
close all
xvector = 0:0.5:4;
f=inline('-2*x^3+12*x^2-20*x+8.5');
x0=input('Introduzca el valor inicial para x0: ');
y0=input('Introduzca el valor inicial para y0: ');
DeltaX=input('Introduzca el incremento inicial: ');
Xap=input('Introduzca el valor a aproximar: ');

x=0:DeltaX:Xap
ysol=-0.5*x.^4+4*x.^3-10*x.^2+8.5*x+1;
hold on
plot(x,ysol,'o-g');

%% Euler
y(1)=1;
for i=1:length(x)-1
    y(i+1)=y(i)+DeltaX*f(x(i),y(i));
endfor
disp(x);
disp(y);
plot(x,y,'o-b');

disp("ERROR CON EULER:")
er_euler= abs(ysol-y)
plot(xvector,10+er_euler,'d--k')

%% RK2
fprintf('RK2\n');
x1(1)=x0
y1(1)=y0
n=1
while x1 < Xap
  x1(n+1)=x1(n) + DeltaX
  K11=f(x1(n),y1(n));
  K12=f(x1(n)+0.75.*DeltaX,y1(n)+0.75.*K11*DeltaX);
  y1(n+1)=y1(n)+(1/3)*K11+(2/3)*K12;
    n=n+1
end

plot(x1,y1,'o-m');
disp("ERROR CON RUGER K.:")
er_ruger2=abs(ysol-y1)
plot(xvector,10+er_ruger2,'p--c')



%% RK4
fprintf('RK4\n');
x0(1)=x0
y0(1)=y0
n=1
while x0 < Xap
  x0(n+1)=x0(n) + DeltaX
  K01=f(x0(n),y0(n));
  K02=f(x0(n)+0.5.*K01.*DeltaX,y0(n)+0.5.*DeltaX);
  K03=f(x0(n)+0.5.*K02.*DeltaX,y0(n)+0.5.*DeltaX);
  K04=f(x0(n)+K03.*DeltaX,y0(n)+DeltaX);
  phi=(1/6)*(K01+2.*K02+2.*K03+K04);
  y0(n+1)=y0(n)+phi.*DeltaX
    n=n+1
end
plot(x0,y0,'o-r');
disp("ERROR CON RUGER K.:")
er_ruger=abs(ysol-y0)
plot(xvector,10+er_ruger,'p--m')


legend("Datos","Euler","Euler ERROR","RK02","RK02 ERROR","RK04","RK04 ERROR");


