function projMatrix = createProjectionMatrix(xy, uv)
    % Calculation of projection matrix 
    x = xy(:, 1);
    y = xy(:, 2);
    % we cannot use x' and y' in Matlab because ' means transposed
    u = uv(:, 1);
    v = uv(:, 2);
    o = ones(size(x));
    z = zeros(size(x));
    Aoddrows = [x, y, o, z, z, z, -u .* x, -u .* y, -u];
    Aevenrows = [z, z, z, x, y, o, -v.* x, -v.* y, -v];
    A = [Aoddrows; Aevenrows];
    
    % Calculate the kernel of matrix A
    projMatrix1 = null(A);
    
    % Reshape the vector into a 3x3 matrix
    projMatrix = reshape(projMatrix1, 3, 3)';

    
    

end


