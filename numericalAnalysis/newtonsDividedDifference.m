% Program/algorithm to Implement Newton's Divided Difference Interpolation
 % i.e. to approximate value of function at the point using given datapoints.
clc; clear all;
 
% Inputs
A = input('Given datapoints (nx2 matrix of x,f(x)) : ');
N = size(A,1); n = N-1; % N datapoints, polynomial of degree N-1
P = input('Point of Interpolation (P) : ');

% divided difference matrix
ddMatrix(:,1) = A(:,1); % x values
ddMatrix(:,2) = A(:,2); % f(x) values
for col = 3 : N + 1
    for row = col-1 : N
        if((ddMatrix(row,1)-ddMatrix(row-col+2,1))~=0)
            ddMatrix(row, col) = (ddMatrix(row,col-1)-ddMatrix(row-1,col-1))/(ddMatrix(row,1)-ddMatrix(row-col+2,1));
        end
    end
end

% interpolating for P
x_ = P; y_ = NDD_Interpolation(n, ddMatrix, P);
fprintf('\nInterpolating %f we got : %f\n',x_,y_)

% Interpolating for range and plot
X = linspace(ddMatrix(1,1),ddMatrix(N,1),100);
k = length(X); approximatedValues = zeros(1,k);
for i=1:k
    approximatedValues(i) = NDD_Interpolation(n, ddMatrix, X(i));
end
figure('Name',"Newton's divided differrence interpolation",'NumberTitle','off','Color','w')
plot(X,approximatedValues,'b'), grid on, grid minor
title("Graph, interpolating over range of values.")
xlabel("x"), ylabel("f(x)")
hold on, plot(x_,y_,'ro')

% function for interpolation, returns approximated value
function approximatedValue = NDD_Interpolation(n, ddMatrix, x)
    approximatedValue = ddMatrix(1,2);
    for col = 2 : n + 2
        tempProduct = 1;
        for row = 1:col-1
            tempProduct = tempProduct*(x-ddMatrix(row,1));
        end
        if(col <= n+1)
            approximatedValue = approximatedValue + ddMatrix(col,col+1)*tempProduct;
        end
    end
end