function [vec,stop] = hthreshold(vec,val,soma,stop,type)

% Entradas
% vec (vetor de entrada)
% val (valores para facilitar os calculos da threshold)
% soma (valor de apoio repassado para tratar os termos corretos na threshold)
% stop (Valor de apoio repassado para saber onde foi a ultima alteração no vetor)
% type (tipo da threshold: hard ou soft)

% Saidas
% vec (vetor de saida)
% stop (Valor de apoio repassado para possivelmente ser mandado novamente).

l=length(vec);
sup = ones(1,val);
k=1;
for j=l-soma+1:stop %vetor de suporte contendo apenas os valores que serão alterados.
    sup(k)=vec(j);
    k=k+1;
end
t=sqrt(2*var(sup)*log(length(sup)))/0.6745; % valor de threshold que será usado na comparação.
if type=='s' %Verá o tipo pedido de threshold
    for i= l-soma+1:stop %Soft threshold
        if abs(vec(i))<=t
            vec(i)=0.0;
        else
            vec(i)=vec(i)-t;
        end
    end
else
    for i= l-soma+1:stop % Hard threshold
        if abs(vec(i))<=t
            vec(i)=0.0;
        end
    end
end
stop=l-soma;
end