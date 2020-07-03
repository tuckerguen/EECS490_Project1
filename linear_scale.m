function scaled = linear_scale(img)
    % Set gmax and gmin to full range
    gmin = 0;
    gmax = 255;
    
    % get max and min values over image
    fmin = mymin(img);
    fmax = mymax(img);
    
    % Get dimensions of image
    num_rows = size(img, 1);
    num_cols = size(img, 2);
    
    scaled = zeros(num_rows, num_cols, 'uint8');
    
    for i=1:num_rows
        for j=1:num_cols
            f = img(i,j);
            % Apply linear scaling function with calculated fmax, fmin,
            % and given gmax and gmin
            val = gmin + ((gmax-gmin) / (fmax-fmin))*(f-fmin);
            scaled(i,j) = val;
        end
    end