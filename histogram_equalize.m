function histogram_equalize(img_name)
    img = readraw("Images/" + img_name);
    % Get histogram for image
    hist = myhist(img);
    % Equalize the histogram of the image
    [equalized, transfer_fcn_X, transfer_fcn_Y] = histeq(img, hist);
    
    % Display image 
    figure("Name", img_name + " histogram equalized image", "NumberTitle", "off");
    imshow(equalized);
    % Display histogram
    newhist = myhist(equalized);
    figure("Name", img_name + " histogram equalized histogram", "NumberTitle", "off");
    bar(newhist);
    xlabel('pixel value');
    ylabel('number pixels');
    
    % Plot transfer function
    figure("Name", ...
        img_name + " histogram equalization transfer function",...
        "NumberTitle", "off");
    plot(transfer_fcn_X, transfer_fcn_Y);
    xlabel('input pixel value');
    ylabel('output pixel value');
    
    writeraw(equalized, "Images/OUT_histogram_equalized_" + img_name);