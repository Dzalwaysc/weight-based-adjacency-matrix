function [Delta_eta, Delta_omega] = uncertainties(d_Delta_STC, Delta_STC, eta_, eta, uncertainty, tau_for_uncertainties, index, Loop)

Delta_eta = d_Delta_STC{index}(Loop,:)' - Delta_STC{index}(Loop,:)';

R_ = reshape( obtain_R(eta_{index}(Loop,:)), 3, 3 );
R = reshape( obtain_R(eta{index}(Loop,:)), 3, 3 );
act_M = 0.5*reshape( obtain_M(), 3, 3 );
M = reshape( obtain_M(), 3, 3 );

Delta_omega = uncertainty{index}(Loop,:)' + d_Delta_STC{index}(Loop,:)' + tau_for_uncertainties{index}(Loop,:)';

end