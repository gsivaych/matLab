% FFT DIT : Split Radix [ Recursively turn DFT(n) -> DFT(n/2) & 2 DFT(n/4) ]
clc; clear all;
% Only for mod(n,4)==0

seq = input('Enter seq. : ');
len = length(seq);

% up & nearest divisible by 4
if(mod(len,4)==0)
    n=len;
else
    n = len - mod(len,4) + 4;
end

% appending zeros : atmost 3
seq = [seq zeros(1,n-len)];

FFT = zeros(1,n);
for k = 1:n
    FFT(k) = splitDFT(seq,k-1,n);
end

% Plots
figure('Name','FFT DIT Split Radix','NumberTitle','off','Color','w')
subplot(2,1,1)
stem(0:n-1,seq,'b'), grid on, grid minor
title('Seq.')
xlabel('Sample no.')
ylabel('Amplitude')

subplot(2,1,2)
stem(0:n-1,FFT,'r'), grid on, grid minor
title('FFT')
xlabel('Sample no.')
ylabel('Amplitude')


% Function Definitions
function XK = splitDFT(inSeq,K,N)
    inSeq = reOrder(inSeq);
    twiddle_k = exp(-j*2*pi*K/N);
    twiddle_3k = exp(-j*2*pi*3*K/N);
    XK = DFT(inSeq(1:N/2),K,N/2) + twiddle_k*DFT(inSeq(N/2+1:3*N/4),K,N/4) + twiddle_3k*DFT(inSeq(3*N/4+1:N),K,N/4);
 end

function tempDft = DFT(tempSeq,k_,N_)
    if mod(length(tempSeq),4)~=0
        m = length(tempSeq);
        tempDft = 0;
        for n_ = 0:m-1
            tempDft = tempDft + tempSeq(n_+1)*exp(-j*2*pi*k_*n_/m);
        end
    else
        tempDft = splitDFT(tempSeq,k_,N_);
    end
end

function orderedSeq = reOrder(inputSeq)
    n = length(inputSeq);
%%%%%%%%%------if n = 2^p
%    orderedSeq = bitrevorder(inputSeq);
%    orderedSeq(1:n/2) = bitrevorder(orderedSeq(1:n/2));
%%%%%%%%%------would have worked.
    evenPart = inputSeq(1:2:n);
    oddPart = inputSeq(2:2:n);
    evenOfOdd = oddPart(1:2:n/2);
    oddOfOdd = oddPart(2:2:n/2);
    orderedSeq = [evenPart evenOfOdd oddOfOdd];
end