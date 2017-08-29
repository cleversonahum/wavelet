function [ output ] = haardwt( input )
%HAARDWT Summary of this function goes here
%   Detailed explanation goes here
L = length(input);
output = input;
while L>=1
    for i = 1:(L/2)
        output(i) = (input(2*i-1)+input(2*i))/sqrt(2);
        output((L/2)+i) = (input(2*i-1)-input(2*i))/sqrt(2);
    end
    input = output;
    L = L/2;
end

end

