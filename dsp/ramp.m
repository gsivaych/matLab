% Program to generate signal of function : x[n] = 2n , -3 <= n <= 3 
clc; clear all;

x = -3:0.0001:3; % Domain, Sampled 0.00001 apart
y = 2.*x; % Point wise multiplication
figure('Name','Function Generation','NumberTitle','off','Color','w')
subplot(2,1,1);
plot(x,y,'b'), grid on, grid minor % continuous line 2D plot
title('Continuous')
xlabel('Time')
ylabel('Amplitude')

p = -3:0.1:3; % Domain, Sampled 0.1 apart
q = 2.*p;
subplot(2,1,2);
stem(p,q,'r'), grid on, grid minor % Discrete data 2D plot
title('Discrete')
xlabel('Time')
ylabel('Amplitude')