function color = pixelValue ( image , x , y , method, border)
% pixel value at real coordinates
x_new = floor(x+0.5);
y_new = floor(y+0.5);

if inImage ( size ( image ) ,x_new , y_new )
% do the interpolation

    switch ( method )
        case 'nearest'
        % Do nearest neighbour
            
            color = image(x_new, y_new);
            return;

        case 'linear'
        % Do bilinear interpolation
            k = x_new;  
            l = y_new;
            a = x - k; 
            b = y - l; 
            color = (1-a)*(1-b) * image(k,l) + ... 
                    (1-a)* b *image(k,l+1) + ...
                    a * b * image(k+1,l+1) + ...
                    a * (1-b) * image(k+1, l); 
            return
    end %end switch
        
else

    switch border
        case 'basic'
            color = 0;  
            
        case 'nearest'
            if x > size(image,1) 
                x_new = size(image,1); 
            elseif x < 1 
                x_new = 1;
            end

            if y > size(image,2)
                y_new = size(image,2);
            elseif y < 1
                y_new = 1;
            end
            
            
            color = image(x_new,y_new); 

        case 'duplicate'
            if x > size(image,1) 
                x_new = mod(x,size(image,1));
                x_new = floor(x_new + 0.5);
            end

            if y > size(image,2)
                y_new = mod(x,size(image,2));
                y_new = floor(y_new + 0.5);
            end
            color = image(x_new,y_new); 
            
    end   
end
