function min = mymin(A)
    num_rows = size(A, 1);
    num_cols = size(A, 2);
    
    % Initial max is largest value of a floating point number
    min = realmax;
    for i=1:num_rows
        for j=1:num_cols
            val = A(i,j);
            if val < min
                min = val;
            end
        end
    end