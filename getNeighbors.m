function neighbors = getNeighbors(node, grid)
    [rows, cols] = size(grid);
    neighbors = [];

    % Check North
    if node(1) > 1 && grid(node(1)-1, node(2)) == 0
        neighbors = [neighbors; [node(1)-1, node(2)]];
    end

    % Check South
    if node(1) < rows && grid(node(1)+1, node(2)) == 0
        neighbors = [neighbors; [node(1)+1, node(2)]];
    end

    % Check West
    if node(2) > 1 && grid(node(1), node(2)-1) == 0
        neighbors = [neighbors; [node(1), node(2)-1]];
    end

    % Check East
    if node(2) < cols && grid(node(1), node(2)+1) == 0
        neighbors = [neighbors; [node(1), node(2)+1]];
    end
end
