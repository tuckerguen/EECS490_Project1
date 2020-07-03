function output = mat_range(mat, y0, yend, x0, xend)
    output = zeros(yend-y0, xend-x0);
    for i=y0:yend
        for j=x0:xend
            output(i-y0+1, j-x0+1) = mat(i, j);
        end
    end