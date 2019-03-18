n = input('Ingrese cantidad de ecuaciones: ');
a = zeros(n);
c = zeros(n,1);
s = zeros(n,1);
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

% Calculo
invA = inv(a);
out = invA * c;
disp('Resultado ');
disp(out)

