function max = mymax(A)
    num_rows = size(A, 1);
    num_cols = size(A, 2);
    
    % Initial max is smallest value of a floating point number
    max = realmin;
    for i=1:num_rows
        for j=1:num_cols
            val = A(i,j);
            if val > max
                max = val;
            end
        end
    end
        