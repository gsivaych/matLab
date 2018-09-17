% Program to numericallly determine roots of given non-linear eq. [ f(x) = 0  for real x] using Bisection Method
clc; clear all;

% INPUTS
equation = input('Enter f(x) : ','s');
% consider providing equation with .^ and .* so matrix operations can work well.
f= str2func(['@(x)' equation]);
domain = input('Domain to look out in [a,b] : ');
stepSize = 1;
tolerance = input('Tolerance required : ');

% Exploring domain and finding sections (width = step-size) where roots exist
firstPoint = domain(1);
lastPoint = domain(2);
roots = [];
while(firstPoint<lastPoint)
    secondPoint = firstPoint + stepSize;
    if f(firstPoint)*f(secondPoint) < 0 || f(firstPoint) == 0
        roots = [roots firstPoint];
    end
    firstPoint = firstPoint + stepSize;
end

% For each section improvise roots to achieve specified tolerance
for rootNum = 1:length(roots)
    root = roots(rootNum);
    if f(root) ~= 0
        exactRoot = bisectTillRoot(f,root,stepSize,tolerance);
        roots(rootNum) = exactRoot;
    end
end
roots

% Plot
figure('Name','Bisection Method','NumberTitle','off','Color','w')
x = domain(1):tolerance:domain(end);
plot(x,f(x),'b'), grid on, grid minor,
title(['Roots of ',equation,' = 0'])
xlabel('x'),ylabel('f(x)')
hold on
plot(roots,0,'ro') % roots marked in red 'o'

function exactRoot = bisectTillRoot(f,root,stepSize,tolerance)
    a = root; b = root + stepSize;
    while (b-a > tolerance)
        c = (b+a)/2;  % midpoint
        if f(c)==0
            exactRoot = c; % we got exact root
            break;
        elseif f(a)*f(c) < 0
            b = c;     % contraction from left
        else 
            a = c;     % contraction from right
        end
        exactRoot = c;
    end
end