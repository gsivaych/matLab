% Program to generate signal of
%   u(2t+1) : unit step 1 sec left shift, [ 2x ] downSampled,compressesd,speedUp
%   r(t/4 - 1) : unit ramp 1 sec right shift, [ 0.25x ] upSampled,spreaded,slowedDown
%   sine(1.5t) : sine function compressed [1.5x]
clc, clear all;

t = -10:0.001:10;
ts = -10:10;

% Unit fn.
u = zeros(size(t));
u (t>=-1/2) = 1;

% Ramp fn.
r = (t/4)-1;
r ((t/4)-1<0) = 0;

% Sine fn.
s = sin(1.5*t);

figure('Name','Scaling','NumberTitle','off','Color','w')
subplot(3,1,1)
plot(t,u,'b'), grid on, grid minor
title('u(2t+1)')
xlabel('Time')
ylabel('Amplitude')

subplot(3,1,2)
plot(t,r,'b'), grid on, grid minor
title('r(t/4 - 1)')
xlabel('Time')
ylabel('Amplitude')

subplot(3,1,3)
plot(t,s,'b'), grid on, grid minor
title('sine(1.5t)')
xlabel('Time')
ylabel('Amplitude')

print('-clipboard','-dbitmap')