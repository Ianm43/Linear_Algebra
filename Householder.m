function H = Householder( u )

if size(u,1) == 1
    H = eye( size(u,2) ) - 2 * (u * u');
    return
end


if size(u,2) == 1
    H = eye( size(u,1) ) - 2 * (u* u');
    return
end

error( "u is not a vector" );

end