function [new_delta_eta, new_delta_Delta_eta, d_delta_Delta_eta, new_delta_omega, new_delta_Delta_omega, P_tau] = Estimation(eta_, deta_, delta_eta, delta_Delta_eta, delta_omega, delta_Delta_omega, tau, index, Loop, dt)

%% kinematic layer
alpha0 = diag([3.5,4.5,2.5]); alpha1 = diag([3.5,4.5,2.5]);
sigma0 = -sig(delta_eta{index}(Loop,:)-eta_{index}(Loop,:), 1/2)* alpha0 + delta_Delta_eta{index}(Loop,:);
d_delta_eta = deta_{index}(Loop,:) + sigma0;

%% Conventional approach to reducing chattering in sliding mode control is to introduce the sigmoid function sig(.) to replace the sign function sign(.).
d_delta_Delta_eta = -sig(delta_Delta_eta{index}(Loop,:) - sigma0, 1) * alpha1; 

%% Results using sign(.) are very similar, but the output control signal exhibits chattering.
% d_delta_Delta_eta = -sign(delta_Delta_eta{index}(Loop,:) - sigma0) * alpha1;

new_delta_eta = delta_eta{index}(Loop,:) + d_delta_eta*dt;
new_delta_Delta_eta = delta_Delta_eta{index}(Loop,:) + d_delta_Delta_eta*dt;


%% dynamic layer
alpha3 = diag([3.5,4.5,2.5]); alpha4 = diag([3.5,4.5,2.5]);
sigma2 = -sig(delta_omega{index}(Loop,:)-deta_{index}(Loop,:), 1/2)* alpha3 + delta_Delta_omega{index}(Loop,:);

breve_M = diag([12.5, 16.5, 1]);
breve_J = reshape( obtain_J(eta_{index}(Loop,:)), 3, 3 );
P_tau = DOZM(tau{index}(Loop,:));
d_delta_omega = P_tau*inv(breve_M)'*breve_J' + sigma2;

%% Conventional approach to reducing chattering in sliding mode control is to introduce the sigmoid function sig(.) to replace the sign function sign(.).
d_delta_Delta_omega = -sig(delta_Delta_omega{index}(Loop,:) - sigma2, 1)*alpha4;

%% Results using sign(.) are very similar, but the output control signal exhibits chattering.
% d_delta_Delta_omega = -sign(delta_Delta_omega{index}(Loop,:) - sigma2)*alpha4;

new_delta_omega = delta_omega{index}(Loop,:) + d_delta_omega*dt;
new_delta_Delta_omega = delta_Delta_omega{index}(Loop,:) + d_delta_Delta_omega*dt;
end