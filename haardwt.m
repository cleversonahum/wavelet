function [ output ] = haardwt( input )
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
L = length(input);
len = floor(L/2);
output = zeros(1,L);
while (true)
    for i = 1:len
       sum =  (input(2*i-1) + input(i * 2))/sqrt(2);
       diff = (input(2*i-1) - input(i * 2))/sqrt(2);
       output(i) = sum;
       output(len+i) = diff;
    end
    if len==1
        return
    end
    input = output(1:len*2);
    len = floor(len/2);
end
end

