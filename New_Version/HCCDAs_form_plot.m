% Define the time interval
t = 0:0.01:50;

% Compute Δ₄ᶜᵀᴬ
Delta_4_CTA = 12 * sin(t * pi / 20);

% Compute Δ₄ˢᵀᶜ
Delta_4_STC = 10^(-1) * t .* [4; 4; 0.1*pi];

% Function for S_m^t0
S_m = @(t, t0) 1 ./ (10 * exp(-10 * (t - t0)) + 1);

% Compute Δ₄ᵛᵀᵛ
Delta_4_VTV = (S_m(t, 15) + 10 * S_m(t, 15) .* (1 - S_m(t, 30)) + 100 * S_m(t, 30)) .* cos(pi * t / 120) .* [2; 1; 0.1*pi];


% % Plotting
% figure('Position', [100, 100, 1200, 300]);

% Plot Δ₄ᶜᵀᴬ
figure(1)
plot(t, Delta_4_CTA, 'LineWidth', 2);
title('$\Delta_{4}^{\rm{CTA}}$', 'Interpreter', 'latex');
xlim([0,50]);
xlabel('$t$(s)', 'Interpreter', 'latex');
set(gca, 'FontSize', 20);
grid on;

% Plot Δ₄ˢᵀᶜ
figure(2)
plot(t, Delta_4_STC(1,:), 'LineWidth', 2);
title('$\Delta_{4}^{\rm{STC}}$', 'Interpreter', 'latex');
xlim([0,50]);
xlabel('$t$(s)', 'Interpreter', 'latex');
set(gca, 'FontSize', 20);
grid on;

% Plot Δ₄ᵛᵀᵛ (just one component for simplicity)
figure(3)
plot(t, Delta_4_VTV(1,:), 'LineWidth', 2);
title('$\Delta_{4}^{\rm{VTV}}$', 'Interpreter', 'latex');
xlim([0,50]);
xlabel('$t$(s)', 'Interpreter', 'latex');
set(gca, 'FontSize', 20);
grid on;