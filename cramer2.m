n = input('Ingrese cantidad de ecuaciones a operar: ');
A = zeros(n);
C = zeros(n,1);
printf('Ingrese los coeficientes:\n')
for(i=1:n)
    for(j=1:n)
        A(i,j) = input('');
    endfor
endfor
printf('Ingrese las constantes:\n')
for(i=1:n)
    C(i,1) = input('');
endfor
a = [A C]