function nonlinear_noise_remove(img_name, window_size)
    rose_noise = readraw_color("Images/rose_color_noise.raw");
    
    % separate channels
    [r_channel, g_channel, b_channel] = extract_channels(rose_noise);
    % Filter each channel
    r_filtered = pseudomedian_filter(r_channel, window_size);
    g_filtered = pseudomedian_filter(g_channel, window_size);
    b_filtered = pseudomedian_filter(b_channel, window_size);
    % Combine channels
    filtered = combine_channels(r_filtered, g_filtered, b_filtered);
    
    figure("Name", img_name + " before filtering", "NumberTitle", "off");
    imshow(rose_noise);
    
    figure("Name", img_name + " pseudomedian filtered", "NumberTitle", "off");
    imshow(filtered);
    
    writeraw_color(filtered, "Images/OUT_nonlinear_removed_" + img_name);
    