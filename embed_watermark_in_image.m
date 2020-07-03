function embed_watermark_in_image(img_name, wtrmk_name, is_color)
    if is_color
        % Embed color watermark in color image
        building_color = readraw_color("Images/" + img_name);
        watermark_color = readraw_color("Images/" + wtrmk_name);
        
        embedded_color = embed_image(building_color, watermark_color, true);
        
        figure('Name', "embedded_color", "NumberTitle", "off");
        imshow(embedded_color);
        
        writeraw_color(embedded_color, "Images/OUT_embedded_color_" + img_name);
    else
        % Embed gray watermark in gray image
        building_color = readraw_color("./Images/" + img_name);
        building_gray = rgb_to_gray(building_color);
        watermark_gray = readraw("./Images/" + wtrmk_name);
        
        embedded_gray = embed_image(building_gray, watermark_gray, false);
        
        figure('Name', "embedded_gray", "NumberTitle", "off");
        imshow(embedded_gray);
        
        writeraw(embedded_gray, "Images/OUT_embedded_gray_" + img_name);
    end
