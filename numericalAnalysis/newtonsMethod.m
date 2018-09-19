% Program to numerically compute better approximation of root of given non-linear eq.
% [ real valued function f(x) for real x ] using Newton-Raphson Method.
clc; clear all;

% INPUTS
equation = input('Enter the function f(x) : ','s');
% consider providing equation with .^ and .* so matrix operations can work well
f = str2func(['@(x)' equation]);
syms x
dequation = diff(f,x);
df = matlabFunction(dequation);
x0 = input('Initial guess x0 : ');
tolerance = input('Tolerance required : ');
maxIterations = input('Max. iterations : ');

% computing g(x) : newton's method is just fixed point method with g(x) = x - [f(x)/df(x)]
g = @(x) x - f(x)/df(x);

gotRoot = 0;
iterationNum = 1 ;
while(iterationNum < maxIterations)
    x1 = g(x0); % point on curve
   
    if abs(x1-x0) < tolerance
        fprintf('Fixed point of g(x) i.e. root of f(x) precise to %d is : %d\n',tolerance,x1);
        fprintf('Iterations required : %d\n',iterationNum);
        gotRoot = 1;
        break
    else
        x0 = x1;    % point on line y = x
        iterationNum = iterationNum + 1;
    end
end

if gotRoot
    % Plot
    figure('Name','Newton-Raphson Method','NumberTitle','off','Color','w')
    x = x0-10:0.01:x0+10;
    plot(x,f(x),'b'), grid on, grid minor,
    title({['Fixed point iteration of f(x) = ',equation];'with g(x) calculated by Newton-Raphson method'});
    xlabel('x'), ylabel('f(x)')
    hold on
    plot(x1,0,'ro')
else
    disp('Maximum iterations reached : Could not find root/fixed point.')
end