%% Program to design a Butterworth analog,digital high pass filter as
%   Pass-band Frequency: 2 kHz
%   Stop-band Frequency: 3.5 kHz
%   i.e. Transition-width : 1.5 kHz
%   Pass-band ripple : 0.2 dB
%   Stop-band atteneuation : 40 dB
%   Sampling Frequency : 8 kHz

clc; clear all;

Fpass = 2e3; Fstop = 3.5e3; Tw = 1.5e3;
Ap = 0.2; As = 40; Fs = 8e3;

del_P = 10^(-Ap/20);
del_S = 10^(-As/20);

ohm_p = 2*Fpass/Fs;
ohm_s = 2*Fstop/Fs;

n = 0.5*log10(((1/del_S^2)-1)/((1/del_P^2)-1))/log10(ohm_s/ohm_p);
N = ceil(n);

ohm_c = ohm_p/((1/del_P^2)-1)^(1/(2*N));

% analog filter : Requires DSP System Toolbox or Signal Processing Toolbox
[A_zeros,A_poles,A_gain] = butter(N,ohm_c,'high'); 

A_tF = zp2tf(A_zeros,A_poles,A_gain); % transfer function

fvtool(A_tF);

% digital filter : impulse invariance conversion
[D_zeros,D_poles] = impinvar(A_zeros,A_poles);

D_tF = zp2tf(D_zeros',D_poles',A_gain); % transfer function

fvtool(D_tF);