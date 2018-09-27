% Program to obtain solution of given system of linear equations using Gauss Elimination (row reduction) Method.
clc; clear all;

% Inputs
augMat = input('Enter Augmented Matrix : ');
N = size(augMat,1);

% Upper Triangular Matrix
utM = augMat;
uniqueSol(1:N) = false;
for col = 1:N-1
    for row = col:N
        if utM(row,col) ~= 0
            if row ~= col % when first non-zero column element is non-diagonal
                utM(col,:) = utM(col,:)+utM(row,:);
            end
            for row_ = col+1:N % zero the elements below matrix diagonal
                if utM(row_,col) ~= 0
                    m = utM(row_,col)/utM(col,col);
                    utM(row_,:) = utM(row_,:)-m*utM(col,:);
                end
            end
            uniqueSol(col) = true; % found atleast one non-zero element in column
        end
    end
end
% Confirming last diagonal element is non-zero
if utM(N,N) ~= 0
    uniqueSol(N) = true;
end

if sum(uniqueSol) == N % Unique Solution Exists
    % Backward Substitution
    X(N) = utM(N,N+1)/utM(N,N);
    for row = N-1:-1:1
        sum = 0;
        for col = row+1:N
            sum = sum + utM(row,col)*X(col);
        end
        X(row) = (utM(row,N+1) - sum)/utM(row,row);
    end
    
    % Results
    augMat
    disp('Upper Triangular Matrix :')
    utM
    disp('Calculated variables :')
    X.'
else
    disp('No Unique Solution Exists.')
end

%   echelonMatrix = rref(augMat); % Row Reduced Echelon Form
%   echelonMatrix(:,end)