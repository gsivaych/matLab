% Program to generate Sine wave signal of given amplitude, frequency and phase change
clc; clear all;

% Inputs :
amp = input('Amplitude : ');
freq = input('Frequency : ');
phase = input('Phase Change (radians) : ');

t = 0:0.0001:5/freq; % Time, Sampled after 0.0001 sec. for 5 time periods
f = amp*sin(2*pi*freq*t + phase); % Sine function, input : radians
figure('Name','Sine Wave','NumberTitle','off','Color','w')
subplot(2,1,1);
plot(t,f,'b'), grid on, grid minor % continuous line 2D plot
title('Continuous')
xlabel('Time')
ylabel('Amplitude')

t = 0:0.1/freq:5/freq; % Time, Sampled 10 times in a time period for 5 time periods
f = amp*sin(2*pi*freq*t + phase); % Sine function, input : radians
subplot(2,1,2);
stem(t,f,'r'), grid on, grid minor % discrete data 2D plot
title('Discrete')
xlabel('Time')
ylabel('Amplitude')

print('-clipboard','-dbitmap')