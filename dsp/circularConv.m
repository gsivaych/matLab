% Program to do Circular Convoution of two given seq.s
clc; clear;

xn = input('x[n] : ');
hn = input('h[n] : ');

m = length(xn);
n = length(hn);
p = max([m,n]);

% Zero padding
if p==m
    x = xn;
    h = [hn,zeros(1,p-n)];
end
if p==n
    h = hn;
    x = [xn,zeros(1,p-m)];
end

% Circular Convolution
C = zeros(1,p);
for i = 1:p
    for j = 1:p
        k = mod(i-j,p); % signed remainder after division
        C(i) = C(i) + x(j)*h(k+1);
    end
end

% Plots
figure('Name','Circular Convolution','NumberTitle','off','Color','w')
subplot(2,2,1)
stem(1:m,xn,'b'), grid on, grid minor
title('x[n]')
xlabel('Samples')
ylabel('Amplitude')

subplot(2,2,2)
stem(1:n,hn,'b'), grid on, grid minor
title('h[n]')
xlabel('Samples')
ylabel('Amplitude')

subplot(2,2,3)
stem(1:p,C,'r'), grid on, grid minor
title('Circular Conv.')
xlabel('Samples')
ylabel('Amplitude')

print('-clipboard','-dbitmap')