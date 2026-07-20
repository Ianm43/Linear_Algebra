function [B] = EigVals( M, tolerance )

    arguments
        M {mustBeMatrix};
        tolerance (1,1) double = 1e-7;
    end

    %Tri-diagonalization process preserves eigenvalues, and speeds up QR
    %algorithm
    M = Tridiagonalize(M);

    temp = M;
    [Q,R] = QRFac(M);
    M = R*Q;

    while norm( abs(temp) - abs(M) ) > tolerance

        temp = M;

        [Q,R] = QRFac(M);
        M = R * Q;

    end
    B = diag( diag(M) );

end