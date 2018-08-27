% Z-Transform of x(n) = .5^n u(n) + 2^n u(n)
clc; clear all

syms z n;

%poles
a = [1,-2.5,1];

%zeros
b = [2,-2.5,0];

y = zeros(1,length(a)-1);

for n = 0 : length(a)-1
    y = y + a(n+1).*z^(-n);
end

y1 = zeros(1,length(b)-1);

for n = 0 : length(b)-1
    y1 = y1 + b(n+1).*z^(-n);
end

z1 = y1 ./ y;

simplify(z1)

figure('Name','Z-Transform','NumberTitle','off','Color','w')
zplane(b,a)
title('Poles and zeros of system x(n) = .5^n u(n) + 2^n u(n)')
print('-clipboard','-dbitmap')