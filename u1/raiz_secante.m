printf('Metodo de la bisección\n')
fun = input('Ingrese la función: ','s');
f = inline(fun);
tolerancia = input('Ingrese la tolerancia permitida: ');
x1 = -10;
x2 = x1 + 20;
la = x1;
lb = x2;
x0 = 0;
y = 0;
n = 0;
err = 1;
printf('Se escogen indistintamente los puntos x1=%d y x2=%d\n',x1,x2)
% 2*x^3-(2.5)*x-5 

fprintf('\t #  \t X0 \t\t X1 \t\t X2 \t\t Ɛ\n')
while(err > tolerancia)
    n++;
    x0 = x1-((f(x1)*(x2-x1))/(f(x2)-f(x1)));
    y = f(x0);
    err = abs(y);
    fprintf('\t %d  \t%#.6f \t %#.6f \t %#.6f \t %#.6f\n',n, x0, x1 , x2, err)
    if (f(x1) * y < 0)
        x2 = x0;
    else
        x1 = x0;
    endif
endwhile
printf('\n\nFunción f(x) = %s  , [%d, %d] \n',fun,la,lb) 
printf('Raiz: f(%d) = %d \n\n',x0,y)

