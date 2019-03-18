% Se sabe que la constante gravitacional es G=6.67e-11 y que la masa de
% la Tierra es Me=(5.97 +- 0.1)e24 kg y la del Sol es Mo=(1.99 +- 0.3)e30 kg
% y que la distancia entre la Tierra y el Sol es d=(1.49 +- 0.5)e11. Calcular
% la fuerza ejercida por el Sol sobre nuestro planeta y el error total en su
% estimación. Comparar con la fuerza gravitacional que la Tierra ejerce sobre
% una persona de 70 kg (tomando en cuenta 6000 km como el radio terrestre).

% Alumno José Andrés Ceballos Vadillo
% Constante Gravedad
G = 6.67e-11;

% Sol-Tierra
mTierra = [5.97e24, 0.1e24];
mSol = [1.99e30, 0.3e30];
distancia = [1.49e11, 0.5e11];

% Humano-Tierra
humano = [70, 0];
radio = [6.0e6, 0];

function salida = mulDep(valorA, valorB)
    calculo = valorA(1) * valorB(1);
    errores = (valorA(2)/valorA(1)) + (valorB(2)/valorB(1));
    salida = [calculo, errores];
endfunction

function salida = divInd(valorA, valorB)
    calculo = valorA(1) / valorB(1);
    errores = (((valorA(2)/valorA(1))^2) + (valorB(2)/valorB(1))^2)^(1/2);
    salida = [calculo, errores];
endfunction

function salida = const(constante, valor)
    calculo = constante * valor(1);
    errores = constante * valor(2);
    salida = [calculo, errores];
endfunction

function salida = pote(valor, potencia)
    calculo = valor(1)^potencia;
    errores = potencia * valor(2);
    salida = [calculo, errores];
endfunction

% formula  f = (G*mTierra*mSol)/distancia^2
fTierraSol = divInd(const(G, mulDep(mTierra,mSol)), pote(distancia,2));
% formula  f = (G*mTierra*humano)/radio^2
fHumanoTierra = divInd(const(G, mulDep(mTierra,humano)), pote(radio,2));

printf('Fuerza gravedad:\n');
printf('Tierra-Sol: %e con error: %e\n', fTierraSol(1),fTierraSol(2));
printf('Tierra-Humano: %e con error: %e\n', fHumanoTierra(1),fHumanoTierra(2));
