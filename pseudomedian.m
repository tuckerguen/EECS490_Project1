function result = pseudomedian(S)
    result = 0.5 * maximin(S) + 0.5 * minimax(S);