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

h = (b-a)/n;

sumai = 0;
supap = 0;

for i = 1:2:n-1
    sumai=sumai + feval(f,h*i+a);
end
for i=2:2:n-2
    sumap= sumap+feval(f,h*i+a);
end
int = (h/3)*(feval(f,a)
