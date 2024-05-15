% Main MATLAB script for Path Planning using A* Search Algorithm

% Define grid, source, and goal
grid = generateRandomGrid(5, 5, 0.3);
source = [4, 4];
goal = [0, 0];

% Run A* Search Algorithm
path = AStarSearch(grid, source, goal);

% Display results
disp('Path Coordinates:');
disp(path);
totalCost = calculateTotalCost(path, grid);
disp(['Total Path Cost: ', num2str(totalCost)]);
