% Program to design a Digital FIR filter using Kaiser-Bessel window as
%   Pass-band : 150 - 250 Hz
%   Transition-width : 50 Hz
%   Pass-band ripple : 0.1 dB
%   Stop-band atteneuation : 60 dB
%   Sampling Frequency : 1 kHz
clc; clear all;

Fpass = 150; Fstop = 250; Tw = 50;
Ap = 0.1; As = 60; Fs = 1000;
Fn = Fs/2; % Nyquist Frequency

del_P = (10^(0.05*Ap) - 1 )/ (10^(0.05*Ap) +1);
del_S = 10^(-0.05*As);

alpha = -20*log(min(del_P,del_S)); % stopband attenuation dBs

if alpha > 50
    beta = 0.1102*(alpha-8.7);
elseif alpha < 21
    beta = 0;
else
    beta = 0.5842*(alpha-21)^0.4 + 0.07886*(alpha-21);    
end

delta_w = 2*pi*Tw/Fs; % smallest transition width

if alpha > 21
    N = ceil((alpha-7.95)/(2.285*delta_w));
else
    N = ceil(5.79/delta_w); % filter order
end
        
Kaiser_window = kaiser(N,beta);
wvtool(Kaiser_window)

FIR_Filter = fir1(N-1,[Fpass/Fn Fstop/Fn],'bandpass',Kaiser_window,'noscale');
%                    Normalised Frequencies

fvtool(FIR_Filter,'Fs',Fs,'Color','White'), grid on, grid minor