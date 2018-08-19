% Program to plot DTFT of a given rectangular pulse
clc; clear all;

%   Discrete Time Fourier Transform
%       F(f) = (integrate from -inf. to +inf. ) f(t) exp (-j 2 pi f t)  dt

% Inputs for rectangular pulse
amp = input('Amplitude : ');
t0 = input('Start Time : ');
T = input('Duration in sec. : ');

n = t0-(T/2):T/10:t0+(3*T/2); % range : 2T
fn = zeros(size(n));
fn (n<t0+T) = amp;
fn (n<t0) = 0;
% Plot rect. pulse
subplot(3,1,1)
stem(n,fn,'b'),grid on, grid minor
title('Input rectangular Pulse')
xlabel('Time')
ylabel('Amplitude')


r = -5:0.1:5; % range we'll be integrating rather than -inf. to +inf.
k = 0;
for f=r
    k = k +1;
    x(k) = amp*trapz(n,exp(-j*2*pi*f*n));
end

subplot(3,1,2)
stem(r,x,'r'),grid on, grid minor
title('Magnitude of Spectrum')
xlabel('Freq.')
ylabel('Amplitude')

subplot(3,1,3)
stem(r,abs(angle(x)),'r'),grid on, grid minor
title('Phase of Spectrum')
xlabel('Freq.')
ylabel('Radian')
print('-clipboard','-dbitmap')