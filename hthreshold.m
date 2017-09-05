function [vec,stop] = hthreshold(vec,val,soma,stop)
l=length(vec);
sup = ones(1,val);
k=1;
for j=l-soma+1:stop
    sup(k)=vec(j);
    k=k+1;
end
t=sqrt(2*var(sup)*log(length(sup)))/0.6745;
for i= l-soma+1:stop
    if abs(vec(i))<=t
        vec(i)=0.0;
    else
        vec(i)=vec(i)-t;
    end
end
stop=l-soma;
end
