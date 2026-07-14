function [Q,R] = QRFac(A)

    Q = eye( size(A,1) );
    R = Q;

    Q(:,1) = A(:,1);

    for j = (2:size(A,2))

            Q(:,j) = A(:,j);

        for i = (1:j-1)

            temp =  Q(:,i)' * A(:,j) ./ norm(Q(:,i))^2;

            Q(:,j) = Q(:,j) - temp * Q(:,i);

            R(i,j) = temp;

        end


    end



    %   Normalize Q
    % this is the ultra inefficient way of producing a QR factorization
    for i = ( 1:size(A,2) )

        length = norm( Q(:,i) );

        Q(:,i) = Q(:,i) ./ length;

        % even though we are scaling the columns of Q, this manifests as
        % scaling the rows of the factor R when you do the algebra. Funky

        R(i,:) = R(i,:) .* length;

    end 

end