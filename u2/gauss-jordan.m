filas = input('Ingrese cantidad de filas: ');
columnas = input('Ingrese cantidad de columnas: ');
a = zeros(filas, columnas);
c = zeros(filas,1);
printf('Ingrese los coeficientes:\n')
for i = 1:columnas
    for j = 1:filas
        printf('Para %d,%d: ',i,j)
        a(i,j) = input('');
    endfor
endfor
printf('Ingrese las constantes:\n')
for(i=1:filas)
    printf('Para %d: ',i)
    c(i,1) = input('');
endfor
A = [a c];
disp('Entrada')
disp(A)
for i = 1:columnas
    A(i,:) = A(i,:)/A(i,i);
    for j = i+1:filas
       A(j,:) = A(j,:)-A(j,i)*A(i,:);
    endfor
endfor
for i = columnas:-1:1
    A(i,:) = A(i,:)/A(i,i);
    for j = i-1:-1:1
       A(j,:) = A(j,:)-A(j,i)*A(i,:);
    endfor
endfor
disp('Salida')
disp(A)
