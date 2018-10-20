%  Program to convolute x[n] with h[n] where x[n] = h[n] = u(n)-u(n-6) 
clc; clear all

% u(n) UNIT Step Function
n = -5:0.01:15;
u = zeros(size(n));
u (n > 0) = 1;

figure('Name','Convolution','NumberTitle','off','Color','w')
subplot(2,2,1)
plot(n,u,'b'),grid on, grid minor
title('u(n)')
xlabel('Time')
ylabel('Amplitude')

% u(n-6) Unit Step function delayed 6 sec.
u6 = zeros(size(n));
u6 (n > 6) = 1;

subplot(2,2,2)
plot(n,u6,'r'),grid on, grid minor
title('u(n-6)')
xlabel('Time')
ylabel('Amplitude')

% x(n) = u(n) - u(n-6)
xn = u - u6;
hn = xn;
subplot(2,2,3)
plot(n,xn),grid on, grid minor
title('x[n] = h[n]')
xlabel('Time')
ylabel('Amplitude')

p = length(xn);
q = length(hn);
k = p+q-1;
N = linspace(-5,15,k);
conv = zeros(1,k);
for i=1:k
    for j=1:p
        if (i-j+1 < q && i-j+1 > 0)
            conv(i) = conv(i) + xn(j)*hn(i-j+1);
        end
    end
end

%conv = conv(xn,hn);

subplot(2,2,4)
plot(N,conv,'b'),grid on, grid minor
title('x[n]*h[n]')
xlabel('Time')
ylabel('Amplitude')

print('-clipboard','-dbitmap')