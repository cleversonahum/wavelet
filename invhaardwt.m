function [inverse] = invhaardwt(in,val,lev)

% Entradas
% in (vetor de entrada)
% val (valor repassados pela função da transformada para facilitar o calculo da inversa)
% lev (valor repassados pela função da transformada para facilitar o calculo da inversa)

% Saidas
% inverse (vetor de saida)

len = val(lev);
inverse = in;
while(lev~=0) % Loop que fará a transformada inversa.
    in = inverse(1:len*2);    
    for i=1:len
        c = (in(i) + in(i+len))/sqrt(2);
        d = (in(i) - in(i+len))/sqrt(2);
        inverse(2*i-1) = c;
        inverse(2*i) = d;
    end
    lev=lev-1;
    if lev~=0
        len=val(lev);
    end
end
end