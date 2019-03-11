n = input('Ingrese cantidad de ecuaciones: ');
a = zeros(n);
c = zeros(n,1);
printf('Ingrese los coeficientes:\n')
for i = 1:n
    for j = 1:n
        printf('Para %d,%d: ',i,j)
        a(i,j) = input('');
    endfor
endfor
printf('Ingrese las constantes:\n')
for(i=1:n)
    printf('Para %d: ',i)
    c(i,1) = input('');
endfor
A = [a c];
disp('Entrada')
disp(A)
for i = 1:n
    A(i,:) = A(i,:)/A(i,i);
    for j = i+1:n
       A(j,:) = A(j,:)-A(j,i)*A(i,:);
    endfor
endfor
for i = n:-1:1
    A(i,:) = A(i,:)/A(i,i);
    for j = i-1:-1:1
       A(j,:) = A(j,:)-A(j,i)*A(i,:);
    endfor
endfor
disp('Salida')
disp(A)
