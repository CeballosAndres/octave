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
sumapar = 0;
sumaimpar = 0;
for i = 1:2:n-1
    sumaimpar = sumaimpar + feval(f,a+i*delx);
end
for i = 2:2:n-1
    sumapar = sumapar + feval(f,a+i*delx);
end
suma = (4*sumaimpar + 2*sumapar + f(a) + f(b)) * delx/3;
disp(suma);
