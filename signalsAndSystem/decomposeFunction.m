% Program to decompose x(n) = u(n)-u(n-10) into its even and odd components
clc; clear all;

% u(n) UNIT Step Function
n = -20:0.001:20;
u = zeros(size(n));
u (n >= 0) = 1;
% discrete : for stem plot
ns = -20:2:20;
us = zeros(size(ns));
us (ns >= 0) = 1;

% u(n-10) Unit Step function delayed 10 sec.
n10 = n;
u10 = zeros(size(n10));
u10 (n10 >= 10) = 1;
% discrete : for stem plot
n10s = ns;
u10s = zeros(size(n10s));
u10s (n10s >= 10) = 1;

% x(n) = u(n)-u(n-10)
x = u - u10;
xs = us - u10s;

% x(-n) = u(-n)-u(10-n)
% x(-n) = flipped horizontally x(n)
xnegN = fliplr(x);
xsnegN = fliplr(xs);

% decomposing
% feven = f(n) + f(-n) / 2 
% fodd  = f(n) - f(-n) / 2

figure('Name','Decomposing a function','NumberTitle','off','Color','w')

feven = (x+xnegN) / 2;
subplot(2,2,1);
plot(n,feven,'b'),grid on, grid minor
title('Even part')
xlabel('Time')
ylabel('Amplitude')

fevenS = (xs+xsnegN) / 2;
subplot(2,2,3);
stem(ns,fevenS,'r'),grid on, grid minor

fodd = (x-xnegN) / 2;
subplot(2,2,2);
plot(n,fodd,'b'),grid on, grid minor
title('Odd part')

foddS = (xs-xsnegN) / 2;
subplot(2,2,4);
stem(ns,foddS,'r'),grid on, grid minor

print('-clipboard','-dbitmap')