function full_linear_scale(img_name)
    rose_dark = readraw("Images/" + img_name);

    % Apply full range linear scaling 
    rose_scaled = linear_scale(rose_dark);

    figure('Name', img_name + " linear scaled image", "NumberTitle", "off");
    imshow(rose_scaled);

    % Plot histogram of original image
    original_h = myhist(rose_dark);
    figure('Name', img_name + " original histogram", "NumberTitle", "off");
    bar(original_h);
    xlabel('pixel value');
    ylabel('number pixels');

    % Plot histogram of linearly scaled image
    scaled_h = myhist(rose_scaled);
    figure('Name', img_name + " linear scaled histogram", "NumberTitle", "off");
    bar(scaled_h);
    xlabel('pixel value');
    ylabel('number pixels');

    % Plot transfer function
    plot_linear_scale_transfer_function(rose_dark, ...
        img_name + " linear scale transfer function");
    
    writeraw(rose_scaled, "Images/OUT_linear_scaled_" + img_name);