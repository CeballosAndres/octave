M = load('tiemposyvelocidades.txt');
M
a = 3-1;
n = 1;
X=16;
suma =0;
for i=1:n
    mult=1;
    for j=1:n
        if i != j
            mult = mult * ((X-M(a+j,1))/(M(a+i,1)-M(a+j,1)));
            mult
        endif
    endfor
        mult = mult * M(i,2);
        mult
    suma = suma + mult;
    suma
endfor
suma
