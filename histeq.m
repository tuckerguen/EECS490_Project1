function [equalized, transfer_X, transfer_Y] = histeq(img, histogram)    
    num_img_rows = size(img, 1);
    num_img_cols = size(img, 2);
    
    min_gray = mymin(img);
    max_gray = mymax(img);
    
    %total number of pixels in the image
    n = num_img_rows * num_img_cols; 
    
    %normalize the histogram
    num_points = length(histogram);
    normalized_hist = zeros(num_points,1);
    % Iterate over all points in the histogram
    for i=1:num_points
        % Divide by the total number of pixels in the image
        normalized_hist(i) = histogram(i) / n;
    end
    
    % get cumulative distribution of normalized histogram
    c = cum_dist(normalized_hist);
    % initialize the final image matrix
    equalized = zeros(num_img_rows, num_img_cols, 'uint8');

    % Set range to full rgb range
    gmin = 0;
    gmax = 255;
    % For every pixel
    for i=1:num_img_rows
        for j=1:num_img_cols
            % Add 1 to account for indexing
            f = img(i,j,1)+uint8(1);  
            % Get the value from the cdf and scale
            v = ((gmax - gmin)*c(f)+gmin);
            % Set the new pixel to that value
            equalized(i,j) = v;
        end
    end
    
    % init X values to be the range of values in the image (0-255)
    img_range = max_gray - min_gray;
    transfer_X = zeros(img_range, 1);
    for i=1:img_range
        transfer_X(i) = min_gray+i-1;
    end
    
    % Compute new value according to the histogram equalization function
    transfer_Y = zeros(img_range, 1);
    % Iterate over all values in the domain (transfer_X)
    for i=1:img_range
        f = transfer_X(i)+uint8(1);  
        v = (gmax - gmin)*c(f)+gmin;
        transfer_Y(i) = v;
    end
    