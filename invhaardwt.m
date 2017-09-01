function [inverse] = invhaardwt(in,n)
if ~exist('n','var')
  n=0;
end
L = length(in);
len = 1;
inverse = in;
l = level(in);
if n!= 0
  if n<l
    l=n;
  end
end
while(l!=0)
    in = inverse(1:len*2);    
    for i=1:len
        c = (in(i) + in(i+len))/sqrt(2);
        d = (in(i) - in(i+len))/sqrt(2);
        inverse(2*i-1) = c;
        inverse(2*i) = d;
    end
    len=len*2;
    l--;
end
end
