function safe = isSafe(k, c, m, v)
    indices = find(m(k,:));
    safe = all(v(indices) ~= c);
end