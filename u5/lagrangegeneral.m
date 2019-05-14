%% Alumnos
%% Beverly Urias
%% Selene Elizabeth Arteaga Álvarez
%% Alejandra Centeno Alcaraz
%% José Andrés Ceballos Vadillo
  txt = input('Archivo: ',"s");
  x = load(txt);
  orden=input('Ingrese el orden:(con numero): ');
  orden
  A = zeros(orden+1,orden+1);
  B= zeros(orden+1,1);
  
  function[suma]=sumatoriaT(ex,x)
  suma=0;
  len=length(x);
  for fila=1:1:len
    suma+=(x(fila,1)**ex);
  endfor
endfunction

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
resp=A\B

len=length(x);
temp =x(1,1):1:x(len,1);
hold on;
plot(x(1:len,1),x(1:len,2),'o-r')
switch (orden)

    case 1
      plot(temp,resp(1,1)+(temp.*resp(2,1)))
      case 2
        plot(temp,resp(1,1)+(temp.*resp(2,1))+(temp.**2*resp(3,1)))
        case 3
          plot(temp,resp(1,1)+(temp.*resp(2,1))+(temp.**2*resp(3,1))+(temp.**3*resp(4,1)))
          otherwise
          endswitch
          
          
          hold off;
