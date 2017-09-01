function [j] = level (vec)
l=length(vec);
x=true;
j=1;
while (x)
  if 2^j>l
    j--;
    x=false;
  else
    j++;
  end
end
