% Program/Algorithm to approximate integrals using Composite Trapezoidal
clc; clear all;

% Inputs
equation = input('Input function : ','s');
f = str2func(['@(x)' equation]);
Domain = input('Input End points [a, b] : ');
N = input('No. of subintervals : ');

% Interval size
h = (Domain(end)-Domain(1))/N;

sum = 0;
for i = 1:N-1
    x = Domain(1) + h*i;
    sum = sum + 2*f(x);
end
sum = sum + f(Domain(1)) + f(Domain(end));
reqVal = sum*(h/2);

fprintf('\nIntegral of f(x) = %s from x = %d to %d = %d\n',equation,Domain(1),Domain(end),reqVal);