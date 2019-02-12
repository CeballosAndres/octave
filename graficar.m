% Encontrar:
% x.^3+4.*x.^2-10
% 3*e.^x
% sin(x)

disp('Generación de graficas (no son necesarias comillas).')
r = input('Rango +- : ');
in = input('Intervalo: ');
x = [-r:in:r];
opc = true;
while(opc)
    fx = inline(input('Ingrese función: ', "s"));
    p = plot(x, fx(x))
    menor = false;
    mayor = false;
    if(fx(x(1)) <= 0)
        menor = true;
    else 
        mayor = true;
    endif
    cont = 0;
    for i = x
        if (menor && fx(i) >= 0)
            printf("\nRaiz aproximada: x=%d   f(x)=%d", i, fx(i))
            menor = false;
            mayor = true;
            cont ++;
        elseif(mayor && fx(i) <= 0)
            printf("\nRaiz aproximada: x=%d   f(x)=%d", i, fx(i))
            menor = true;
            mayor = false;
            cont ++;
        endif
    endfor
    if(cont > 0)
        printf('\nEn el rango hay %d raices.\n', cont)
    endif
    if(input('Otro? [si] ',"s") != "si")
        opc = false;
        print('Bye')
        print("Falta mejorar :)")
    endif
endwhile
close()

