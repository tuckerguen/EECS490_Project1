function gray_img = rgb_to_gray(rgb_img)
    num_rows = size(rgb_img, 1);
    num_cols = size(rgb_img, 2);
    gray_img = zeros(num_rows, num_cols, 'uint8');
    
    for i=1:num_rows
        for j=1:num_cols
            r = rgb_img(i,j,1);
            g = rgb_img(i,j,2);
            b = rgb_img(i,j,3);  
            % apply grayscale function
            gray_val = uint8(0.299)*r + uint8(0.587)*g + uint8(0.114)*b;
            gray_img(i,j) = gray_val;
        end
    end

   

