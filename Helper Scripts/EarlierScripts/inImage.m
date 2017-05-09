function bool = inImage(sizeImage,x,y)
    if sizeImage(1) > x && sizeImage(2) > y && x > 0 && y > 0 
       bool = true; 
    else 
        bool = false;
    end
    
end