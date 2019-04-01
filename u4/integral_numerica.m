% 1 - Definir f(x)
f = input('Ingrese la función: ',"s");
f = inline(f);
% 2 - Definir a y b (los limites o cotas)
a = input('Ingrese valor de a: ');
b = input('Ingrese valor de b: ');
% 3 - Define N
n = input('Ingrese valor de N: ');
%4 - define delta x
delx = (b-a)/n;
% 5 - Calculo mediante iteraciónes
suma = 0;
for i = 1:n-1
    suma = suma + f(a+delx*i);
end
suma = (2*suma + f(a) + f(b)) * delx/2;
disp(suma);
    

