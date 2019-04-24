clc;
clear;

fun = input('Ingresa la funcion f(x)',"s");
f = inline(fun);
n = 1;
while mod(n,2) ~= 0
    k = input('Ingrese el número de subintervalos: ');
    if mod(n,2) = 0
        disp('El número de subintervalos debe ser impar, pulse un tecla para continuar: ');
        pause
    end
end
a = input('Ingrese el limite inferior de la integral: ');
b = input('Ingrese el limite superior de la integral: ');
n = 3 *k;

h = (b-a)/n;
I=0;

for i = 1:k
    I=I+((3*h)/8)*(f(a)+3*f(a+h)+3*f(a+2*h)+f(a+3*h));
    a = a+3*h;
end
fprintf('El resultado de la integral es: %f',I);

