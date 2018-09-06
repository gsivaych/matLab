%  Radix-2 DIT FFT (only for N = 2^p : p>1 and integer)
%  Basically `p` times divide and conquer
clc; clear;

seq = input('Enter seq. : ');
len = length(seq);
p = ceil(log2(len)); % ceil() rounds up to nearest integer

% appending zeros
disp('Zeros appended (if required) : eligible for len(seq.) = 2^p');
seq = [seq, zeros(2^p - len)]

% Bit reversed order
seqBR = bitrevorder(seq);

for stage = 1:p
    first = 1; second = 1+2^(stage-1); % in reference to butterfly
    n = 0;
    while(n <= 2^(stage-1)-1 && second <= 2^p)
        W = exp(-j*2*pi*n/(2^stage));
        addn = seqBR(first) + W*seqBR(second);
        subtn = seqBR(first) - W*seqBR(second);
        seqBR(first) = addn;
        seqBR(second) = subtn;
        first = first+1; second = second+1;
        n = n+1;
        if(rem(second,2^stage)==1)  % switch to next butterfly
            first = first + 2^(stage-1);
            second = second + 2^(stage-1);
            n = 0;
        end
    end
end
fft = seqBR

% Plots
figure('Name','FFT Radix-2 DIT','NumberTitle','off','Color','w')
subplot(2,1,1)
stem(0:2^p-1,seq,'b'), grid on, grid minor
title('Input Seq.')
xlabel('Sample')
ylabel('Amplitude')

subplot(2,1,2)
stem(0:2^p-1,fft,'r'), grid on, grid minor
title('FFT')
xlabel('Sample')
ylabel('Amplitude')