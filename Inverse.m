function I = Inverse(M)

    I = eye(size(M));

    for i = (1:size(I,1))

        I(:,i) = LinSolve(M,I(:,i));

    end

end