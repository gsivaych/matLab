% Program to approximate values of a function `f(x)` at `required points` using 
 % Lagrange's interpolating ploynomial `Pn(x)` of degree `n`.
clc; clear all;

% Inputs
A = input('Given datapoints (nx2 matrix of x,f(x)) : ');
N = size(A,1); n = N-1; % N datapoints => ploynomial of degree N-1
p = input('Point of Interpolation (p) : ');

% dataPoints
x = A(:,1); % x values
f = A(:,2); % f(x) values

% Calcuation of l(n) values
for i = 1:n
    l(i) = 1.0;
    for j = 1:n
        if j~=i
            l(i) = (p-x(j))*l(i) / (x(i)-x(j));
        end
    end
end

% Approximating f(p)
sum = 0.0;
for k = 1:n
    sum = sum + l(k)*f(k);
end

fprintf('Value of f(x) at x = %d is %d\n',p,sum);