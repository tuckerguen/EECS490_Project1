function combined = combine_channels(r_channel, g_channel, b_channel)
    % Get dimensions (assuming all are of same dimensions)
    % Not going to bother to assert the equality here
    num_rows = size(r_channel, 1);
    num_cols = size(r_channel, 2);
    
    combined = zeros(num_rows, num_cols, 3, 'uint8');
    
    % Add r channel
    for i=1:num_rows
        for j=1:num_cols
            combined(i,j,1) = r_channel(i,j);
        end
    end  
    
    % Add g channel
    for i=1:num_rows
        for j=1:num_cols
            combined(i,j,2) = g_channel(i,j);
        end
    end  
    
    % Add b channel
    for i=1:num_rows
        for j=1:num_cols
            combined(i,j,3) = b_channel(i,j);
        end
    end  
    
  