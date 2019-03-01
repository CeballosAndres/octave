printf('Metodo Newton Raphson\n')
fun = input('Ingrese la función: ','s');
f = inline(fun);
x0 = input('Sugiera una solución a la raiz: ');
tol = input('Ingrese la tolerancia permitida: ');
x1 = 0;
y = 0;
n = 0;
err = 1;
printf('Con el punto x0=%d\n',x0)
% 2*x^3-(2.5)*x-5 

fprintf('\t #  \t x0 \t\t x1 \t\t f(x1) \t\t Ɛ\n')
while(err > tol)
    n++;
    dfx1 = (((f(x0+(tol/1000)))-(f(x0-(tol/1000))))/(tol*2/1000));
    d2fx1 = ((f(x0+(tol/1000))) - (2*f(x0)) + (f(x0-(tol/1000))))/(tol*2/1000);
    x1 = x0 - (f(x0)*dfx1)/((dfx1)^2 -f(x0)*d2fx1);
    x0 = x1;
    y = f(x1);
    err = abs(y);
    fprintf('\t %d  \t%#.6f \t %#.6f \t %#.6f \t %#.6f\n', n, x0, x1 , y, err)
endwhile
printf('\n\nFunción f(x) = %s \n',fun); 
printf('Raiz: f(%f) = %d \n\n',x0,y);