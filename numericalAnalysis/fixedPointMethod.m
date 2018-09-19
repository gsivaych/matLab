% Program to numerically compute root of given non-linear eq. f(x) using Fixed Point Method
clc; clear all;

% INPUTS
equation = input('Enter g(x) [function whose fixed point] : ','s');
% fixed point of g(x) will be root of f(x)
% consider providing equation with .^ and .* so matrix operations can work well.
g = str2func(['@(x)' equation]);
x0 = input('Initial guess x0 : ');
tolerance = input('Tolerance required : ');
maxIterations = input('Max. iterations : ');

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
    figure('Name','Fixed Point','NumberTitle','off','Color','w')
    x = x0-10:0.01:x0+10;
    plot(x,g(x),'b'), grid on, grid minor,
    title(['Fixed point iteration of g(x) = ',equation])
    xlabel('x'), ylabel('g(x)')
    hold on
    plot(x1,g(x1),'ro')
else
    disp('Maximum iterations reached : Could not find root/fixed point.')
end