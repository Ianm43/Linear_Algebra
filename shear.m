function A = shear( s, i, j, n )
%returns an elementary shear matrix

%when used as the left operand, in a matrix multiplication, it adds s times
%the jth row to the ith row, and when used as the right operand it does the
%same for columns.

A = eye(n,n);
A(i,j) = s;

end