function [Eta_, dEta_, Eta__, dEta__] = state_underHCFs(Eta, dEta, Delta_STC, Delta_VTV, index, Loop)
%% STC通道受扰
Eta_ = Eta{index}(Loop,:) + Delta_STC{index}(Loop,:);
dEta_ = dEta{index}(Loop,:) + Delta_STC{index}(Loop,:);

%% VTV通道受扰
Eta__ = Eta_ + Delta_VTV{index}(Loop,:);
% Eta__ = Eta_;
dEta__ = dEta_ + Delta_VTV{index}(Loop,:);
% dEta__ = dEta_;