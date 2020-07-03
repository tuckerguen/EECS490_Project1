function vec = vec_range(S, i1, i2)
    vec = zeros(i2-i1, 1);
    for i=i1:i2
        vec(i-i1+1) = S(i);
    end
    