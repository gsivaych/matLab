%% Program for low-pass FIR digital filter using window function, specs as..

clc; clear all;

Fpass = 1.5e3; % kHz, passband edge frequency
Tw = 0.5e3; % kHz, transition width
Fstop = Fpass + Tw; Fs = 8e3; % sampling freq.
As = 20; % dB, stop band atteneuation
Fn = Fs/2; % Nyquist Freq.

N = ceil((As*Fs)/(22*Tw)); % Filter Order

w = hamming(N); %% Required Signal Processing Toolbox
wvtool(w)

% Fpass/Fn = Normalised Passband edge freq.
FIRfilter = fir1(N-1,Fpass/Fn,'low',w);
fvtool(FIRfilter,'Fs',Fs)