function [r_channel, g_channel, b_channel] = extract_channels(rgb_img)
    r_channel = extract_channel(rgb_img, 1);
    g_channel = extract_channel(rgb_img, 2);
    b_channel = extract_channel(rgb_img, 3);
    
    function channel = extract_channel(rgb_img, channel_num)
        num_rows = size(rgb_img,1);
        num_cols = size(rgb_img,2);
        
        channel = zeros(num_rows, num_cols);
        
        for i=1:num_rows
            for j=1:num_cols
                channel(i,j) = rgb_img(i,j,channel_num);
            end
        end