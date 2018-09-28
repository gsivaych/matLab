% Program : an algorithm for LU factorisation using Gaussian Elimination.
clc; clear all;

A = input('Enter matrix A : ');
N = size(A);
if N(1)~=N(2)
    disp('Not Applicable : LU factorisation is for square Matrices only.')
else
    N = N(1); l=0; u=1; L=0; U=0;
    ch = input('Whose main diagonal is all ones [`response` = u/U/l/L] : ');
    inadequateResponse = false;
    switch ch
        case 1
            u = ones(N,1); U = diag(u); L = zeros(N,N);
            L(1,1)=A(1,1)/U(1,1);
        case 0
            l = ones(N,1); L = diag(l); U = zeros(N,N);
            U(1,1)=A(1,1)/L(1,1);
        otherwise
            disp('Inadequate Response.')
            inadequateResponse = true;
    end
    if ~inadequateResponse
        impossibleFactorisation = false;
        if L(1,1)*U(1,1)==0
            impossibleFactorisation = true;
        else
            for j = 2:N
                U(1,j) = A(1,j)/L(1,1); % first row of U
                L(j,1) = A(j,1)/U(1,1); % first column of L
            end
            for i = 2:N-1
                sum_ = 0;
                for k=1:i-1
                    sum_ = sum_ + L(i,k)*U(k,i);
                end
                switch ch
                    case 0
                        U(i,i) = (A(i,i)-sum_)/L(i,i);
                    case 1
                        L(i,i) = (A(i,i)-sum_)/U(i,i);
                end
                if L(i,i)*U(i,i) == 0
                    impossibleFactorisation = true;
                else
                    for j = i+1:N
                        U(i,j) = (A(i,j) - sum(L(i,1:i-1).*U(1:i-1,j)))/L(i,i); % i`th row of U
                        L(j,i) = (A(j,i) - sum(L(j,1:i-1).*U(1:i-1,i)))/U(i,i); % i`th column of L
                    end
                end
            end
            switch ch
                case 0
                    U(N,N) = (A(N,N)-sum(L(N,1:N-1).*U(1:N-1,N).'))/L(N,N);
                case 1
                    L(N,N) = (A(N,N)-sum(L(N,1:N-1).*U(1:N-1,N).'))/U(N,N);
            end
            if L(N,N)*U(N,N) == 0
                disp('Matrix `A` is singular.')
            end             
        end
        if impossibleFactorisation
            disp('Factorisation Impossible.')
        end
    end
end
L
U