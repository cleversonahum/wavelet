function [vec] = sthreshold(vec)
l=length(vec);
t=sqrt(2*var(vec)*log(l)/l);
for i=1:l
    if vec(i)<=t
        vec(i)=0.0;
    else
        vec(i)=vec(i)-t;
    end
end
end
