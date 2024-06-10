% Assume t is a defined time vector
t = linspace(0, 45, 1000); % For example, from 0 to 45 seconds, 1000 points

% Initialize the Dleta_plot matrix
Dleta_plot = zeros(size(t, 2), 3);

% Define the sigmoid function for smooth transition
sigmoid = @(x) 1./(1 + exp(-x));

% Parameters for smooth transition, controlling the transition speed
k = 10; % Adjust this parameter to control the "steepness" of the transition

% Calculate the value for each time point in a loop
for i = 1:length(t)
    % Calculate the weight of each segment
    w1 = sigmoid(k*(15-t(i))); % Transition between the first and second segments
    w2 = sigmoid(k*(t(i)-15)) * (1-sigmoid(k*(t(i)-30))); % Transition between the second and third segments
    w3 = sigmoid(k*(t(i)-30)); % Starting from the third segment
    
    % Calculate the weighted average
    Dleta_plot(i, :) = w1 .* [0.2*cos(pi/2*t(i)/60), 0.1*cos(pi/2*t(i)/60), 0.01*pi*cos(pi/2*t(i)/60)] + ...
                        w2 .* [2*cos(pi/2*t(i)/60), 1*cos(pi/2*t(i)/60), 0.1*pi*cos(pi/2*t(i)/60)] + ...
                        w3 .* [20*cos(pi/2*t(i)/60), 10*cos(pi/2*t(i)/60), pi*cos(pi/2*t(i)/60)];
end

% Plotting
plot(t, Dleta_plot(:,1), t, Dleta_plot(:,2), t, Dleta_plot(:,3));
legend('Component 1', 'Component 2', 'Component 3');
xlabel('Time (s)');
ylabel('Value');
title('Continuous Transition of Dleta\_plot');
