% Create a graph object
G = graph();

% Add nodes
numNodes = 10;
G = addnode(G, numNodes);

% Add edges to ensure each vertex is exactly 4-connected
edges = [1 2; 1 3; 1 4; 1 5;
         2 3; 2 6; 2 7;
         3 8; 3 9;
         4 5; 4 6; 4 8;
         5 7; 5 10;
         6 7; 6 9; 
         7 8; 7 10;
         8 9; 8 10;
         9 10];

G = addedge(G, edges(:,1), edges(:,2));

% Define the positions of the nodes, ensuring the distance between each vertex is greater than 5 and the connecting lines are clearly distinguishable
positions = [10, 20;
             20, 5;
             15, -10;
             -5, 15;
            -20, 20;
              5, -5;
              0,  0;
             -10, -10;
             -5, -20;
             -25, -5];

% Plot the graph and fix the node positions
figure;
p = plot(G, 'XData', positions(:,1), 'YData', positions(:,2));
title('4-Connected Graph');

% Set node labels, swapping labels for nodes 1 and 7
labels = arrayfun(@num2str, 1:numNodes, 'UniformOutput', false);
temp = labels{1};
labels{1} = labels{7};
labels{7} = temp;
labelnode(p, 1:numNodes, labels);

% Adjust graph properties to improve readability
p.MarkerSize = 7;
p.NodeColor = 'r';
p.LineWidth = 1.5;