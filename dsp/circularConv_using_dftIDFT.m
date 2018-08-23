% Program to do Circular Conv. using DFT & IDFT
clc; clear;

%   Circular Conv. = idft (  dft(x[n])  .*  dft(h[n])  )

xn = input('x[n] : ');
hn = input('h[n] : ');

m = length(xn);
n = length(hn);
p = max([m,n]);

% DFT of both input seq.
dft_xn = fft(xn,p);
dft_hn = fft(hn,p);

% Pointwise multiplication
M = dft_xn.*dft_hn;

% IDFT of results
idft_M = ifft(M);

% Plots
figure('Name','Circular Convolution using DFT & IDFT','NumberTitle','off','Color','w')
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
stem(1:p,idft_M,'r'), grid on, grid minor
title('Circular Conv.')
xlabel('Time')
ylabel('Amplitude')

print('-clipboard','-dbitmap')