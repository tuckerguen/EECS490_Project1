% CHANGE FROM NARGIN TO ENUM
function new = fcn_on_matrix(img, f)
    num_rows = size(img,1);
    num_cols = size(img,2);
    if nargin(f) == 3
        new = zeros(num_rows, num_cols, 'uint8');
    else
        new = img;
    end
    
    if size(img,3) == 3
        for i=1:num_rows
            for j=1:num_cols
                r = img(i,j,1);
                g = img(i,j,2);
                b = img(i,j,3);  
                %rgb to rgb
                if nargin(f) == 1
                    new(i,j,1) = f(r);
                    new(i,j,2) = f(g);
                    new(i,j,3) = f(b);
                %rgb to grayscale
                elseif nargin(f) == 3
                    new(i,j) = f(r,g,b);
                end
            end
        end
    else
        %grayscale to grayscale
        for i=1:num_rows
            for j=1:num_cols
                new(i,j) = f(img(i,j));
            end
        end
    end