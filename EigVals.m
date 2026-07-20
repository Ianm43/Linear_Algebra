function B = EigVals( M )

    [Q,R] = QRFac(M);
    M = R*Q;
    A = Q;


    for i = (1:30)

        [Q,R] = QRFac(M);
        A = A * Q;
        M = R * Q;

    end
    B = diag(M);

end