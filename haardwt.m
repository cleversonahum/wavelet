function [output,val,lev ] = haardwt(input,n,type)

% Entradas
% input (vetor de entrada)
% n (niveis de decomposição desejados)
% type (tipo da threshold: hard ou soft)

% Saidas
% output (vetor de saida)
% val (valor repassados para a função que calcula a inversa)
% lev (valor repassados para a função que calcula a inversa)

if ~exist('n','var')  %Verifica se o nivel de decomposição foi passado no argumento.
  n=0;
end
soma=0; %Variavel de apoio para a função de calculo da threshold.
L = length(input); 
len = floor(L/2);
output = zeros(1,L);
stop=L; %Variavel de apoio para a função de calculo da threshold.
if log2(L)==floor(log2(L)) %Faz o calculo de niveis maximos possiveis na decomposição de um vetor.
    l=log2(L);
else
    l=floor(log2(L/2));
end
if n~= 0 %Seta o nivel se ele foi passado no argumento da função.
  if n<l
    l=n;
  end
end
lev=l;
val=ones(1,l);
L=length(val);
while (l~=0) %Loop que ira fazer a transformada e mandar o vetor para fazer a threshold.
    for i = 1:len
       sum =  (input(2*i-1) + input(i * 2))/sqrt(2);
       diff = (input(2*i-1) - input(i * 2))/sqrt(2);
       output(i) = sum;
       output(len+i) = diff;
    end
    input = output(1:len*2);
    val(L-l+1)=len;
    len = floor(len/2);
    l = l-1;
    soma=soma+val(L-l);
    [output,stop] = hthreshold(output,val(L-l),soma,stop,type);
end
end