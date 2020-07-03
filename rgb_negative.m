function negative_img = rgb_negative(rgb_img)
    %Get dimensions of image
    num_rows = size(rgb_img, 1);
    num_cols = size(rgb_img, 2);
    negative_img = zeros(num_rows, num_cols, 'uint8');
    
    % Loop over all image pixels
    for i=1:num_rows
        for j=1:num_cols
            r = rgb_img(i,j,1);
            g = rgb_img(i,j,2);
            b = rgb_img(i,j,3);  
            % Apply negative conversion (255-f) to r,g,b values
            negative_img(i,j,1) = 255-r;
            negative_img(i,j,2) = 255-g;
            negative_img(i,j,3) = 255-b;
        end
    end
    