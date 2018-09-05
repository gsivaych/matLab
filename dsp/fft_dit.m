% DIT : Decimation in Time
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

% Separate even and odd parts
seqEven = []; seqOdd = [];
for col = 1:n
    if(mod(col-1,2)==0)
        seqEven = [seqEven seq(col)];
    else
        seqOdd = [seqOdd seq(col)];
    end
end

% X(k) = DFT(N/2,even) + [twiddleFactor(W(k,N))]*DFT(N/2,odd)
dft = zeros(1,n);
for k = 0:n-1
    evenSum = 0; oddSum = 0;
    twiddleFactor = exp(-j*2*pi*k/n);
    for n_ = 0:(n/2)-1
        evenSum = evenSum + seqEven(n_+1)*exp(-j*2*pi*k*n_*2/n);
        oddSum = oddSum + seqOdd(n_+1)*exp(-j*2*pi*k*n_*2/n);
    end
    dft(k+1) = evenSum + twiddleFactor*oddSum;
end

% Plots
figure('Name','DFT/FFT : Decimation in Time','NumberTitle','off','Color','w')
subplot(2,1,1)
stem(0:n-1,seq,'b'), grid on, grid minor
title('Seq.')
xlabel('Sample no.')
ylabel('Amplitude')

subplot(2,1,2)
stem(0:n-1,real(dft),'r'), grid on, grid minor
title('DFT/FFT : DIT')
xlabel('Sample no.')
ylabel('Amplitude')

dft