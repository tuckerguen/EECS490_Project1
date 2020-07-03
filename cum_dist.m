function cumdist = cum_dist(histogram)
    num_entries = size(histogram, 1);
    cumdist = zeros(num_entries, 1);
    cumdist(1) = histogram(1);
    
    for i=2:num_entries
        cumdist(i) = (histogram(i) + cumdist(i-1));
    end
    