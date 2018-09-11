%  Radix-2 DIF FFT (only for N = 2^p : p>1 and integer)
clc; clear;

seq = input('Enter seq. : ');
len = length(seq);
p = ceil(log2(len)); % ceil() rounds up to nearest integer

% appending zeros
disp('Zeros appended (if required) : eligible for len(seq.) = 2^p');
seq = [seq, zeros(2^p - len)]
FFTseq = seq;

for stage = p:-1:1 % stages got reversed
    first = 1; second = 1+2^(stage-1); % in reference to butterfly
    n = 0;
    while(n <= (2^(stage-1))-1 && second <= 2^p)
        disp(first)
        disp(second)
        W = exp(-j*2*pi*n/(2^stage));
        addn = FFTseq(first) + FFTseq(second); % No multiplication by twiddle factor
        subtn = (FFTseq(first) - FFTseq(second))*W; % First negation then twiddle factor
        FFTseq(first) = addn;
        FFTseq(second) = subtn;
        first = first+1; second = second+1;
        n = n+1;
        if(rem(second,2^stage)==1)  % switch to next set of butterflies
            first = first + 2^(stage-1);
            second = second + 2^(stage-1);
            n = 0;
        end
    end
end

% Bit reversed order
fftBR = bitrevorder(FFTseq)

% Plots
figure('Name','FFT Radix-2 DIF','NumberTitle','off','Color','w')
subplot(2,1,1)
stem(0:2^p-1,seq,'b'), grid on, grid minor
title('Input Seq.')
xlabel('Sample')
ylabel('Amplitude')

subplot(2,1,2)
stem(0:2^p-1,fftBR,'r'), grid on, grid minor
title('FFT')
xlabel('Sample')
ylabel('Amplitude')