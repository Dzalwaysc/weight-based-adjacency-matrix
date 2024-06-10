function [Delta_eta, Delta_omega] = Lumped_Uncertainties(d_Delta_STC, Delta_STC, breve_eta, eta, Mathcal_F, breve_tau, P_tau, index, Loop)

Delta_eta = d_Delta_STC{index}(Loop,:)' - Delta_STC{index}(Loop,:)';

J = reshape( obtain_J(eta{index}(Loop,:) ), 3, 3 );
M = reshape( obtain_M(), 3, 3 );

breve_R = reshape( obtain_J(breve_eta{index}(Loop,:)), 3, 3 );
breve_M = diag([12.5, 16.5, 1]);

Mathcal_T = J * inv(M) * breve_tau{index}(Loop, :)' - breve_R * inv(breve_M) * P_tau{index}(Loop,:)' + d_Delta_STC{index}(Loop,:)';

Delta_omega = Mathcal_F{index}(Loop,:)' + Mathcal_T;

end