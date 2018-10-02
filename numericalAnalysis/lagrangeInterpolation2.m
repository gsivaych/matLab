% Program to plot a function using Lagrange Interpolation
clc; clear all;

% Inputs
A = input('Given datapoints (nx2 matrix of x,f(x)) : ');
% p = input('p : ');
% fx = lagrangeInterpolate(A,p)

x = -10:0.1:10;
i = 1;
for x_ = x
    fx(i) = lagrangeInterpolate(A,x_);
    i = i+1;
end

% Plot
figure('Name','Lagrange Interpolation','NumberTitle','off','Color','w')
plot(x,fx,'r'), grid on, grid minor
title('f(x) approximated by Lagrange Interpolation')
xlabel('x')
ylabel('f(x)')

fprintf('\n-------Note :\n')
disp('Graph may come out to be different if not sufficient data points to describe every property of function.')
disp('e.g for x^2')
disp('[1,1;2,4;3,9] does not describe effect on negative numbers')
disp('[-3,-27;-2,-8;-1,-1;0,0;1,1;2,8;3,27] will work well.')

function fx = lagrangeInterpolate(A,p)
    % dataPoints
    x = A(:,1); % x values
    f = A(:,2); % f(x) values
    N = length(x); n = N-1;
    % calculation of l(n) values
    for i = 1:n
    l(i) = 1.0;
    for j = 1:n
        if j~=i
            l(i) = (p-x(j))*l(i) / (x(i)-x(j));
        end
    end
    end
    % approximating f(x)
    sum = 0.0;
    for k = 1:n
        sum = sum + l(k)*f(k);
    end
    fx = sum;
end