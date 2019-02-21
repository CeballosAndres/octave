fun = input('Ingrese la función: ','s');
f = inline(fun);
a = input('Ingrese el limite inferior: ');
b = input('Ingrese el limite superior: ');
tolerancia = input('Ingrese la tolerancia permitida: ');
la = a;
lb = b;
x = 0;
y = 0;
n = 0;
err = 1;

% 2*x^3-(2.5)*x-5 

if (f(a) * f(b) < 0)
    fprintf('\t #  \t LI \t PM \t LS \t Ɛ\n')
    while(err > tolerancia)
        n++;
        x = a-((f(a)*(b-a))/(f(b)-f(a)));
        y = f(x);
        err = abs(y);
        fprintf('\t %d  \t %d \t %d \t %d \t %d\n',n, a, x , b, err)
        if (f(a) * y < 0)
            b = x;
        else
            a = x;
        endif
    endwhile
    printf('\n\nFunción f(x) = %s  , [%d, %d] \n',fun,la,lb) 
    printf('Raiz: f(%d) = %d   -> entre [%d, %d]\n\n',x,y,a,b)
else
    printf('La función %s no cruza x en el intervalo [%d,%d]\n',fun,a,b)
endif

