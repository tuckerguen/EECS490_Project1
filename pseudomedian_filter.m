function pmed_filtered = pseudomedian_filter(img, win_size)
    num_rows = size(img, 1);
    num_cols = size(img, 2);
    pmed_filtered = zeros(num_rows, num_cols, 'uint8');
    c = floor(win_size / 2);
    
    for y=1:num_rows
        for x=1:num_cols
            % Account for x bounds (not using extension since 
            % it would affect the median calculation)
            if x-c < 1
                X = mat_range(img, y, y, 1, x+c);
            elseif x+c >= num_cols
                X = mat_range(img, y, y, x-c, num_cols);
            else
                X = mat_range(img,y, y, x-c, x+c); 
            end
            
            % Account for y bounds (not using extension since 
            % it would affect the median calculation)
            if y-c < 1
                Y = mat_range(img, 1, y+c, x,x);
            elseif y+c >= num_rows
                Y = mat_range(img, y-c, num_rows, x,x);
            else
                Y = mat_range(img, y-c,y+c, x, x);
            end

            % Compute pseudomedian over the 2 vectors
            pmed = plus_pmed(X, Y);
            pmed_filtered(y,x) = pmed;
        end
    end
    