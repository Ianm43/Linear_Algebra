function x = LinSolve( A, b, Algorithm )
    arguments
       
        A double {mustBeMatrix}
        b double {mustBeVector}

        Algorithm Algorithms = Algorithms.QR
    end

    %solve using LU Factorization
    if Algorithm == Algorithms.LU

        [L,U] = LUFac( A );

        c = BackSub(U,b);

        x = ForwardSub(L,c);
        return
    end

    %Solve using QR factorization
    if Algorithm == Algorithms.QR

        [Q,R] = QRFac(A);

        x = BackSub( R, Q' * b );

    end

end


