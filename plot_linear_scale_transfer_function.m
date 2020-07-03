function plot_linear_scale_transfer_function(img, name)
    % Set default gmax and gmin (since this is full linear scaling)    
    gmin = uint8(0);
    gmax = uint8(255);
    
    % get max and min values over image
    fmin = mymin(img);
    fmax = mymax(img);
    img_range = fmax-fmin;
    
    % init X values to be the range from fmin to fmax
    X = zeros(img_range, 1);
    for i=1:img_range
        X(i) = fmin+i-1;
    end
    
    % Compute linearly scaled value for all values from fmin to fmax
    Y = zeros(img_range, 1);
    for i=1:img_range
        f = X(i);
        val = gmin + ((gmax-gmin) / (fmax-fmin))*(f-fmin);
        Y(i) = val;
    end
    
    figure('Name', name, "NumberTitle", "off");
    plot(X, Y);
    xlabel('original image value');
    ylabel('output image value');
