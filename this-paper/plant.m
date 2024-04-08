function [eta, deta, vartheta, uncertainty] = plant(eta, vartheta, tau, dt, Loop)

% start stage
state = [eta; vartheta];
step = dt;
dstate = LongeKutta(state, tau, dt, Loop);
K1 = dstate;

% middle stage
state_ = state + (step/2)*K1;
dstate_ = LongeKutta(state_, tau, dt, Loop);
K2 = dstate_;

% middle stage
state_ = state + (step/2)*K2;
dstate_ = LongeKutta(state_, tau, dt, Loop);
K3 = dstate_;

% final stage
state_ = state + (step/2)*K3;
dstate_ = LongeKutta(state_, tau, dt, Loop);
K4 = dstate_;

state = state + (step/6)*(K1+2*K2+2*K3+K4);

%% In
eta = state(1:3); vartheta = state(4:6);
phi = eta(3);
u = vartheta(1); v = vartheta(2); r = vartheta(3);

R = [cos(phi) -sin(phi)  0;
     sin(phi)  cos(phi)  0;
        0        0       1];

deta = R*vartheta;

%% Newton-form
% M = [25.8 0 0; 0 33.8 0; 0 0 2.76];
M = [25.8     0        0;
      0    33.8    1.0115;
      0   1.0948    2.76];
% C = [0 0 -33.8*v; 0 0 25.8*u; 33.8*v -25.8*u 0];
c13 = -33.8*v - 1.0115*r;
c23 = 25.8*u;
c31 = 33.8*v + 1.0115*r;
c32 = -25.8*u;
C = [0    0    c13;
     0    0    c23;
    c31  c32    0];
% D = [2 0 0; 0 7 0; 0 0 0.5];
d11 = 0.72 + 1.33 * abs(u) + 5.87 * (u)^2;
d22 = 0.8896 + 36.5 * abs(v) + 0.805 * abs(r);
d23 = 7.25 + 0.845 * abs(v) + 3.45 * abs(r);
d32 = 0.0313 + 3.96 * abs(v) + 0.13 * abs(r);
d33 = 1.9 - 0.08 * abs(v) + 0.75 * abs(r);
D = [d11  0     0;
      0  d22  d23;
      0  d32  d33];
  
% R = [cos(phi) -sin(phi)  0;
%      sin(phi)  cos(phi)  0;
%         0        0       1];
% 
% T = Loop*dt;
% taod = [5*sin(0.1*pi*T);
%         5*sin(0.1*pi*T);
%         pi*sin(0.1*pi*T)];
%     
% deta = R*vartheta;
% % dV = inv(M)*(tao-C*V-D*V+taod-g);
% dvartheta = inv(M)*(tau-C*vartheta-D*vartheta);
% 
% %% itertive
% eta = eta+deta*dt;
% vartheta = vartheta+dvartheta*dt;

S = [0 -r  0
     r  0  0
     0  0  0];
MathcalT = R * inv(M)*tau;
uncertainty = R*S*vartheta + R*inv(M)*(-C*vartheta-D*vartheta) + MathcalT;
