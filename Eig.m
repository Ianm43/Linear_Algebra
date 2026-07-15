function [A,B] = Eig( M )

    [Q,R] = QRFac(M);
    M = R*Q;
    A = Q;


    for i = (1:20)

        [Q,R] = QRFac(M);
        A = A * Q;
        M = R * Q;

    end
    B = M;
end
