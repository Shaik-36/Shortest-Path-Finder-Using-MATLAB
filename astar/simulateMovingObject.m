% Function to create a 2D grid and simulate a moving object
function simulateMovingObject()

    % Create a 5x5 grid with all elements initialized to 0
    grid = zeros(5, 5);

    % Ask the user to select obstacles (1) on the grid
    disp('Select obstacles by clicking on the grid (0 for accessible, 1 for inaccessible):');
    figure;
    imagesc(grid);
    axis equal;
    axis tight;
    colormap(gray);
    
    % Allow the user to click on the grid to select obstacles
    [x, y] = ginput(1);
    while ~isempty(x)
        x = round(x);
        y = round(y);
        
        % Ensure the selected coordinates are within the grid
        if x >= 1 && x <= 5 && y >= 1 && y <= 5
            grid(y, x) = 1;
        else
            disp('Invalid coordinates. Please select again.');
        end
        
        % Update the grid visualization
        imagesc(grid);
        axis equal;
        axis tight;
        colormap(gray);
        
        % Allow the user to click on the grid to select obstacles
        [x, y] = ginput(1);
    end

    % Ask the user to select the start and target positions
    disp('Select the start position by clicking on the grid:');
    [startX, startY] = ginput(1);
    startX = round(startX);
    startY = round(startY);

    disp('Select the target position by clicking on the grid:');
    [targetX, targetY] = ginput(1);
    targetX = round(targetX);
    targetY = round(targetY);

    % Simulate the movement from start to target
    disp('Simulating movement...');
    simulateMovement(grid, [startX, startY], [targetX, targetY]);

end

% Function to simulate movement from start to target
function simulateMovement(grid, start, target)
    [path, success] = findPath(grid, start, target);

    if success
        disp('Path found!');
        disp('Path coordinates:');
        disp(path);
    else
        disp('No path found.');
    end
end

% Function to find a path from start to target using simple DFS
function [path, success] = findPath(grid, start, target)
    path = [];
    success = false;

    if grid(start(2), start(1)) == 1 || grid(target(2), target(1)) == 1
        disp('Invalid start or target position on an obstacle.');
        return;
    end

    visited = false(size(grid));
    [path, success] = dfs(grid, start, target, visited);
end

% Depth-first search (DFS) algorithm
function [path, success] = dfs(grid, current, target, visited)
    path = [];
    success = false;

    if isequal(current, target)
        path = current;
        success = true;
        return;
    end

    [rows, cols] = size(grid);
    visited(current(2), current(1)) = true;

    % Define possible moves (up, down, left, right)
    moves = [0, -1; -1, 0; 0, 1; 1, 0];

    for move = moves'
        next = current + move';

        % Check if the next move is within the grid and has not been visited
        if all(next >= 1) && all(next <= [cols, rows]) && ~visited(next(2), next(1)) && grid(next(2), next(1)) == 0
            [nextPath, success] = dfs(grid, next, target, visited);

            if success
                path = [current; nextPath];
                return;
            end
        end
    end
end

% Call the main function to start the simulation
simulateMovingObject();
