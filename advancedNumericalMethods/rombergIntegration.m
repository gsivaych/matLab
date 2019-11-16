%% Program to estimate definite integrals using Romberg's method.
clc; clear all;
format long;

%% Inputs
F = input('Function, F(x) as str : ');
f = str2func(['@(x)' F]);
a = input('from (a) : ');
b = input('upto (b) : ');

e = input('Accuracy required (no. of decimals) : ');
tolerance = 0.1^e;
N = input('Max. no. of iterations : ');
h = (b-a);;

%%  Romberg Integration
R = zeros(N+1, N+1);

R(1,1) = 0.5*(f(a)+f(b))*h;
for i = 1:N
    h = h/2;
    R(i+1,1) = 0.5*(f(a) + 2*sum( f( (a+h):h:(b-h) ) ) + f(b))*h;
    
    for j = 1:i
        R(i+1,j+1) = (4^j*R(i+1,j) - R(i,j)) / (4^j-1);
    end
    
    if abs( R(i+1,i+1) - R(i,i) ) < tolerance
        break;
    elseif i == N+1
        error('Romberg Integration did not convergeR.');
    end
end
%% Answer
fprintf('\nIterations required : %d\n',i);
R(i+1,i+1)