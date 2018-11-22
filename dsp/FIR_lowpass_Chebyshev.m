% Program to design a Chebyshev Type-1 analog,digital high pass filter as
%   Pass-band Frequency: 1.3 kHz
%   Stop-band Frequency: 1.55 kHz
%   i.e. Transition-width : 0.25 kHz
%   Pass-band ripple : 0.23 dB
%   Stop-band atteneuation : 47 dB
%   Sampling Frequency : 7.8 kHz
clc; clear all;

Fpass = 1.3e3; Fstop = 1.55e3; Tw = 0.25e3;
Ap = 0.23; As = 47; Fs = 7.8e3;

del_P = 10^(-Ap/20);
del_S = 10^(-As/20);

ohm_p = 2*tan(2*Fpass/Fs);
ohm_s = 2*tan(2*Fstop/Fs);

n = acosh((((1/del_S^2)-1)/((1/del_P^2)-1))^0.5)/acosh(ohm_s/ohm_p);
N = ceil(n);

ohm_c = ohm_p; % epsilon = 1

% analog filter
[A_zeros,A_poles,A_gain] = cheby1(N,Ap,ohm_c,'low');

A_tF = zp2tf(A_zeros,A_poles,A_gain); % transfer function

fvtool(A_tF);

% digital filter : bilinear transformation
[D_zeros,D_poles] = bilinear(A_zeros,A_poles,A_gain,0.01);

D_tF = zp2tf(D_zeros,D_poles,A_gain);

fvtool(D_tF);
