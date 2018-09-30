% Program to determine dominant eigen-value and associated eigen-vector by Power Iteration
clc; clear all;

% Inputs
A = input('Enter matrix A : ');
x0 = input('Initial Guess : ');
tolerance = input('Required tolerance : ');

if size(x0,1) == size(A,1)
    [eigen_value, eigen_vector] = powerIteration(A,x0,tolerance)
else
    x0 = x0.'; % transpose
    if size(x0,1) == size(A,1)
        [eigen_value, eigen_vector] = powerIteration(A,x0,tolerance)
    else
        disp('Incompatible initial guess -')
        disp('Required to be nx1 as n for A[nx:].')
    end
end

function [k,x] = powerIteration(A,x,tolerance)
    
    k0 = 0;
    
    % first iteration
    y = A*x;
    k = max(y(:));
    x = y/k;
    
    while abs(k-k0) > tolerance
        y = A*x;
        k = max(y(:));
        x = y/k;
        k0 = k;
    end
    
end