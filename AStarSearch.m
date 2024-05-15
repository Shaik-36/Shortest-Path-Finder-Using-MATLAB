function path = AStarSearch(grid, start, goal)
    openSet = containers.Map('KeyType', 'char', 'ValueType', 'double');
    openSet(char(start)) = heuristic(start, goal);
    cameFrom = containers.Map('KeyType', 'char', 'ValueType', 'double');
    gScore = containers.Map('KeyType', 'char', 'ValueType', 'double');
    fScore = containers.Map('KeyType', 'char', 'ValueType', 'double');

    % Initialization
    gScore(char(start)) = 0;
    fScore(char(start)) = heuristic(start, goal);

    while ~isempty(openSet)
        current = getLowestFScore(openSet, fScore);

        if isequal(current, goal)
            path = reconstructPath(cameFrom, current);
            return;
        end

        openSet.remove(char(current));
        neighbors = getNeighbors(current, grid);
        for i = 1:size(neighbors, 1)
            neighbor = neighbors(i, :);
            tentative_gScore = gScore(char(current)) + costFunction(current, neighbor, grid);

            if ~isKey(gScore, char(neighbor)) || tentative_gScore < gScore(char(neighbor))
                cameFrom(char(neighbor)) = current;
                gScore(char(neighbor)) = tentative_gScore;
                fScore(char(neighbor)) = gScore(char(neighbor)) + heuristic(neighbor, goal);

                if ~openSet.isKey(char(neighbor))
                    openSet(char(neighbor)) = fScore(char(neighbor));
                end
            end
        end
    end

    path = "No path found";
end

function node = getLowestFScore(openSet, fScore)
    values = cell2mat(values(openSet));
    [~, index] = min(values);
    keys = cell2mat(keys(openSet));
    node = str2num(keys(index, :)); % Convert back to numeric array
end
