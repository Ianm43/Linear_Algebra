function c = ForwardSub( L, b )

    c = zeros( size(L,2),1 );

    if( size(L,1) ~= size(b) )
        error( "matrix dimensions do not agree" );
    end

    for i = (1:size(L,1))

        for j = (1:i-1)
            b(i) = L(i,j) * c(j);
        end
        c(i) = b(i) / L(i,i);
    end

end