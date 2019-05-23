
for i=1:length(interpolar)
    valores = abs(file(:,1)'.-interpolar(i));
    intervalos = zeros(1,orden+1);
    menor = valores(1);
    con = 1;
    for j = 2:length(valores)
        if valores(j) < menor
            intervalos(1,con:orden+1) = j;
            con++;
        endif
    endfor
    for v=intervalos
        disp(v)
    endfor
endfor