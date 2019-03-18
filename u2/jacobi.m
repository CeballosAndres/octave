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
% Verificar diagonal dominante

bandera = false;
for i = 1:filas
	if !(abs(A(i,i)) >= (sum(abs(A(i,1:columnas)))-abs(A(i,i)))) 
		bandera = true;
	endif
endfor
if !bandera
	s = zeros(1,columnas);
	v = zeros(1,columnas);
	disp('Entrada')
	disp(A);
	tol = input('Ingrese tolerancia: ');
	for i=1:columnas
		v(i)=input('Valor inicial de ');
	endfor
	err = 1;
	k=0;
	while (err>=tol)
		for i=1:filas
			s(i)=(1/a(i,i))*(A(i,columnas+1)+a(i,i).*v(i)-dot(a(i,:),v));
		er(i)=abs(s(i)-v(i));
		err=sum(er);
		   for i=1:filas 
			v(i)=s(i);
		   endfor
		endfor
		k=k+1;
	endwhile
fprintf('Las soluciones para cada variable son:\n')
v
fprintf('El error en cada dato es:\n')
er,k
else
	disp('Método no valido. No se cumple la diagonal dominante.')
endif


