% Program for linear convolution of two input sequences : matrix method
clc; clear all;

% Inputs x[n] and h[n]
xn = input('x[n] : ');
hn = input('h[n] : ');

% Plot x[n]
a = length(xn);
t1 = 0:a-1;
figure('Name','Linear Convolution','NumberTitle','off','Color','w')
subplot(3,1,1)
stem(t1,xn,'b'),grid on, grid minor
title('Seq. 1')
xlabel('time')
ylabel('Amplitude')

% Plot h[n]
b = length(hn);
t2 = 0:b-1;
subplot(3,1,2)
stem(t2,hn,'r'),grid on, grid minor
title('Seq. 2')
xlabel('time')
ylabel('Amplitude')

% matrix method
mat = zeros(3,2);
for i = 1:b
    for j = 1:a
        mat(i,j) = xn(j)*hn(i);
    end
end

% len(conv_res) = len(Seq1) + len(seq2) -1
c = a+b-1;
t3 = 0:c-1;
convl = zeros(1,c);

% extracting diagonals
mat2 = flip(mat,2); % now we can use diag()
for i=1:c
    convl(i) = sum(diag(mat2,i-b));
end
convl = flip(convl);

subplot(3,1,3)
stem(t3,convl,'g'),grid on,  grid minor
title('Convolution')
xlabel('time')
ylabel('Amplitude')

print('-clipboard','-dbitmap')