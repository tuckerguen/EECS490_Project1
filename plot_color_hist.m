% rgb_img = rgb image to plot histogram of
% name = name/title of your plot
% separate = boolean, plot all channels on separate graph or not
function plot_color_hist(rgb_img, name, separate)
    % Compute color histogram for an image
    % Take histogram for r, g, and b channels
    [r_channel, g_channel, b_channel] = extract_channels(rgb_img);
    r_hist = myhist(r_channel);
    g_hist = myhist(g_channel);
    b_hist = myhist(b_channel);
    
    % Plot on top of each other
    if separate
        figure('Name', "r channel: " + name, "NumberTitle", "off");
        bar(r_hist, 'r');
        figure('Name', "g channel: " + name, "NumberTitle", "off");
        bar(g_hist, 'g');
        figure('Name', "b channel: " + name, "NumberTitle", "off");
        bar(b_hist, 'b');
        xlabel('pixel value');
        ylabel('number pixels');
    else
        figure('Name', name, "NumberTitle", "off");
        hold on;
        bar(r_hist, 'r');
        bar(g_hist, 'g');
        bar(b_hist, 'b');
        xlabel('pixel value');
        ylabel('number pixels');
    end