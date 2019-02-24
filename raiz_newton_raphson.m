printf('Metodo Newton Raphson\n')
fun = input('Ingrese la función: ','s');
f = inline(fun);
tol = input('Ingrese la tolerancia permitida: ');
x0 = 2;
x1 = 0;
y = 0;
n = 0;
err = 1;
printf('Se escogen indistintamente el punto x0=%d\n',x0)
% 2*x^3-(2.5)*x-5 

fprintf('\t #  \t x0 \t\t x1 \t\t f(x1) \t\t Ɛ\n')
while(err > tol)
    n++;
    x1 = x0 - (f(x0)/(((f(x0+(tol/10)))-(f(x0-(tol/10))))/(tol*2/10)));
    x0 = x1;
    y = f(x1);
    err = abs(y);
    fprintf('\t %d  \t%#.6f \t %#.6f \t %#.6f \t %#.6f\n', n, x0, x1 , y, err)
endwhile
printf('\n\nFunción f(x) = %s \n',fun) 
printf('Raiz: f(%d) = %d \n\n',x0,y)

