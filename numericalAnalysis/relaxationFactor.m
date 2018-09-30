% Program to plot Relaxation factor (0 < w < 2) v/s Iterations Required for SOR method
clc; clear all;

% Inputs
disp('For `Ax=B` system of equations.')
A = input('Matrix A : ');
B = input('Matrix B : ');
x0 = input('Initial guess x0 : ');
tolerance = input('Tolerance required : ');
maxIte = input('Maximum Iterations : ');
del_w = input('Delta relaxation factor : ');

w = del_w:del_w:2-del_w;
w_ = w(1);
N = size(A,1);
iteCount = zeros(1,length(w)-1);
for testCount = 1:length(w)
    fprintf('\nTest case %d',testCount);
    x0_ = x0;
    if size(B,1) ~= size(A,1) || size(x0_,1) ~= size(A,1)
        disp('Invalid Inputs B and/or x0, please provide as `nx1` matrix.')
        break;
    else
        ite = 1;
        x=zeros(size(x0_));
        gotSoln=false;
        while ite <= maxIte
            for row = 1:N
                x(row) = (1-w_)*x0_(row) + w_*(B(row) - A(row,1:row-1)*x(1:row-1) - A(row,row+1:N)*x0_(row+1:N))/A(row,row);
            end
            if abs(x-x0_) < tolerance
                gotSoln=true;
                fprintf('\nConverged, Solution of system is :');
                x
                fprintf('Iterations Required : %d\n',ite);
                break;
            else
                ite = ite + 1;
                x0_ = x;
            end
        end
    end
    if ~gotSoln
        fprintf('\nDid not Converge\n');
        fprintf('Iterations recahed : %d\n',maxIte);
    end
    w_ = w_ + del_w;
    iteCount(testCount) = ite;
end

% Plot
if del_w < 0.1
    figure('Name','Relaxation factor','NumberTitle','off','Color','w')
    plot(w,iteCount,'b');
    [val_min, arg_min] = min(iteCount);
    [val_max, arg_max] = max(iteCount);
    txt={'n_{min} : '+string(val_min),'at w : '+string(w(arg_min))};
    text(arg_min*del_w,val_max/2,txt,'HorizontalAlignment','Center')
    title('Relaxation factor vs Iterations for SOR Method')
    xlabel('Relaxation factor (w)')
    ylabel('Iterations required (n)')
else
    figure('Name','Relaxation factor','NumberTitle','off','Color','w')
    stem(w,iteCount,'r');
    title('Relaxation factor vs Iterations for SOR Method')
    xlabel('Relaxation factor (w)')
    ylabel('Iterations required (n)')
end