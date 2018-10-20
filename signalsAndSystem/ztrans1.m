% Z-Transform of Y(n) = 0.9 Y(n-1) + x(n)

clc;
clear all

syms z n

% calculated ploes and zeros

%poles
a = [1,-0.9];

%zeros
b = [1,0];

y = zeros(1,length(a)-1);

for n = 0 : length(a)-1
    y = y + a(n+1).*z^(-n);
end

y1 = zeros(1,length(b)-1);

for n = 0 : length(b)-1
    y1 = y1 + b(n+1).*z^(-n);
end

z1 = y1 / y;

simplify(z1)

figure('Name','Z-Transform','NumberTitle','off','Color','w')
zplane(b,a)
title('Poles and Zeros from Z transform of system Y(n) = 0.9 Y(n-1) + x(n)')
print('-clipboard','-dbitmap')