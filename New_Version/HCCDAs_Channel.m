function [breve_eta, breve_omega, check_eta, check_omega] = HCCDAs_Channel(eta, omega, Delta_STC, Delta_VTV, index, Loop)
%% STC Channel
breve_eta = eta{index}(Loop,:) + Delta_STC{index}(Loop,:);
breve_omega = omega{index}(Loop,:) + Delta_STC{index}(Loop,:);

%% VTV Channel
check_eta = breve_eta + Delta_VTV{index}(Loop,:);
check_omega = breve_omega + Delta_VTV{index}(Loop,:);