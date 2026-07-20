function [V,B] = Eig(A)


        B = EigVals(A);
        V = eye( size(A) );

        for i = (1:size(B,1))
            
            % skip zero eigenvalues
            if B(i,i) ~= 0
            V(:,i) = EigVecs( Inverse( A - eye(size(A)) .* B(i,i) ) );
            end
    
        end



end