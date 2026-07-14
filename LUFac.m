function [L,U] = LUFac( A )
% this function takes in a regular square matrix A and produces the lower
% unit triangular matrix L and the upper triangular matrix U.



if size(A,1) ~= size(A,2)
    error( "A must be square" );
end

L = eye( size(A) );
U = A;


%increment over the columns of the matrix starting from one
for j = ( 1 : size(A,1) )


    if U(j,j) == 0
        error( "A is non-regular" );
    end

    temp = eye(size(A));
    temp2 = temp;

    %increment down the rows of the matrix starting in the first entry
    %below the main diagonal.
    for i = ( j+1 : size(A,2) )

        temp(i,j) = -U(i,j)/U(j,j);
        temp2(i,j) = U(i,j)/U(j,j);

    end


    %apply the elementary operations for this pivot.
    U = temp * U;
    L = L * temp2 ;
end

end