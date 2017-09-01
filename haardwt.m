function [ output ] = haardwt( input,n )
%HAARDWT Summary of this function goes here
%   Detailed explanation goes here
% L = length(input);
% output = input;
% while L>=1
%     for i = 1:(L/2)
%         output(i) = (input(2*i-1)+input(2*i))/sqrt(2);
%         output((L/2)+i) = (input(2*i-1)-input(2*i))/sqrt(2);
%     end
%     input = output;
%     L = L/2;
% end
%
if ~exist('n','var')
  n=0;
end
L = length(input);
len = floor(L/2);
output = zeros(1,L);
[l] = level(input);
if n~= 0
  if n<l
    l=n;
  end
end
while (l~=0)
    for i = 1:len
       sum =  (input(2*i-1) + input(i * 2))/sqrt(2);
       diff = (input(2*i-1) - input(i * 2))/sqrt(2);
       output(i) = sum;
       output(len+i) = diff;
    end
    input = output(1:len*2);
    len = floor(len/2);
    l = l-1;
end
end
