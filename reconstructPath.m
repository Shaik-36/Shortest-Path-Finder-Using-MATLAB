function path = reconstructPath(cameFrom, current)
    path = [];
    while isKey(cameFrom, current)
        path = [path; current];
        current = cameFrom(current);
    end
    path = flipud(path);
end
