disp('El siguiente programa realiza una interpolación mediante el metodo Newton,');
disp('en un segundo momento realiza un ajuste polinomial');
x = load(input('Ingrese el nombre del archivo [datos.txt]: ',"s"));
%x = load('datos.txt');
disp("\nLos valores del archivo son:  ");
fprintf('  t ');
fprintf('| %10.3f\t',x(:,1));
fprintf('|\n');
fprintf('y(t)');
fprintf('| %10.3f\t',x(:,2));
fprintf('|\n\n');
%disp('Los valores del archivo son: ');
%disp(x);
interpolar = str2num(input('Ingrese los valores a buscar(Interpolar) [delimitados por comas]: ',","));
% interpolar = [16,17,18,19,21,22,23];
orden = 0;
while(orden > length(x)-1 || orden == 0)
    printf('Orden de interpolación (entre 1 y %d): ', length(x)-1);
    orden = input('');
    %orden = 2;
endwhile


function [newton] = calcularNewton (interpolar, orden, x)
    len=length(x);
    newton = zeros(1,length(interpolar));
    conse = 1;
    for valorX=interpolar
        for  i=2:1:(orden+1)
            if (i==2)
                for j=2:1:len
                  if (valorX<x(j,1) && valorX>x(j-1,1));
                        primero=abs( x(j-1,1)-valorX );
                        segundo=abs( x(j,1)-valorX );              
                        extremos(1,1)=j-1;
                        extremos(1,2)=j;
                        if (primero<segundo)
                            vectorYorden(1)=x(j-1,2);
                            vectorXorden(1)=x(j-1,1);
                            vectorYorden(2)=x(j,2);
                            vectorXorden(2)=x(j,1);
                        else
                            vectorYorden(1)=x(j,2);
                            vectorXorden(1)=x(j,1);
                            vectorYorden(2)=x(j-1,2);
                            vectorXorden(2)=x(j-1,1);
                        endif
                endif
          endfor
            else
                    if (extremos(1)!=1 && extremos(2)!=len)
                        primero=abs( x((extremos(1)-1),1 )-valorX);
                        segundo=abs( x((extremos(2)+1),1 )-valorX);
                        if (primero<segundo)
                                extremos(1,1)=extremos(1,1)-1;
                                vectorYorden(i)=x(extremos(1),2);
                                vectorXorden(i)=x(extremos(1),1);
                            
                        else
                                extremos(2)=extremos(2)+1;
                                vectorYorden(i)=x(extremos(2),2);
                                vectorXorden(i)=x(extremos(2),1);
                            
                        endif
                    elseif(extremos(1)==1)
                        extremos(2)=extremos(2)+1;
                        vectorYorden(i)=x(extremos(2),2);
                        vectorXorden(i)=x(extremos(2),1);
                    elseif (extremos(2)==len)
                        extremos(1)=extremos(1)-1;
                        vectorYorden(i)=x(extremos(1),2);
                        vectorXorden(i)=x(extremos(1),1);
                    endif
            endif
        endfor

        %% calculando valores de bo,1, b2 ...bn y poniendolos en el vector

        vectorb(1)=vectorYorden(1);
        for i=1:1:orden
            for j=1:1:(orden+1-i)
                temp=(vectorYorden(j+1)-vectorYorden(j))/(vectorXorden(j+i)-vectorXorden(j));
                vectortemporal(j)=temp;
            endfor
            vectorb(i+1)=vectortemporal(1);
            vectorYorden(orden+2-i)=0;
            for k=1:1:orden
                vectorYorden(k)=vectortemporal(k);
            endfor
            vectortemporal(orden+1-i)=0;
        endfor
        %% Para mostrar coeficientes 
        %vectorb

        % valor encontrado 
        resp=0;
        resp=vectorb(1);
        for i=1:1:(orden)
            parteMulti=0;
            for j=1:1:i
                if(j==1)
                    parteMulti=(valorX-vectorXorden(j));
                else 
                    parteMulti*=(valorX-vectorXorden(j));
                endif
            endfor
            resp=resp+(vectorb(i+1)*parteMulti);
        endfor
        newton(conse) = resp;
        conse++;
    endfor
endfunction


function [resp] = coeficientesAjustePolinomial (orden, x)
  A = zeros(orden+1,orden+1);
  B = zeros(orden+1,1);
  for ifila=1:1:orden+1
    for jcolumna=1:1:orden+1
      if(ifila==1&&jcolumna==1)
      A(ifila,jcolumna)=length(x);
      else
        A(ifila,jcolumna)=sumatoriaT(ifila+jcolumna-2,x);
      endif
    endfor
  endfor

  for j=0:1:orden
    suma=0;
    for i=1:1:length(x)
      suma+=x(i,2)*x(i,1)**j;
    endfor
    z=j+1;
    B(z)=suma;
  endfor
  resp=A\B;
endfunction
 
function [vector] = resuelvePolinomio(coeficientes, valor)
  vector = [];
  for v=valor
    res = coeficientes(1,1);
    for i=1:length(coeficientes)
      res += coeficientes(i,1) * v^(i-1);
    endfor
    vector = [vector, res];
  endfor
endfunction

function[suma]=sumatoriaT(ex,x)
  suma=0;
  len=length(x);
  for fila=1:1:len
    suma += (x(fila,1)**ex);
  endfor
endfunction


newton = calcularNewton(interpolar, orden, x);
coeficientes = coeficientesAjustePolinomial(orden, x);
disp("\nSe muestra el resultado de la interpolación Newton: ");
fprintf('  t ');
fprintf('| %10.3f\t',interpolar);
fprintf('|\n');
fprintf('y(t)');
fprintf('| %10.3f\t',newton);
fprintf('|\n\n');
%% Inicia la graficación

disp('Se inicia la graficación de los datos.');
newplot;
hold on;
title("Interpolacion y Ajuste Lineal");
xlabel("Variable independiente t");
ylabel("Variable dependiente y(t)");
%% Valores reales
plot(x(1:length(x),1),x(1:length(x),2),'xr');
%% Ajuste polinomial
xvec = [x(1,1):0.1:x(length(x),1)];
yvec = resuelvePolinomio(coeficientes, xvec);
plot(xvec,yvec,'-b');
%% Interpolacion Newton
plot(interpolar,newton,'og');
legend ("Valores introducidos","Ajuste polinomiapolinomial","Interpolacion Newton");
hold off;
disp("Fin del programa");
