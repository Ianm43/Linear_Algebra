

function x = BackSub( U, b )
% solves the linear system: Ux = b, where U is an upper triangular matrix.

    x = zeros( size(U,2),1 );

    if (size(U,1) ~= size(b))
        error( "Matrix dimension do not agree" );
    end

    for i = (size(U,1):-1:1)

        for j = ( i+1:size(U,2) )

            b(i) = b(i) - U(i,j) * x(j);

        end

        x(i) = b(i) / U(i,i);

    end