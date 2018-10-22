% Program to generate signal of function : x[n] = 2n , -3 <= n <= 3 zero otherwise
clc; clear all;

x = -5:0.0001:5; % Domain, Sampled 0.00001 apart
y = 2.*x; % Point wise multiplication
y (x>3) = 0;
y (x<-3) = 0;

figure('Name','Function Generation','NumberTitle','off','Color','w')
subplot(2,1,1);
plot(x,y,'b'), grid on, grid minor % continuous line 2D plot
title('Continuous')
xlabel('Time')
ylabel('Amplitude')

p = -5:0.2:5; % Domain, Sampled 0.2 sec. apart
q = 2.*p;
q (p>3) = 0;
q (p<-3) = 0;

subplot(2,1,2);
stem(p,q,'r'), grid on, grid minor % Discrete data 2D plot
title('Discrete')
xlabel('Time')
ylabel('Amplitude')

print('-clipboard','-dbitmap')