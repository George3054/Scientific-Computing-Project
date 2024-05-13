function blkToeplitzTrid(n,B,A,C)
% Author : G. LEKKAS , AM 1067430 , Date : 28/11/2021
m=length(A);
m1=length(B);
m2=length(C);
X = kron( eye(m*n), A ) + kron( diag(ones(m1*n-1,1), -1), B )+ kron( diag(ones(m2*n-1,1), 1), C )