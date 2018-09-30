% Program to solve a system of linear equations using Successive Over Relaxation (SOR) Method
 % It is a variant of Gauss-Seidel Method resulting in faster convergence.
clc; clear all;

% Inputs
disp('For `Ax=B` system of equations.')
A = input('Matrix A : ');
B = input('Matrix B : ');
x0 = input('Initial guess x0 : ');
w = input('Relaxation factor (> 1) : ');
tolerance = input('Tolerance required : ');
maxIte = input('Maximum Iterations : ');

if size(B,1) ~= size(A,1) || size(x0,1) ~= size(A,1)
    disp('Invalid Inputs B and/or x0, please provide as `nx1` matrix.')
else
    N = size(A,1);
    ite = 1;
    x=zeros(size(x0));
    gotSoln=false;
    while ite <= maxIte
        for row = 1:N
            x(row) = (1-w)*x0(row) + w*(B(row) - A(row,1:row-1)*x(1:row-1) - A(row,row+1:N)*x0(row+1:N))/A(row,row);
        end
        if abs(x-x0) < tolerance
            gotSoln=true;
            fprintf('\nConverged, Solution of system is :');
            x
            fprintf('Iterations Required : %d\n',ite);
            break;
        else
            ite = ite + 1;
            x0 = x;
        end
    end
end

if ~gotSoln
    fprintf('\nDid not converge.')
    disp('Possible reasons include -')
    disp('Matrix A is')
    disp('neither `strictly or irreducibly diagonally dominant`')
    disp('nor `symmetric positive-definite` (keep 0 < w < 2)')
    disp('The standard convergence condition (for any iterative method) -') 
    disp('Spectral radius of the iteration matrix should be less than 1.')
end