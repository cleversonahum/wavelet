function [vec,stop] = hthreshold(vec,val,soma,stop)
l=length(vec);
sup = ones(1,val);
k=1;
for j=l-soma+1:stop
    sup(k)=vec(j);
    k=k+1;
end
t=sqrt(2*var(sup)*log(l)/l);
for i= l-soma+1:stop
    if vec(i)<=t
        vec(i)=0.0;
    end
end
stop=l-soma;
end
