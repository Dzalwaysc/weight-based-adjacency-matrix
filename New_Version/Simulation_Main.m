clear all

% %% Graph Contribution, 2-Connected. In Matlab, the indexing starts from 1, with 1 being the leader label
% Neighbor{1} = [2,5]; Neighbor{2} = [1,3];  Neighbor{3} = [2,4];
% Neighbor{4} = [3,5]; Neighbor{5} = [1,4];
% 
% Configuration{1} = [0, 0, 0]; Configuration{2} = [0, 5, 0]; Configuration{3} = [5, 0, 0];
% Configuration{4} = [0, -5, 0]; Configuration{5} = [-5, 0, 0];


%% Graph Contribution, 4-Connnected. In Matlab, the indexing starts from 1, with 1 being the leader label
Neighbor{1} = [2,5,6,8,10]; Neighbor{2} = [1,3,6,7];  Neighbor{3} = [7,2,8,9];
Neighbor{4} = [5,6,7,8]; Neighbor{5} = [1,4,7,10]; Neighbor{6} = [1,2,4,9];
Neighbor{7} = [2,3,4,5]; Neighbor{8} = [1,3,4,9,10]; Neighbor{9} = [3,6,8,10]; Neighbor{10} = [1,5,8,9];

Configuration{1} = [0, 0, 0]; Configuration{2} = [20, 5, 0]; Configuration{3} = [15, -10, 0];
Configuration{4} = [-5, 15, 0]; Configuration{5} = [-20, 20, 0]; Configuration{6} = [5, -5, 0];
Configuration{7} = [10, 20, 0]; Configuration{8} = [-12, -12, 0]; Configuration{9} = [-5, -20, 0]; Configuration{10} = [-25, -5, 0];

%% First Loop, i.e., t = 0, initialize all parameters
Loop = 1; % Loop Count
dt = 0.001; % Step Size
T = 0*dt; % Current Time
N = 10; % Number of members

% % Initialize states - 2-Connected
% init_eta(1,:) = [0, 0, 0]; init_eta(2,:) = [0, 5, 330*pi/180]; init_eta(3,:) = [2.5, 0.5, 30*pi/180];
% init_eta(4,:) = [-0.3, -3, 30*pi/180]; init_eta(5,:) = [-3.2, 0.2, 10*pi/180];
% 
% init_vartheta(1,:) = [0, 0, 0]; init_vartheta(2,:) = [0.3, 0.2, 0]; init_vartheta(3,:) = [0.8, 0.1, 0];
% init_vartheta(4,:) = [0.1, 0, 0]; init_vartheta(5,:) = [0.25, 0, 0];

% Initialize states - 4-Connected
init_eta(1,:) = [0, 0, 45*pi/180]; init_eta(2,:) = [20.3, 4.9, 50*pi/180]; init_eta(3,:) = [16.2, -9.4, 46*pi/180];
init_eta(4,:) = [-5.5, 15.4, 48*pi/180]; init_eta(5,:) = [-21, 20, 42*pi/180]; init_eta(6,:) = [4.2, -4.2, 41*pi/180];
init_eta(7,:) = [10.1, 19.8, 45.5*pi/180];  init_eta(8,:) = [-13, -13, 30*pi/180]; init_eta(9,:) = [-5.9, -19, 43*pi/180]; init_eta(10,:) = [-24, -6.5, -120*pi/180];

init_vartheta(1,:) = [0, 0, 0]; init_vartheta(2,:) = [0, 0, 0]; init_vartheta(3,:) = [0, 0, 0];
init_vartheta(4,:) = [0, 0, 0]; init_vartheta(5,:) = [0, 0, 0]; init_vartheta(6,:) = [0, 0, 0];
init_vartheta(7,:) = [0, 0, 0]; init_vartheta(8,:) = [0, 0, 0]; init_vartheta(9,:) = [0, 0, 0]; init_vartheta(10,:) = [0, 0, 0];

% Initialize control signals, estimations, weights, and solve the initial state iteration
for i=1:N
    % Initialize control signals, estimations
    tau{i}(Loop,:) = [0, 0, 0];
    P_tau{i}(Loop,:) = [0, 0, 0];
    breve_tau{i}(Loop,:) = [0, 0, 0];
    delta_breve_eta{i}(Loop,:) = [0, 0, 0]; delta_Delta_eta{i}(Loop,:) = [0, 0, 0]; d_delta_Delta_eta{i}(Loop,:) = [0, 0, 0]; 
    delta_breve_omega{i}(Loop,:) = [0, 0, 0]; delta_Delta_omega{i}(Loop,:) = [0, 0, 0];
    delta_Delta_STC{i}(Loop,:) = [0, 0, 0];

    % Initialize weights
    sigma{i}(Loop,:) = zeros(1,N); Zeta{i}(Loop,:) = zeros(1,N);
    for j=Neighbor{i}
        Zeta{i}(Loop,j) = 1;
    end

    % solve the initial state iteration
    [eta{i}(Loop,:), omega{i}(Loop,:), vartheta{i}(Loop,:), Mathcal_F{i}(Loop,:)] ...
                = plant(init_eta(i,:)', init_vartheta(i,:)', breve_tau{i}(Loop,:)', dt, 1);
end

%% Initialize HCCDAs
for i = 1:N
    Delta_STC{i}(Loop,:) = zeros(1, 3); d_Delta_STC{i}(Loop,:) = zeros(1, 3);
    Delta_VTV{i}(Loop,:) = zeros(1, 3);
    Delta_CTA{i}(Loop,:) = zeros(1, 3);
end

% 1-th member is attacked (In Matlab, the indexing starts from 1, with 1 being the leader label)
Delta_STC{2}(Loop+1,:) = [sin(pi/2*T/30), cos(pi/2*T/30), 5*pi*sin(pi/2*T/60)/180]; 
d_Delta_STC{2}(Loop+1,:) = [pi/60*cos(pi/2*T/30), -pi/60*sin(pi/2*T/30), 5*pi*pi/120*cos(pi/2*T/60)/180];
Delta_VTV{2}(Loop+1,:) = [1, 1, 5*pi/180];
Delta_CTA{2}(Loop+1,:) = [5, 5, 5];

% 4-th member is attacked
Delta_STC{5}(Loop+1,:) = [0.4*T, 0.4*T, 0.01*pi*T]; d_Delta_STC{5}(Loop+1,:) = [0.4, 0.4, 0.01*pi];

sigmoid = @(x) 1./(1 + exp(-x));
k = 10;
w1 = sigmoid(k*(15-T) ); 
w2 = sigmoid(k*(T-15) ) * (1-sigmoid(k*(T-30) ) );
w3 = sigmoid(k*(T-30) );
Delta_VTV{5}(Loop+1, :) = w1 .* [0.2*cos(pi/2*T/60), 0.1*cos(pi/2*T/60), 0.01*pi*cos(pi/2*T/60)] + ...
                    w2 .* [2*cos(pi/2*T/60), 1*cos(pi/2*T/60), 0.1*pi*cos(pi/2*T/60)] + ...
                    w3 .* [20*cos(pi/2*T/60), 10*cos(pi/2*T/60), pi*cos(pi/2*T/60)];
Delta_CTA{5}(Loop+1, :) = 12*sin(pi/2*T/10)*ones(1,3);

% 9-th member is attacked
Delta_STC{10}(Loop+1,:) = 0.1*[1, 1, pi/180]; 
d_Delta_STC{10}(Loop+1,:) = [0, 0, 0];
Delta_VTV{10}(Loop+1,:) = [0.2*cos(pi/2*T/20), 0.1*cos(pi/2*T/20), 0.01*pi*cos(pi/2*T/20)];
Delta_CTA{10}(Loop+1,:) = 0.1 * T * ones(1,3);

for index = 1:N
    [breve_eta{index}(Loop,:), breve_omega{index}(Loop,:), check_eta{index}(Loop,:), check_omega{index}(Loop,:)] ...
        = HCCDAs_Channel(eta, omega, Delta_STC, Delta_VTV, index, 1);
    
    [Delta_eta{i}(Loop,:), Delta_omega{i}(Loop,:)] ...
        = Lumped_Uncertainties(d_Delta_STC, Delta_STC, breve_eta, eta, Mathcal_F, tau, P_tau, index, 1);

    err{index}(Loop,:) = posPi_2_nagPi( eta{index}(Loop,:) - eta{1}(Loop,:) - Configuration{index} );
    derr{index} = omega{index} - omega{1};
end

%% Iteration
AT = 50;
Time = linspace(0, AT+dt, AT/dt+1); Tk = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
for i=1:AT/dt
    T = i*dt;
    
    % Set the sampling time of the sensing devices
    Tk = Dwell_Time(Tk, Loop);

    %$ HCCDAs
    for index = 1:N
        Delta_STC{index}(Loop+1,:) = zeros(1, 3); d_Delta_STC{index}(Loop+1,:) = zeros(1, 3);
        Delta_VTV{index}(Loop+1,:) = zeros(1, 3);
        Delta_CTA{index}(Loop+1,:) = zeros(1, 3);
    end
    
    % 1-th member attack
    Delta_STC{2}(Loop+1,:) = [sin(pi/2*T/30), cos(pi/2*T/30), 5*pi*sin(pi/2*T/60)/180]; 
    d_Delta_STC{2}(Loop+1,:) = [pi/60*cos(pi/2*T/30), -pi/60*sin(pi/2*T/30), 5*pi*pi/120*cos(pi/2*T/60)/180];
    Delta_VTV{2}(Loop+1,:) = [1, 1, 5*pi/180];
    Delta_CTA{2}(Loop+1,:) = [5, 5, 5];

    % 4-th member attack
    Delta_STC{5}(Loop+1,:) = [0.4*T, 0.4*T, 0.01*pi*T]; d_Delta_STC{5}(Loop+1,:) = [0.4, 0.4, 0.01*pi];

    sigmoid = @(x) 1./(1 + exp(-x));
    k = 10;
    w1 = sigmoid(k*(15-T) ); 
    w2 = sigmoid(k*(T-15) ) * (1-sigmoid(k*(T-30) ) );
    w3 = sigmoid(k*(T-30) );
    Delta_VTV{5}(Loop+1, :) = w1 .* [0.2*cos(pi/2*T/60), 0.1*cos(pi/2*T/60), 0.01*pi*cos(pi/2*T/60)] + ...
                        w2 .* [2*cos(pi/2*T/60), 1*cos(pi/2*T/60), 0.1*pi*cos(pi/2*T/60)] + ...
                        w3 .* [20*cos(pi/2*T/60), 10*cos(pi/2*T/60), pi*cos(pi/2*T/60)];

    Delta_CTA{5}(Loop+1, :) = 12*sin(pi/2*T/10)*ones(1,3);

    % 9-th member attack
    Delta_STC{10}(Loop+1,:) = 0.1*[1, 1, pi/180]; d_Delta_STC{10}(Loop+1,:) = [0, 0, 0];
    Delta_VTV{10}(Loop+1,:) = [0.2*cos(pi/2*T/20), 0.1*cos(pi/2*T/20), 0.01*pi*cos(pi/2*T/20)];
    Delta_CTA{10}(Loop+1,:) = 0.1 * T * ones(1,3);
    
    %% Update the states after being attacked
    for index = 1:N
        [breve_eta{index}(Loop+1,:), breve_omega{index}(Loop+1,:), check_eta{index}(Loop+1,:), check_omega{index}(Loop+1,:)] ...
            = HCCDAs_Channel(eta, omega, Delta_STC, Delta_VTV, index, Loop);
    end

    %% Iteration of Leader
    % 2-Connected
%     xx = 0.5*T; xxd = 0.5; xxdd = 0;
%     yy = 3*sin(xx*pi/15); yyd = 3*pi/15*cos(xx*pi/15); yydd = -3*(pi/15)*(pi/15)*sin(xx*pi/15);
%     fai = atan2(yyd, xxd); faid = (-xxdd*yyd + xxd*yydd)/(xxd^2+yyd^2);

    % 4-Connected
    xx = 0.1*T; xxd = 0.1; xxdd = 0;
    yy = 0.1*T; yyd = 0.1; yydd = 0;
    fai = atan2(yyd, xxd); faid = (-xxdd*yyd + xxd*yydd)/(xxd^2+yyd^2);

    J_1 = reshape(obtain_J([xx, yy, fai]),3, 3);
    eta{1}(Loop+1,:) = [xx, yy, fai]; vartheta{1}(Loop+1,:) = [xxd, yyd, faid]*J_1'; omega{1}(Loop+1,:) = [xxd, yyd, faid]; 

    Mathcal_F{1}(Loop+1,:) = [0, 0, 0]; tau{1}(Loop+1,:) = [0, 0, 0]; breve_tau{1}(Loop+1,:) = [0, 0, 0]; P_tau{1}(Loop+1,:) = [0, 0, 0];
    [Zeta{1}(Loop+1,:), sigma{1}(Loop+1,:)] = Weight_Matrix(Zeta, sigma, Neighbor, N, Delta_STC, Delta_VTV, 1, dt, Loop, Tk);
    delta_breve_eta{1}(Loop+1,:) = [0, 0, 0]; delta_Delta_eta{1}(Loop+1,:) = [0, 0, 0]; d_delta_Delta_eta{1}(Loop+1,:) = [0, 0, 0];  delta_breve_omega{1}(Loop+1,:) = [0, 0, 0]; delta_Delta_omega{1}(Loop+1,:) = [0, 0, 0];

    %% Iteration of followers
    for index = 2:N
        [tau{index}(Loop+1,:), delta_Delta_STC{index}(Loop+1,:)] ...
            = Control(Zeta, Neighbor, Configuration, breve_eta, breve_omega, check_eta, check_omega, delta_Delta_eta, d_delta_Delta_eta, delta_Delta_omega, index, Loop, T);
        
        [Zeta{index}(Loop+1,:), sigma{index}(Loop+1,:)] ...
            = Weight_Matrix(Zeta, sigma, Neighbor, N, Delta_STC, Delta_VTV, index, dt, Loop, Tk);
        
        [delta_breve_eta{index}(Loop+1,:), delta_Delta_eta{index}(Loop+1,:), d_delta_Delta_eta{index}(Loop+1,:), delta_breve_omega{index}(Loop+1,:), delta_Delta_omega{index}(Loop+1,:), P_tau{index}(Loop+1,:)] ...
            = Estimation(breve_eta, breve_omega, delta_breve_eta, delta_Delta_eta, delta_breve_omega, delta_Delta_omega, tau, index, Loop, dt);
        
        breve_tau{index}(Loop+1,:) = tau{index}(Loop+1,:) + Delta_CTA{index}(Loop,:);
        breve_tau{index}(Loop+1,1) = Hard_Saturation(tau{index}(Loop+1,1));
        breve_tau{index}(Loop+1,2) = Hard_Saturation(tau{index}(Loop+1,2));
        breve_tau{index}(Loop+1,3) = Hard_Saturation(tau{index}(Loop+1,3));
        [eta{index}(Loop+1,:), omega{index}(Loop+1,:), vartheta{index}(Loop+1,:), Mathcal_F{index}(Loop+1,:)] ...
            = plant(eta{index}(Loop,:)', vartheta{index}(Loop,:)', breve_tau{index}(Loop+1,:)', dt, Loop);
    end
    
    %% Plotting-use variables
    for index = 1:N
        [Delta_eta{index}(Loop+1,:), Delta_omega{index}(Loop+1,:)] ...
            = Lumped_Uncertainties(d_Delta_STC, Delta_STC, breve_eta, eta, Mathcal_F, breve_tau, P_tau, index, Loop);
        err{index}(Loop+1,:) = posPi_2_nagPi( eta{index}(Loop+1,:) - eta{1}(Loop+1,:) - Configuration{index} );
        derr{index} = omega{index} - omega{1};
    end
    
    %% Complete one polling cycle
    Loop = Loop+1;
    fprintf('The time is %f\n', T);
end
