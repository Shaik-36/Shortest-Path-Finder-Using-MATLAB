function h = heuristic(node, goal)
    h = abs(node(1) - goal(1)) + abs(node(2) - goal(2));
end
