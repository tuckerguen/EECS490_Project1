function result = maximin(S)
    L = length(S);
    M = floor((L+1)/2);
    mins = zeros(L-M+1, 1);
    
    for i=1:(L-M+1)
        mins(i) = mymin(vec_range(S,i,i+M-1));
    end
    
    result = mymax(mins);