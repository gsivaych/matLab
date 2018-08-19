% Program to generate signal of unit impulse function / Delta Dirac Function
clc; clear all;

% DELTA DIRAC FUNCTION / UNIT IMPULSE FUNCTION - (infinite for 0, 0 elsewhere)
%   delta[x] = infinity     x = 0
%            = 0            x < 0 & x > 0
% also constrained to satisfy 
% integration minus-infinity to plus-infinity delta(x).dx = 1

x = -2:0.0001:2;
f = zeros(size(x));
f(x == 0) = 1;

figure('Name','Unit Impulse','NumberTitle','off','Color','w')
subplot(2,1,1);
plot(x,f,'b'),grid on, grid minor
title('Continuous')
xlabel('Time')
ylabel('Amplitude')

y = -2:2;
fn = [0, 0, 1, 0 ,0];
subplot(2,1,2);
stem(y,fn,'r'),grid on, grid minor
title('Discrete')
xlabel('Time')
ylabel('Amplitude')

print('-clipboard','-dbitmap')

% << + >>
% Introduced by the physicist PAUL DIRAC for modelling the density of an
% idealized point mass or point charge, as a function that is equal to zero
% everywhere except for zero and whose integral over the entire real line
% is equal to 1.