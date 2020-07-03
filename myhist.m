function hist = myhist(img)
    if size(img, 3) ~= 1
        error("histogram only applies to 1 channel image");
    end
    
    % Get dimensions of image
    num_rows = size(img, 1);
    num_cols = size(img, 2);
    % init histogram as a 256x1 vector storing values for the 
    % number of pixels under each gray value from 0-256.
    % Default of 256 buckets, assignment didn't specify
    hist = zeros(256, 1);
    
    for i=1:num_rows
        for j=1:num_cols
           % add 1 to gray value since pixel values are 0-255
           % but matrix indices are 1-256
           v = img(i,j)+uint8(1);
           % increment the number of pixels at that gray value
           % in the histogram by 1
           hist(v) = hist(v)+1;
        end
    end