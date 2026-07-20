function A = Tridiagonalize( A )

    if size(A,1) ~= size(A,2)
        error( "A must be a square matrix" );
    end


    for i = (1:size(A,1)-1)

        x = A(:,i);
        x(1:i) = 0;

        y = zeros( size(x) );

        y(i+1) = -A(i+1,i) / abs(A(i+1,i) ) * norm(x);

        u = (x - y) ./ norm( x-y );

        H = Householder(u);

        A = H * A * H;

    end

end