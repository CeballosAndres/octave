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
detA = det(a);
if detA != 0
	for(i = 1:n)
		x = a;
		x(:,i) = c;
		s(i,1) = det(x)/detA;
	endfor
else
	disp('Este método no funciona.La determinante principal es = 0');
endif
disp('La solución es:')
disp(s)
