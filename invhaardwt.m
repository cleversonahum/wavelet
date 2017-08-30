function [inverse] = invhaardwt(in)
L = length(in);
len = 1;
inverse = in;
while(true)
    in = inverse(1:len*2);    
    for i=1:len
        c = (in(i) + in(i+len))/sqrt(2);
        d = (in(i) - in(i+len))/sqrt(2);
        inverse(2*i-1) = c;
        inverse(2*i) = d;
    end
    len=len*2;
    if len*2>L
        return
    end
end
end