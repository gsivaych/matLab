% FFT : Divide and Conquer Algorithm
clc; clear;
%   Decreases `(n^2)/2 - 3n` multiplications and `(n^2)/2 - 3n` addition operation
%       Considering `n` additional multiplications by twiddle factors.

seq = input('Enter the seq. : ');
len = length(seq);

% take n even and >= len : so  we can have n/2 rows
if(mod(len,2) == 0)
    n = len;
else
    n = len+1;
end

% Required padding : atmost one zero
seq = [seq,zeros(1,n-len)];

% column wise read
columnMat = zeros(2,2);
for row = 1:n/2
    col = 1;
    columnMat(row,col) = seq(row);
end
for row = 1:n/2
    col = 2;
    columnMat(row,col) = seq(row+(n/2));
end

% DFT row wise
for row = 1:n/2
    for col = 1:2
        tempSeq(col) = columnMat(row,col);
    end
    tempDft = zeros(1,2);
    for k=0:1
        for n_=0:1
            tempDft(k+1) = tempDft(k+1) + tempSeq(n_+1)*exp(-j*2*pi*n_*k/2);
        end
    end
    DFT1(row,:) = tempDft;
end

% Generating twiddle matrix
for k = 0:(n/2)-1
    for l = 0:1
        twiddleMat(k+1,l+1) = exp(-j*2*pi*k*l/n);
    end
end

columnMat = DFT1.*twiddleMat;

% DFT column wise
for col = 1:2
    for row = 1:n/2
        tempSeq(row) = columnMat(row,col);
    end
    tempDft = zeros(1,n/2);
    for k=0:(n/2)-1
        for n_=0:(n/2)-1
            tempDft(k+1) = tempDft(k+1) + tempSeq(n_+1)*exp(-j*2*pi*n_*k*2/n);
        end
    end
    DFT2(:,col) = tempDft;
end

% row wise write
FFT = [];
for row = 1:n/2
    tempRow = DFT2(row,1:2);
    FFT = [FFT tempRow];
end

% Plots
s = 0:len-1;
figure('Name','FFT :Divide and Conquer','NumberTitle','off','Color','w')
subplot(2,1,1)
stem(s,seq,'b'), grid on, grid minor
title('Input Seq.')
xlabel('Sample')
ylabel('Amplitude')

subplot(2,1,2)
stem(s,real(FFT),'r'), grid on, grid minor
title('DFT/FFT')
xlabel('Sample')
ylabel('Amplitude')

FFT