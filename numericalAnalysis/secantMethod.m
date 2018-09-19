% Program to better approximate root of function f(x) numerically using Secant Method
clc; clear all;

% INPUTS
equation = input('Enter f(x) : ','s');
% consider providing equation with .^ and .* so matrix operations can work well.
f= str2func(['@(x)' equation]);
initialGuesses = input('Initial guesses [a,b] : ');
tolerance = input('Tolerance required : ');
maxIterations = input('Max. iterations : ');

gotRoot = 0;
iterationNum = 1;
x0 = initialGuesses(1);
x1 = initialGuesses(2);
while iterationNum < maxIterations
    x2 = x1 - f(x1)*(x1-x0)/(f(x1)-f(x0));
    if abs(x2-x1) < tolerance
        fprintf('Found root, precise to %d is :\t%d\n',tolerance,x2);
        fprintf('Iterations required : %d\n',iterationNum);
        gotRoot = 1;
        break
    else
        if f(x2)*f(x1) < 0
            x0 = x2;
        else
            x1 = x2;
        end
        iterationNum = iterationNum + 1;
    end
end

if gotRoot
    % Plot
    figure('Name','Secant Method','NumberTitle','off','Color','w')
    x = x2-10:0.01:x2+10;
    plot(x,f(x),'b'), grid on, grid minor,
    title(['Root of f(x) = ',equation,' = 0']);
    xlabel('x'), ylabel('f(x)')
    hold on
    plot(x1,0,'ro')
else
    disp('Could not compute root, maximum number of iterations reached.');
end