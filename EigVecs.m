function V = EigVecs( A )

    V = rand(size(A,1),1);


    V = Eig( V, A );


end

function [V] = Eig( V, A )

%function to iteratively apply a matrix transformation to a given vector,
%this should converge to the dominant eigenvector of the system.

temp = zeros(size(V) );

    while norm( abs(V)-abs(temp) ) > 0.000001
        temp = V;
        V = A * V;

        V = V ./ norm(V);
    end

end