function [Q,R] = QRFac( M )
    R = eye( size(M) );
    Q = zeros( size(M) );

   %Initialize the recursive sequence
    R(1,1) = norm( M(:,1) );
    Q(:,1) = M(:,1) ./ R(1,1);
    

    for j = (2:size(M,1))

        R(j,j) = norm( M(:,j) )^2;
        Q(:,j) = M(:,j);

        for i = (1:j-1)
            R(i,j) = M(:,j)' * Q(:,i);
            R(j,j) = R(j,j) - R(i,j)^2;
            Q(:,j) = Q(:,j) - R(i,j) .* Q(:,i); 
        end
        R(j,j) = sqrt( R(j,j) );
        Q(:,j) = Q(:,j) ./ R(j,j); 
    end

end




% function [Q,R] = QRFac(A)
% %this is the ultra inefficient way of producing a QR factorization
%     Q = eye( size(A,1) );
%     R = Q;
% 
%     Q(:,1) = A(:,1);
% 
%     for j = (2:size(A,2))
% 
%             Q(:,j) = A(:,j);
% 
%         for i = (1:j-1)
% 
%             R(i,j) =  Q(:,i)' * A(:,j) ./ norm(Q(:,i))^2;
% 
%             Q(:,j) = Q(:,j) - R(i,j) * Q(:,i);
% 
% 
%         end
% 
% 
%     end
% 
% 
% %Normalize Q:
%     for i = ( 1:size(A,2) )
% 
%         length = norm( Q(:,i) );
% 
%         Q(:,i) = Q(:,i) ./ length;
% 
%         % even though we are scaling the columns of Q, this manifests as
%         % scaling the rows of the factor R when you do the algebra. Funky
% 
%         R(i,:) = R(i,:) .* length;
% 
%     end 
% 
% end