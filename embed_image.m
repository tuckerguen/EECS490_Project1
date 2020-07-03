% bkrg = what will be the background of the final image
% watermark = the image to be overlayed on the background
% is_color = boolean to tell if a color image or not
function final = embed_image(bkrg, watermark, is_color)
    % Copy background image to new matrix (so we
    % don't need to do it in the l
    final = bkrg;
    % Get dimensions of background image
    num_rows_bkrg = size(bkrg, 1);
    num_cols_bkrg = size(bkrg, 2);
    % Get dimensions of watermark
    num_rows_wtrmk = size(watermark, 1);
    num_cols_wtrmk = size(watermark, 2);
    
    % Define offset for top left corner of watermark.
    % Is the center of the background image, shifted
    % up and to the left relative to the size of the
    % watermark
    wtrmk_start_x = (num_rows_bkrg-num_rows_wtrmk)/2.0;
    wtrmk_start_y = (num_cols_bkrg-num_cols_wtrmk)/2.0;
    
    % Thresholding values for what will be considered foreground or 
    % background in the watermark. 
    % Watermark value < threshold is foreground, > threshold is background
    %(since the watermark background is white). The values were picked
    % experimentally, picking those appearing to look the best
    r_thresh = 200;
    g_thresh = 200;
    b_thresh = 200;
    v_thresh = 200;
    
    % Loop over all values in watermark
    for i= 1:num_rows_wtrmk
        for j=1:num_cols_wtrmk
            if is_color
                % collect rgb values from watermark
                r = watermark(i,j,1);
                g = watermark(i,j,2);
                b = watermark(i,j,3);
                % If part of foreground
                if r < r_thresh && g < g_thresh && b < b_thresh
                   % set the values in the final image to the watermark
                   % rgb values, using offset as defined earlier
                   final(i+wtrmk_start_x,j+wtrmk_start_y,1) = r;
                   final(i+wtrmk_start_x,j+wtrmk_start_y,2) = g;
                   final(i+wtrmk_start_x,j+wtrmk_start_y,3) = b;
                end
            else
                % if gray, get grayscale value
                v = watermark(i,j);
                % if part of foreground
                if v < v_thresh
                    % set gray value using offset
                    final(i+wtrmk_start_x,j+wtrmk_start_y) = v;
                end
            end
        end
    end