function dR = obtain_dR(State, V)
phi = State(3); r = V(3);
R = [cos(phi) -sin(phi)  0;
     sin(phi)  cos(phi)  0;
        0        0       1];
S = [0 -r  0
     r  0  0
     0  0  0];
dR_ = R*S;
dR = reshape(dR_, 9, 1);
end