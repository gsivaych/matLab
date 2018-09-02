% Program to compute 8 pt FFT of input sequence.
clc;
clear all;

% Divide and conquer method
N = 8;
seq = input('Enter the seq. <= 8 samples : ');
l = length(seq);

% zero padding
seq = [seq, zeros(N-l)];

% Read column wise
readMat(:,1) = seq(1:N/2);
readMat(:,2) = seq(N/2+1:N);

% dft row wise (2 pt dfts)
dft1 = [];
for row = 1:N/2
    tempSeq = readMat(row,1:2);
    tempDft = tempSeq*[1,1;1,-1];
    dft1(row,:) = tempDft;
end

twiddleMat = [1,1; 1,0.7071-0.7071i;1,-i;1,-0.7071-0.7071i];

dft1_ = dft1.*twiddleMat;

% dft column wise (4 pt dfts)
for col = 1:2
    tempSeq = dft1_(1:N/2,col);
    tempDft = zeros(1,4);
    for k = 0:(N/2)-1
        for n = 0:(N/2)-1
            tempDft(k+1) = tempDft(k+1) + tempSeq(n+1)*exp(-j*2*pi*k*n*2/N);
        end
    end
    dft2(:,col) = tempDft;
end

% Read row wise
FFT = [];
for row = 1:N/2
    FFT = [FFT,dft2(row,1:2)];
end

% Plots
figure('Name','FFT :Divide and Conquer','NumberTitle','off','Color','w')
subplot(2,1,1)
stem(0:N-1,seq,'b'), grid on, grid minor
title('Input Seq.')
xlabel('Sample')
ylabel('Amplitude')

subplot(2,1,2)
stem(0:N-1,real(FFT),'r'), grid on, grid minor
title('DFT/FFT : Real part')
xlabel('Sample')
ylabel('Amplitude')

FFT