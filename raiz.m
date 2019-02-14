fun = input('Ingrese la función: ','s');
f = inline(fun);
a = input('Ingrese valor para a: ');
b = input('Ingrese valor para b: ');
tolerancia = input('Ingrese la tolerancia permitida: ');
seguir = true;
la = a;
lb = b;
x = 0;
y = 0;

if (f(a) * f(b) <0)
    while(seguir)
        x = (a + b)/2;
        y = f(x);
        if (((b-a)/2) < tolerancia)
            seguir = false;
        endif
        if (f(a) * f(x) < 0)
            b = x;
        else
            a = x;
        endif
    endwhile
    printf('\nFunción f(x) = %s  , [%d, %d] \n',fun,la,lb) 
    printf('Raiz: f(%d) = %d   -> entre [%d, %d]\n\n',x,y,a,b)
else
    printf('La función %s no cruza x en el intervalo [%d,%d]\n',fun,a,b)
endif
