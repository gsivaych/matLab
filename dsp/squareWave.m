% Program to generate Square wave signal of given frequency and duty cycle
clc; clear all;

% frequency : 50 Hz
freq = 50;

% duty cycle : 25 percent
duty = 25;
t = 0:0.0001:.1; % Time, Sampled after 0.0001 sec. for 0.1 sec.
f = square(2*pi*freq*t,duty); % Square Wave generator
figure('Name','Square Wave','NumberTitle','off','Color','w')
subplot(3,2,1);
plot(t,f,'b'), grid on, grid minor
title('Duty cycle : 25%')
xlabel('Time')
ylabel('Amplitude')
t2 = 0:0.001:.1; % Time, Sampled after 0.01 sec. for 0.1 sec.
f = square(2*pi*freq*t2,duty); % Square Wave generator
subplot(3,2,2);
stem(t2,f,'r'), grid on, grid minor
title('Duty cycle : 25%')
xlabel('Time')
ylabel('Amplitude')

% duty cycle : 50 percent
duty = 50;
f = square(2*pi*freq*t,duty); % Square Wave generator
subplot(3,2,3);
plot(t,f,'b'), grid on, grid minor
title('Duty cycle : 50%')
xlabel('Time')
ylabel('Amplitude')
t2 = 0:0.001:.1; % Time, Sampled after 0.01 sec. for 0.1 sec.
f = square(2*pi*freq*t2,duty); % Square Wave generator
subplot(3,2,4);
stem(t2,f,'r'), grid on, grid minor
title('Duty cycle : 50%')
xlabel('Time')
ylabel('Amplitude')

% duty cycle : 75 percent
duty = 75;
f = square(2*pi*freq*t,duty); % Square Wave generator
subplot(3,2,5);
plot(t,f,'b'), grid on, grid minor
title('Duty cycle : 75%')
xlabel('Time')
ylabel('Amplitude')
t2 = 0:0.001:.1; % Time, Sampled after 0.01 sec. for 0.1 sec.
f = square(2*pi*freq*t2,duty); % Square Wave generator
subplot(3,2,6);
stem(t2,f,'r'), grid on, grid minor
title('Duty cycle : 75%')
xlabel('Time')
ylabel('Amplitude')

print('-clipboard','-dbitmap')