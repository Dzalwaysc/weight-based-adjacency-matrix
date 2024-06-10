function [tau, delta_Delta_STC] = Control(Zeta, Neighbor, Configuration, breve_eta, breve_omega, check_eta, check_omega, delta_Delta_eta, d_delta_Delta_eta, delta_Delta_omega, index, Loop, T)

%% Define variables
Ni = Neighbor{index}; % neighbor set
zeta = Zeta{index}(Loop,:); % weight set
breve_J = reshape( obtain_J(breve_eta{index}(Loop,:)), 3, 3 );
breve_M = diag([12.5, 16.5, 1]);
dagger_1 = (1/ck(20))*breve_M*breve_J';
dagger_2 = 0;
dagger_3 = 0;
delta_Delta_STC = -( d_delta_Delta_eta{index}(Loop,:) + delta_Delta_eta{index}(Loop,:) );
delta_Delta_omega_star = breve_omega{index}(Loop,:) - delta_Delta_eta{index}(Loop,:) - 2*delta_Delta_STC;
% delta_Delta_omega_star = breve_omega{index}(Loop,:) + delta_Delta_eta{index}(Loop,:);

%% Calculate distributed cooperation terms
% High-order observers based on sliding mode control inevitably have chattering phenomena. To reduce chattering, we perform the following operations (a conventional operation of sliding mode observers).
% When we know that we might be under attack (one of the advantages of the consistency of the weight matrix, we can judge whether we might be under attack by the size of our weight).
if zeta(index) < 0.99
    for j = Ni % if j=Ni, then a_{ij}=1, at this time zeta(j)=W_{ij}, if j\ne Ni, then a_{ij}=0, which means W_{ij}=0. Thus, zeta can be used directly for calculation here.
        dagger_2 = dagger_2 + zeta(j) * ( breve_omega{index}(Loop,:) - delta_Delta_STC - check_omega{j}(Loop,:) );
        dagger_3 = dagger_3 + zeta(j) * posPi_2_nagPi( (breve_eta{index}(Loop,:) - delta_Delta_STC - Configuration{index} - check_eta{j}(Loop,:) + Configuration{j}) );
    end
else
    for j = Ni
        dagger_2 = dagger_2 + zeta(j) * ( breve_omega{index}(Loop,:) - check_omega{j}(Loop,:) );
        dagger_3 = dagger_3 + zeta(j) * posPi_2_nagPi( (breve_eta{index}(Loop,:) - Configuration{index} - check_eta{j}(Loop,:) + Configuration{j}) );
    end
end

% The tracking result is very similar, but the control signal will eventually have chattering phenomena.
% for j=Ni
%     dagger_2 = dagger_2 + zeta(j) * posPi_2_nagPi( (breve_eta{index}(Loop,:) - delta_Delta_STC - Configuration{index} - check_eta{j}(Loop,:) + Configuration{j}) );
%     dagger_3 = dagger_3 + zeta(j) * ( breve_omega{index}(Loop,:) - delta_Delta_STC - check_omega{j}(Loop,:) );
% end

%% Calculate the control signal
varsigma = diag([5,5,18]);
tau = -dagger_1 * ( varsigma*dagger_2' + delta_Delta_omega{index}(Loop,:)' + delta_Delta_omega_star'+ varsigma*dagger_3' );