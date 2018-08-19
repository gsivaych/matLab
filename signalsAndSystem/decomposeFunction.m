% Program to decompose x(n) = u(n)-u(n-10) into its even and odd components
clc; clear all;

figure('Name','Decomposing a function','NumberTitle','off','Color','w')

% u(n) UNIT Step Function
n = -20:0.001:20;
u = zeros(size(n));
u (n==0) = 0.5;
u (n > 0) = 1;

% subplot(4,4,1);
% plot(n,u,'b'),grid on, grid minor
% title('u(n)')

ns = -20:2:20;
us = zeros(size(ns));
us (ns==0) = 0.5;
us (ns > 0) = 1;

% subplot(4,4,2);
% stem(ns,us,'r'),grid on, grid minor

% u(n-10) Unit Step function delayed 10 sec.
n10 = n;
u10 = zeros(size(n10));
u10 (n10==10) = 0.5;
u10 (n10 > 10) = 1;

% subplot(4,4,3);
% plot(n10,u10,'b'),grid on, grid minor
% title('u(n-10)')

n10s = ns;
u10s = zeros(size(n10s));
u10s (n10s == 10) = 0.5;
u10s (n10s > 10) = 1;

% subplot(4,4,4);
% stem(n10s,u10s,'r'),grid on, grid minor

% x(n) = u(n)-u(n-10)
x = u - u10;
% subplot(2,2,1);
% plot(n,x,'b'),grid on, grid minor
% title('u(n) - u(n-10)')

xs = us - u10s;
% subplot(2,2,2);
% stem(ns,xs,'r'),grid on, grid minor

% x(-n) = u(-n)-u(10-n)
x = u - u10;
% subplot(2,2,3);
% plot(-n,x,'b'),grid on, grid minor
% title('u(-n) - u(10-n)')

xs = us - u10s;
% subplot(2,2,4);
% stem(-ns,xs,'r'),grid on, grid minor

% decomposing
% feven = f(n) + f(-n) / 2 
% fodd  = f(n) - f(-n) / 2

feven (n>-10)= 1;
feven (n==0) = 2;
feven (n>10) = 0;
subplot(2,2,1);
plot(n,feven,'b'),grid on, grid minor
title('Even part')
ylabel('Amplitude')

fevenS (ns>-10)= 1;
fevenS (ns==0) = 1;
fevenS (ns>10) = 0;
subplot(2,2,3);
stem(ns,fevenS,'r'),grid on, grid minor


fodd (n>-10)= -1;
fodd (n==0) =  0;
fodd (n>0)  =  1;
fodd (n>10) =  0;
subplot(2,2,2);
plot(n,fodd,'b'),grid on, grid minor
title('Odd part')

foddS (ns>-10)= -1;
foddS (ns==0) =  0;
foddS (ns>0)  =  1;
foddS (ns>10) =  0;
subplot(2,2,4);
stem(ns,foddS,'r'),grid on, grid minor
xlabel('Time')

print('-clipboard','-dbitmap')