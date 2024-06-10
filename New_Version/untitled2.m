% Parameters
radius = 50; % Radius of the circle
angular_speed = 0.01; % Angular speed in radians per second
total_time = 40; % Total time in seconds
time_step = 0.1; % Time step in seconds

% Time vector
T = 0:time_step:total_time;

% Calculate positions and their derivatives
xx = radius * cos(angular_speed * T + 3*pi/2);
xxd = -radius * angular_speed * sin(angular_speed * T + 3*pi/2);
xxdd = -radius * angular_speed^2 * cos(angular_speed * T + 3*pi/2);

yy = radius + radius * sin(angular_speed * T + 3*pi/2);
yyd = radius * angular_speed * cos(angular_speed * T + 3*pi/2);
yydd = -radius * angular_speed^2 * sin(angular_speed * T + 3*pi/2);

% Plot the circular arc
figure;
plot(xx, yy, 'b-', 'LineWidth', 2);
hold on;
plot(0, 0, 'ro'); % Plot the origin
xlabel('X (m)');
ylabel('Y (m)');
title('Circular Arc with Constant Speed');
grid on;
axis equal;
legend('Trajectory', 'Origin');