function [j] = level (vec)
l=length(vec);
x=true;
j=1;
while (x)
  if 2^j>l
    j = j - 1;
    x=false;
  else
    j = j+1;
  end
end
