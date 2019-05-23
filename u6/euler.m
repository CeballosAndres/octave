%% Alumnos
%% Beverly Urias
%% José Andrés Ceballos Vadillo
f=@(t,y)[-2*y+2-e^(-4*t)];
delta=0.1;
buscado = 0.5;
x = [0:delta:buscado];
y(1)=1;
for i=1:length(x)-1
    y(i+1)=y(i)+delta*f(x(i),y(i));
endfor
disp(x);
disp(y);
plot(x,y);
