function projection = myProjection( image, x1, y1, x2, y2, x3, y3, x4, y4, m, n, method, border)
    % Allocate new image of correct size 
    projection = zeros(n, m);
    
    % Making the XY matrix and UV matrix
    xy = [1, 1; n, 1; 1, m; n, m];
    uv = [x1, y1; x2, y2; x3, y3; x4, y4];
    
    % Calculate projection matrix
    projMatrix = createProjectionMatrix(xy, uv);

    for xIndex = 1:m
        for yIndex = 1:n
            % Calculate x and y
            xxyy = projMatrix * [yIndex; xIndex; 1];
            xxyy = xxyy / xxyy(3);
            y = xxyy(1);
            x = xxyy(2);
            
            projection ( yIndex , xIndex ) = ...
            pixelValue ( image , x , y , method, border);
        end
    end
end