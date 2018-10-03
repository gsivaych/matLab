% Program/algorithm to Implement Newton's Divided Difference Interpolation
 % i.e. to approximate value of function at the point using given datapoints.
clc; clear all;
 
% Inputs
A = input('Given datapoints (nx2 matrix of x,f(x)) : ');
N = size(A,1); n = N-1; % N datapoints => ploynomial of degree N-1
p = input('Point of Interpolation (p) : ');

% dataPoints
x = A(:,1); % x values
f(:,1) = A(:,2); % f(x) values

% divided difference table
for row = 2 : N
    for col = 1 : (N - row + 1)
        f(col,row) = (f(col+1,row-1)-f(col,row-1)) / (x(col+row-1)-x(col));
    end
end

% approximating value
valatP = f(1,1);
for i = 2:N
    product = 1;
    for j = i-1:-1:1
        product = product * (p-x(j));
    end
    valatP = valatP + product*f(1,i);
end

fprintf('\nValue at %d is %d.\n',p,valatP);