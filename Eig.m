function [V,B] = Eig(A)

    B = diag( EigVals(A) );
    V = zeros( size(A) );

    for i = (1:size(B,1))

        V(:,i) = EigVecs( Inverse( A - eye(size(A)) .* B(i,i) ) );

    end

end