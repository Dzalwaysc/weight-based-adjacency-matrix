function [new_delta_eta, new_delta_Delta_eta, d_delta_Delta_eta, new_delta_omega, new_delta_Delta_omega] = adaptive(eta_, deta_, delta_eta, delta_Delta_eta, delta_omega, delta_Delta_omega, tau, index, Loop, dt)

%% 第一层
% alpha0 = diag([0.1,0.1,0.1]); alpha1 = diag([0.1,0.1,0.1]);
alpha0 = diag([3.5,4.5,2.5]); alpha1 = diag([3.5,4.5,2.5]);
sigma0 = -sig(delta_eta{index}(Loop,:)-eta_{index}(Loop,:), 1/2)* alpha0 + delta_Delta_eta{index}(Loop,:);
d_delta_eta = deta_{index}(Loop,:) + sigma0;

d_delta_Delta_eta = -sig(delta_Delta_eta{index}(Loop,:) - sigma0, 1) * alpha1;

new_delta_eta = delta_eta{index}(Loop,:) + d_delta_eta*dt;
new_delta_Delta_eta = delta_Delta_eta{index}(Loop,:) + d_delta_Delta_eta*dt;


%% 第二层
alpha3 = diag([3.5,4.5,2.5]); alpha4 = diag([3.5,4.5,2.5]);
% alpha3 = diag([0.1,0.1,0.1]); alpha4 = diag([0.1,0.1,0.1]);
sigma2 = -sig(delta_omega{index}(Loop,:)-deta_{index}(Loop,:), 1/2)*alpha3 + delta_Delta_omega{index}(Loop,:);

R = reshape( obtain_R(eta_{index}(Loop,:)), 3, 3);
M = 0.5* reshape( obtain_M(), 3, 3);
d_delta_omega = tau{index}(Loop,:)*inv(M)'*R'+sigma2;

d_delta_Delta_omega = -sig(delta_Delta_omega{index}(Loop,:) - sigma2, 1)*alpha4;

new_delta_omega = delta_omega{index}(Loop,:) + d_delta_omega*dt;
new_delta_Delta_omega = delta_Delta_omega{index}(Loop,:) + d_delta_Delta_omega*dt;
end