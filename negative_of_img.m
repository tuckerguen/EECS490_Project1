function negative_of_img(img_name, plot_colors_separate)
    img = readraw_color("Images/" + img_name);
    
    negative_img = rgb_negative(img);
    
    figure('Name', "Negative " + img_name, "NumberTitle", "off");
    imshow(negative_img);
    figure('Name', "Original " + img_name, "NumberTitle", "off");
    imshow(img);

    % Compute and plot color histogram of original image
    % Change last parameter to true to see the channels on different plots
    plot_color_hist(img, "RGB histogram of original " + img_name, plot_colors_separate);

    % Compute and plot color histogram of negative image
    plot_color_hist(negative_img, "RGB histogram of negative " + img_name, plot_colors_separate);
    
    writeraw_color(negative_img, "Images/OUT_negative_" + img_name);