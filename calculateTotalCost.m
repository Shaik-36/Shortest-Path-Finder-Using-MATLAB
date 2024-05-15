function cost = calculateTotalCost(path, grid)
    cost = 0;
    for i = 1:length(path)-1
        cost = cost + costFunction(path(i), path(i+1), grid);
    end
end
