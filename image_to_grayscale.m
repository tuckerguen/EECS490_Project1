function image_to_grayscale(img_name)
    building_color = readraw_color("./Images/" + img_name);
    
    building_gray = rgb_to_gray(building_color);
    
    figure('Name', img_name + " gray", "NumberTitle", "off");
    imshow(building_gray);
    
    writeraw(building_gray, "Images/OUT_grayscale_" + img_name);
