

function [V,B] = EigVecs( A )


    V = eye( size(A) );
    B = eye( size(A) );

    for i = ( 1:size(A,2) )
        [V(:,i), B(i,i) ]= Eig( V(:,i), A );


    end

end

function [V,b] = Eig( V, A )
%function to iteratively apply a matrix transformation to a given vector,
%this should converge to the dominant eigenvector of the system.

temp = zeros(size(V) );

    while norm( V-temp ) > 0.0001
        temp = V;
        V = A * V;

        b = V' / temp';

        V = V ./ norm(V);
    end

end