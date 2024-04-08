clear all

%% Graph contribution
% Neighbor{1} = [2,3,4,5]; Bias{1} = [0, 0, 0];
% Neighbor{2} = [1,3,4,5]; Bias{2} = [-10, 10, 0];
% Neighbor{3} = [1,2,4,5]; Bias{3} = [-20, 10, 0]; 
% Neighbor{4} = [1,2,3,5]; Bias{4} = [-20, -10, 0];
% Neighbor{5} = [1,2,3,4]; Bias{5} = [-10, -10, 0];

Neighbor{1} = [2,5]; 
Neighbor{2} = [1,3]; 
Neighbor{3} = [2,4];
Neighbor{4} = [3,5];
Neighbor{5} = [1,4];

Configuration{1} = [0, 0, 0]; 
Configuration{2} = [0, 5, 0];
Configuration{3} = [5, 0, 0];
Configuration{4} = [0, -5, 0];
Configuration{5} = [-5, 0, 0];



%% 第一次循环，即t = 0, 所有参数初始化
Loop = 1; N = 5; dt = 0.001;

init_eta(1,:) = [0, 0, 0]; init_eta(2,:) = [0, 5, 330*pi/180]; init_eta(3,:) = [2.5, 0.5, 30*pi/180];
init_eta(4,:) = [-0.3, -3, 30*pi/180]; init_eta(5,:) = [-3.2, 0.2, 10*pi/180];

init_vartheta(1,:) = [0, 0, 0]; init_vartheta(2,:) = [0.3, 0.2, 0]; init_vartheta(3,:) = [0.8, 0.1, 0];
init_vartheta(4,:) = [0.1, 0, 0]; init_vartheta(5,:) = [0.25, 0, 0];


for i=1:N
    tau{i}(Loop,:) = [0, 0, 0];
    tau_for_uncertainties{i}(Loop, :) = [0, 0, 0];
    delta_eta{i}(Loop,:) = [0, 0, 0]; delta_Delta_eta{i}(Loop,:) = [0, 0, 0]; d_delta_Delta_eta{i}(Loop,:) = [0, 0, 0]; 
    delta_omega{i}(Loop,:) = [0, 0, 0]; delta_Delta_omega{i}(Loop,:) = [0, 0, 0];
    hat_Delta_STC{i}(Loop,:) = [0, 0, 0];
end

for i=1:N
    [eta{i}(Loop,:), deta{i}(Loop,:), vartheta{i}(Loop,:), uncertainty{i}(Loop,:)] = plant(init_eta(i,:)', init_vartheta(i,:)', tau{i}(Loop,:)', dt, 1);
    Sigma{i}(Loop,:) = [0, 0, 0, 0, 0];
    Zeta{i}(Loop,:) = [0, 0, 0, 0, 0];
    for j=Neighbor{i}
        % Sigma{i}(Loop,j) = 1;
        Zeta{i}(Loop,j) = 1;
    end
end

T = 0*dt;

Delta_STC{1}(Loop,:) = [0, 0, 0]; Delta_STC{2}(Loop,:) = [0, 0, 0]; Delta_STC{3}(Loop,:) = [0, 0, 0]; Delta_STC{4}(Loop,:) = [0, 0, 0]; Delta_STC{5}(Loop,:) = [0.4*T, 0.4*T, 0.01*pi*T];
d_Delta_STC{1}(Loop,:) = [0, 0, 0]; d_Delta_STC{2}(Loop,:) = [0, 0, 0]; d_Delta_STC{3}(Loop,:) = [0, 0, 0]; d_Delta_STC{4}(Loop,:) = [0, 0, 0]; d_Delta_STC{5}(Loop,:) = [0.4, 0.4, 0.01*pi];
% Delta_VTV{1}(Loop,:) = [0, 0, 0]; Delta_VTV{2}(Loop,:) = [0, 0, 0]; Delta_VTV{3}(Loop,:) = [0, 0, 0]; Delta_VTV{4}(Loop,:) = [0, 0, 0]; Delta_VTV{5}(Loop,:) = [0.2*cos(pi/2*T/60), 0.1*cos(pi/2*T/60), 0.01*pi*cos(pi/2*T/60)];
Delta_VTV{1}(Loop,:) = [0, 0, 0]; Delta_VTV{2}(Loop,:) = [0, 0, 0]; Delta_VTV{3}(Loop,:) = [0, 0, 0]; Delta_VTV{4}(Loop,:) = [0, 0, 0]; Delta_VTV{5}(Loop,:) = [0.2*cos(pi/2*0/60), 0.1*cos(pi/2*0/60), 0.01*pi*cos(pi/2*0/60)];

for index = 1:N
    [eta_{index}(Loop,:), deta_{index}(Loop,:), eta__{index}(Loop,:), deta__{index}(Loop,:)] ...
        = state_underHCFs(eta, deta, Delta_STC, Delta_VTV, index, 1);
    
    [Delta_eta{i}(Loop,:), Delta_omega{i}(Loop,:)] ...
        = uncertainties(d_Delta_STC, Delta_STC, eta_, eta, uncertainty, tau, index, 1);
    err{index}(Loop,:) = constraint_ang( eta{index}(Loop,:) - eta{1}(Loop,:) - Configuration{index} );
end

%% 后续迭代
AT = 50;
Time = linspace(0, AT+dt, AT/dt+1); Tk = [1, 1, 1, 1, 1];
for i=1:AT/dt
    T = i*dt;
%     if mod(Loop, 50) == 0
%         Tk(1) = Loop; Tk(2) = Loop; Tk(3) = Loop; Tk(4) = Loop; Tk(5) = Loop;
%     end
    if mod(Loop, 500) == 0
        Tk(1) = Loop;
    end
    if mod(Loop, 2500) == 0
        Tk(2) = Loop;
    end
    if mod(Loop, 420) == 0
        Tk(3) = Loop;
    end
    if mod(Loop, 3550) == 0
        Tk(4) = Loop;
    end
    if mod(Loop, 600) == 0
        Tk(5) = Loop;
    end
    
    %% leader
    xx = 0.5*T; xxd = 0.5; xxdd = 0;
    yy = 3*sin(xx*pi/15); yyd = 3*pi/15*cos(xx*pi/15); yydd = -3*(pi/15)*(pi/15)*sin(xx*pi/15);
    fai = atan2(yyd, xxd); faid = (-xxdd*yyd + xxd*yydd)/(xxd^2+yyd^2);

    if fai < 0
        fai = fai + 2*pi;
    end

    RR = reshape(obtain_R([xx, yy, fai]),3, 3);
    eta{1}(Loop+1,:) = [xx, yy, fai]; vartheta{1}(Loop+1,:) = [xxd, yyd, faid]*RR'; deta{1}(Loop+1,:) = [xxd, yyd, faid]; 

    uncertainty{1}(Loop+1,:) = [0, 0, 0]; tau{1}(Loop+1,:) = [0, 0, 0]; tau_for_uncertainties{1}(Loop+1, :) = [0, 0, 0];
    [Zeta{1}(Loop+1,:), Sigma{1}(Loop+1,:)] = weight_node(Zeta, Sigma, Neighbor, N, Delta_STC, Delta_VTV, 1, dt, Loop, Tk);
    delta_eta{1}(Loop+1,:) = [0, 0, 0]; delta_Delta_eta{1}(Loop+1,:) = [0, 0, 0]; d_delta_Delta_eta{1}(Loop+1,:) = [0, 0, 0];  delta_omega{1}(Loop+1,:) = [0, 0, 0]; delta_Delta_omega{1}(Loop+1,:) = [0, 0, 0];

    %% follower
    for index = 2:5
        [tau{index}(Loop+1,:), hat_Delta_STC{index}(Loop+1,:), tau_for_uncertainties{index}(Loop+1, :)] ...
            = control(Zeta, Neighbor, Configuration, eta_, deta_, eta__, deta__, delta_Delta_eta, d_delta_Delta_eta, delta_Delta_omega, index, Loop, T);
        
        [Zeta{index}(Loop+1,:), Sigma{index}(Loop+1,:)] ...
            = weight_node(Zeta, Sigma, Neighbor, N, Delta_STC, Delta_VTV, index, dt, Loop, Tk);
        
        [delta_eta{index}(Loop+1,:), delta_Delta_eta{index}(Loop+1,:), d_delta_Delta_eta{index}(Loop+1,:), delta_omega{index}(Loop+1,:), delta_Delta_omega{index}(Loop+1,:)] ...
            = adaptive(eta_, deta_, delta_eta, delta_Delta_eta, delta_omega, delta_Delta_omega, tau, index, Loop, dt);
        
        [eta{index}(Loop+1,:), deta{index}(Loop+1,:), vartheta{index}(Loop+1,:), uncertainty{index}(Loop+1,:)] ...
            = plant(eta{index}(Loop,:)', vartheta{index}(Loop,:)', tau{index}(Loop+1,:)', dt, Loop);
    end
           

    Delta_STC{1}(Loop+1,:) = [0, 0, 0]; Delta_STC{2}(Loop+1,:) = [0, 0, 0]; Delta_STC{3}(Loop+1,:) = [0, 0, 0]; Delta_STC{4}(Loop+1,:) = [0, 0, 0]; Delta_STC{5}(Loop+1,:) = [0.4*T, 0.4*T, 0.01*pi*T];
    d_Delta_STC{1}(Loop+1,:) = [0, 0, 0]; d_Delta_STC{2}(Loop+1,:) = [0, 0, 0]; d_Delta_STC{3}(Loop+1,:) = [0, 0, 0]; d_Delta_STC{4}(Loop+1,:) = [0, 0, 0]; d_Delta_STC{5}(Loop+1,:) = [0.4, 0.4, 0.01*pi];
    if T<15
        Delta_VTV{1}(Loop+1,:) = [0, 0, 0]; Delta_VTV{2}(Loop+1,:) = [0, 0, 0]; Delta_VTV{3}(Loop+1,:) = [0, 0, 0]; Delta_VTV{4}(Loop+1,:) = [0, 0, 0]; Delta_VTV{5}(Loop+1,:) = [0.2*cos(pi/2*T/60), 0.1*cos(pi/2*T/60), 0.01*pi*cos(pi/2*T/60)];
        % Delta_VTV{1}(Loop+1,:) = [0, 0, 0]; Delta_VTV{2}(Loop+1,:) = [0, 0, 0]; Delta_VTV{3}(Loop+1,:) = [0, 0, 0]; Delta_VTV{4}(Loop+1,:) = [0, 0, 0]; Delta_VTV{5}(Loop+1,:) = [1+sin(pi/2*T/15+3*pi/2), 1+sin(pi/2*T/15+3*pi/2), 0.1*pi+0.1*pi*sin(pi/2*T/15+3*pi/2)];
    elseif T<30 && T>=15
        Delta_VTV{1}(Loop+1,:) = [0, 0, 0]; Delta_VTV{2}(Loop+1,:) = [0, 0, 0]; Delta_VTV{3}(Loop+1,:) = [0, 0, 0]; Delta_VTV{4}(Loop+1,:) = [0, 0, 0]; Delta_VTV{5}(Loop+1,:) = [2*cos(pi/2*T/60), 1*cos(pi/2*T/60), 0.1*pi*cos(pi/2*T/60)];
        % Delta_VTV{1}(Loop+1,:) = [0, 0, 0]; Delta_VTV{2}(Loop+1,:) = [0, 0, 0]; Delta_VTV{3}(Loop+1,:) = [0, 0, 0]; Delta_VTV{4}(Loop+1,:) = [0, 0, 0]; Delta_VTV{5}(Loop+1,:) = [1+sin(pi/2*(T-15)/15), 1+sin(pi/2*(T-15)/15), 0.1*pi+0.1*pi*sin(pi/2*(T-15)/15)];
    else
        Delta_VTV{1}(Loop+1,:) = [0, 0, 0]; Delta_VTV{2}(Loop+1,:) = [0, 0, 0]; Delta_VTV{3}(Loop+1,:) = [0, 0, 0]; Delta_VTV{4}(Loop+1,:) = [0, 0, 0]; Delta_VTV{5}(Loop+1,:) = [20*cos(pi/2*T/60), 10*cos(pi/2*T/60), pi*cos(pi/2*T/60)];
        % Delta_VTV{1}(Loop+1,:) = [0, 0, 0]; Delta_VTV{2}(Loop+1,:) = [0, 0, 0]; Delta_VTV{3}(Loop+1,:) = [0, 0, 0]; Delta_VTV{4}(Loop+1,:) = [0, 0, 0]; Delta_VTV{5}(Loop+1,:) = [2, 2, 0.2*pi];
    end
    
    for index = 1:N
        [eta_{index}(Loop+1,:), deta_{index}(Loop+1,:), eta__{index}(Loop+1,:), deta__{index}(Loop+1,:)] ...
            = state_underHCFs(eta, deta, Delta_STC, Delta_VTV, index, Loop);

        [Delta_eta{index}(Loop+1,:), Delta_omega{index}(Loop+1,:)] ...
            = uncertainties(d_Delta_STC, Delta_STC, eta_, eta, uncertainty, tau_for_uncertainties, index, Loop);
        err{index}(Loop+1,:) = constraint_ang( eta{index}(Loop+1,:) - eta{1}(Loop+1,:) - Configuration{index} );
        derr{index} = deta{index} - deta{1};
    end
    Loop = Loop+1;
    fprintf('The time is %f\n', T);
end
