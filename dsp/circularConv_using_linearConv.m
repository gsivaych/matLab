% Program to do Circular conv. using Linear conv.
clc; clear;

xn = input('x[n] : ');
hn = input('h[n] : ');

m = length(xn);
n = length(hn);
p = max([m,n]);
q = m+n-1;

% Lin. Conv
lin_conv = conv(xn,hn);

circ_conv = zeros(1,p);
% Overlapping to get Circ Conv.
for i = 1:q-p
    circ_conv(i) = lin_conv(i) + lin_conv(i+p);
end
% same as it..
for j = q-p+1:p
    circ_conv(j) = lin_conv(j);
end

% Plots
figure('Name','Circular Convolution using Linear Convolution','NumberTitle','off','Color','w')
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
stem(1:p,circ_conv,'r'), grid on, grid minor
title('Circular Conv.')
xlabel('Samples')
ylabel('Amplitude')

print('-clipboard','-dbitmap')