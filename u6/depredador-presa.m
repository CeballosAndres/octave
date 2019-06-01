clear
close all
clc
% Cargar los datos
file = load('datos.txt');
tiempo = 0:1:length(file)-1;
disp("\nLos datos de entrada son:  ");
fprintf('  Tiempo  ');
fprintf('|%3.0f  ',tiempo(1,:));
fprintf('|\n');
fprintf('  Presa   ');
fprintf('|%5.1f',file(:,1));
fprintf('|\n');
fprintf('Depredador');
fprintf('|%5.1f',file(:,2));
fprintf('|\n\n');

% Determinar valores para a1, a2, b1, b2, x(0), y(0)
% tomando en cuenta los valores medios:
% xm(t)=b1/b2, ym(t)=a1/a2 

function [posicion] = buscarLimites(datos, columna)
  posicion(1)=1;
  mayores(1) = datos(columna,1);
  i = 2;
  mayor = datos(1,columna);
  while(datos(i,columna) > mayor)
      mayor = datos(i,columna);
      posicion(1) = i;
      i++;
  endwhile
  posicion(2)=posicion(1);
  i = posicion(1)+1;
  menor = datos(posicion(1),columna);
  while(datos(i,columna) < menor)
      menor = datos(i,columna);
      posicion(2) = i;
      i++;
  endwhile
  i = posicion(2)+1;
  posicion(3)=posicion(2);
  mayor = datos(posicion(2),columna);
  bandera = false;
  while(datos(i,columna) > mayor || bandera)
      mayor = datos(i,columna);
      if (i-posicion(2))==1
        bandera=true;
      else
        bandera = false;
      endif
      posicion(3) = i;
      i++;
  endwhile
  menor=datos(posicion(1),columna);
  for i=(posicion(1)+1):(posicion(3)-1)
    if datos(i,columna) < menor
      menor = datos(i,columna);
      posicion(2) = i;
    endif
  endfor
endfunction

%% Se llama al metodo buscarLimites que regresa tres valores, el primero 
%% es el más alto a la izquierda el segundo el más bajo y el tercero el más alto
%% a la derecha.
limpresa=buscarLimites(file,1);
limdepredador=buscarLimites(file,2);
%% Se obtiene un subarreglo con los valores contenidos entre los más altos valores
valorespresa=file(limpresa(1):limpresa(3)-1,1)';
valoresdepredador=file(limdepredador(1):limdepredador(3)-1,2)';
%% Se obtiene el promedio de los valores
propresa= mean(valorespresa);
prodepredador= mean(valoresdepredador);
%% Calculo de los coeficientes a1,a2,b1,b2
a1=log(file(limdepredador(2)+1,1)/file(limdepredador(2),1));
b1=-log(file(limpresa(2),2)/file(limpresa(2)-1,2));
a2=a1/prodepredador;
b2=b1/propresa;
fprintf('Sen han calculado los coeficientes a1:%d, a2:%d, b1%d, b2:%d\n\n',a1,a2,b1,b2);
%% A partir de los coeficientes se determinan las funciones
f1=inline('a1*x-a2*x*y');
f2=inline('-b1*y+b2*x*y');
disp('Se aplica el metodo Runge-Kutta para la resolución');
disp('del siguiente sistema de ecuaciones diferenciales');
disp("x'(t) = a1x(t) - a2x(t)y(t)");
disp("y'(t) = -b1y(t) + b2x(t)y(t)\n");

%% Se inicia la resolución del sistema mendiante Runge-Kutta orden 4
t0=0;
x0=file(1,1);
y0=file(1,2);
DeltaT=(length(file)+1)/200;
Tap=length(file);
x0(1)=x0;
y0(1)=y0;
t0(1)=t0;
n=1;
fprintf('Con los valores x(0)=%d, y(0)=%d y un h=%d \n',x0,y0,DeltaT);
fprintf('se procede a resolver el sistema con Runge-Kutta\n');
while t0 < Tap
    t0(n+1)=t0(n) + DeltaT;
    K11=f1(a1,a2,x0(n),y0(n),t0(n));
    K12=f2(b1,b2,x0(n),y0(n),t0(n));
    K21=f1(a1,a2,x0(n)+0.5.*DeltaT*K11, y0(n)+0.5.*DeltaT*K12,t0(n)+(DeltaT/2));
    K22=f2(b1,b2,x0(n)+0.5.*DeltaT*K11, y0(n)+0.5.*DeltaT*K12,t0(n)+(DeltaT/2));
    K31=f1(a1,a2,x0(n)+0.5.*DeltaT*K21, y0(n)+0.5.*DeltaT*K22,t0(n)+(DeltaT/2));
    K32=f2(b1,b2,x0(n)+0.5.*DeltaT*K21, y0(n)+0.5.*DeltaT*K22,t0(n)+(DeltaT/2));
    K41=f1(a1,a2,x0(n)+DeltaT*K31, y0(n)+DeltaT*K32,t0(n)+DeltaT);
    K42=f2(b1,b2,x0(n)+DeltaT*K31, y0(n)+DeltaT*K32,t0(n)+DeltaT);
    phi1=(1/6)*(K11+2.*K21+2.*K31+K41);
    phi2=(1/6)*(K12+2.*K22+2.*K32+K42);
    x0(n+1)=x0(n)+phi1.*DeltaT;
    y0(n+1)=y0(n)+phi2.*DeltaT;
    n=n+1;
end

%% Se realiza la graficación
disp('Se inicia graficación');
hold on
plot(t0,x0,'-r');
plot(file(:,1),'xr')
plot(t0,y0,'-b');
plot(file(:,2),'xb')
legend("Ajuste Presa","Datos Presa","Ajuste Depredador","Datos Depredador");
hold off

