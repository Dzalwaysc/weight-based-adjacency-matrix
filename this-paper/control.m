function [tau, hat_Delta_STC, tau_for_uncertainties] = control(Zeta, Neighbor, Configuration, eta_, deta_, eta__, deta__, delta_Delta_eta, d_delta_Delta_eta, delta_Delta_omega, index, Loop, T)

Ni = Neighbor{index};
zeta = Zeta{index}(Loop,:);

%% 计算辅助变量
z1 = 0;
z2 = 0;
hat_Delta_STC = (d_delta_Delta_eta{index}(Loop,:) + delta_Delta_eta{index}(Loop,:));

if index == 5
    for j=Ni
        z1 = z1 + zeta(j) * constraint_ang( (eta_{index}(Loop,:) + hat_Delta_STC - Configuration{index} - eta__{j}(Loop,:) + Configuration{j}) );
        z2 = z2 + zeta(j) * ( deta_{index}(Loop,:) + hat_Delta_STC - deta__{j}(Loop,:) );
    end
else
    for j=Ni
        z1 = z1 +  zeta(j) * constraint_ang( eta_{index}(Loop,:) - Configuration{index} - eta__{j}(Loop,:) + Configuration{j} );
        z2 = z2 + zeta(j) * ( deta_{index}(Loop,:) - deta__{j}(Loop,:) );
    end
end

% for j=Ni
%     z1 = z1 + zeta(j) * constraint_ang( (eta_{index}(Loop,:) + hat_Delta_STC - Configuration{index} - eta__{j}(Loop,:) + Configuration{j}) );
%     z2 = z2 + zeta(j) * ( deta_{index}(Loop,:) + hat_Delta_STC - deta__{j}(Loop,:) );
% end

%% 计算控制器
varsigma = diag([50,50,180]);
R = reshape( obtain_R(eta_{index}(Loop,:)), 3, 3 );
M = 0.5*reshape( obtain_M(), 3, 3 );

% tau = -M*R'*(delta_Delta_omega{index}(end,:)' + varsigma*z2' + varsigma*z1' + delta_Delta_eta{index}(Loop,:)' + deta_{index}(Loop,:)');
tau = M*R'*(varsigma*z2' + varsigma*z1'- delta_Delta_omega{index}(Loop,:)' + deta_{index}(Loop,:)' + delta_Delta_eta{index}(Loop,:)');
% tau = -M*R'*(dR*V_{index}(end,:)' + varsigma*z2' + varsigma*gamma*z1');

tau_for_uncertainties = - 0.05 * R * inv(M) * tau;

tau = tau + 12*sin(pi/2*T/10)*ones(3,1);
for i=1:2
    if abs(tau(i)) > 10
        tau(i) = sign(tau(i)) * 10;
    end
end

for i=3
    if abs(tau(i)) > 10
        tau(i) = sign(tau(i)) * 10;
    end
end