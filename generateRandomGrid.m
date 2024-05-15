function grid = generateRandomGrid(rows, cols, obstacleProbability)
    grid = rand(rows, cols) > obstacleProbability;
end
