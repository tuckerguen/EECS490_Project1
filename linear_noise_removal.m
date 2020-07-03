function linear_noise_removal(img_name, mask)
    rose_uni = readraw("Images/" + img_name);
    
    filtered = convolve(rose_uni, mask);
    
    % Show images
    figure("Name", img_name + " before linear noise removal", "NumberTitle", "off");
    imshow(rose_uni);
    figure("Name", img_name + " after linear noise removal", "NumberTitle", "off");
    imshow(filtered);
    
    writeraw(filtered, "Images/OUT_linear_noise_removed_" + img_name);
