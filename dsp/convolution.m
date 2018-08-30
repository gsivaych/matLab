%  Program to convolute x[n] with h[n] 
%       where x[n] = u(n)-u(n-4)
%             h[n] = n*u(n) - 2*(n-4)*u(n-4) + (n-8)*u(n-8)
clc; clear all;

% u(n) UNIT Step Function
n = -5:0.01:15;
u = zeros(size(n));
u (n > 0) = 1;

figure('Name','Convolution','NumberTitle','off','Color','w')
subplot(3,3,1)
plot(n,u,'b'),grid on, grid minor
title('u(n)')
xlabel('Time')
ylabel('Amplitude')

% u(n-4) Unit Step function delayed 4 sec.
u4 = zeros(size(n));
u4 (n > 4) = 1;

subplot(3,3,2)
plot(n,u4,'r'),grid on, grid minor
title('u(n-4)')
xlabel('Time')
ylabel('Amplitude')

% x(n) = u(n) - u(n-4)
xn = u - u4;
subplot(3,3,4)
plot(n,xn),grid on, grid minor
title('x[n]')
xlabel('Time')
ylabel('Amplitude')

% u(n-8) Unit Step function delayed 8 sec.
u8 = zeros(size(n));
u8 (n > 8) = 1;

subplot(3,3,3)
plot(n,u8,'r'),grid on, grid minor
title('u(n-8)')
xlabel('Time')
ylabel('Amplitude')

% h(n) = n*u(n) - 2*(n-4)*u(n-4) + (n-8)*u(n-8)
hn = n.*u - 2*(n-4).*u4 + (n-8).*u8;
subplot(3,3,5)
plot(n,hn),grid on, grid minor
title('h[n]')
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

subplot(3,3,7)
plot(N,conv,'b'),grid on, grid minor
title('x[n]*h[n]')
xlabel('Time')
ylabel('Amplitude')