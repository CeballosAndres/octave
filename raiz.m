f = inline(input('Ingrese la función: ','s'));
a = input('Ingrese valor para a: ');
b = input('Ingrese valor para b: ');
tolerancia = input('Ingrese la tolerancia permitida: ');
seguir = true;
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
    printf('La raiz es x=%d  f(x)=%d \n\n',x,y) 
else
    printf('f(x) no cruza x en el intervalo [%d -%d]\n',a,b)
endif
