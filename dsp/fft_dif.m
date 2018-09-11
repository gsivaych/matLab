% DIF : Decimation in Frequency
clc; clear;
% Reduces (n^2)/2 - n multiplications and (n^2)/2 - 2n additions.

seq = input('Enter Seq. : ');
len = length(seq);

% n : required even
if(mod(len,2) == 0)
    n = len;
else
    n = len+1;
    disp('**Odd no of samples : zero padding to make even.');
end

% Required padding : atmost one zero
seq = [seq,zeros(1,n-len)]

firstHalf = seq(1:n/2);
secondHalf = seq(n/2+1:n);

% X(k) = DFT(N/2,firstHalf) + [twiddleFactor(W(kN/2,N))]*DFT(N/2,secondHalf)
dft = zeros(1,n);
for k = 0:n-1
    firstSum = 0; secondSum = 0;
    twiddleFactor = exp(-j*2*pi*k/2);
    for n_ = 0:(n/2)-1
        firstSum = firstSum + firstHalf(n_+1)*exp(-j*2*pi*k*n_/n);
        secondSum = secondSum + secondHalf(n_+1)*exp(-j*2*pi*k*n_/n);
    end
    dft(k+1) = firstSum + twiddleFactor*secondSum;
end

% Plots
figure('Name','DFT/FFT : Decimation in Frequency','NumberTitle','off','Color','w')
subplot(2,1,1)
stem(0:n-1,seq,'b'), grid on, grid minor
title('Seq.')
xlabel('Sample no.')
ylabel('Amplitude')

subplot(2,1,2)
stem(0:n-1,real(dft),'r'), grid on, grid minor
title('DFT/FFT : DIF')
xlabel('Sample no.')
ylabel('Amplitude')

dft