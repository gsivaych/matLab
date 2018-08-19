% Program to do DFT of input sequence and then IDFT
clc
clear

% DFT
seq = input('Enter the sequence : ');
N = length(seq);
dft = zeros(1,N);

for k=0:N-1
    for n=0:N-1
        dft(k+1) = dft(k+1) + seq(n+1)*exp(-j*2*pi*n*k/N);
    end
end

mag = abs(dft);
phase = angle(dft);

t = 0:N-1;
figure('Name','DFT & IDFT','NumberTitle','off','Color','w')
subplot(2,2,1)
stem(t,mag,'b'), grid on, grid minor
title('Magnitude of DFT of seq.')
xlabel('Time')
ylabel('Amplitude')

subplot(2,2,2)
stem(t,phase,'b'), grid on, grid minor
title('Phase of DFT of seq.')
xlabel('Time')
ylabel('Phase')


% IDFT
seq2 = dft;
idft = zeros(1,N);

for n=0:N-1
    for k=0:N-1
        idft(n+1) = idft(n+1) + seq2(k+1)*exp(j*2*pi*n*k/N);
    end
    idft(n+1) = idft(n+1)/N;
end


mag_idft = abs(idft);
subplot(2,2,3)
stem(t,mag_idft,'r'), grid on, grid minor
title('Magnitude of IDFT of DFT of seq.')
xlabel('Time')
ylabel('Amplitude')

subplot(2,2,4)
stem(t,seq,'b'), grid on, grid minor
title('Input seq.')
xlabel('Time')
ylabel('Amplitude')