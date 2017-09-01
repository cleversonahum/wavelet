function [inverse] = invhaardwt(in,val,lev)
len = val(lev);
inverse = in;
while(lev~=0)
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