function R = obtain_R(State)
phi = State(3);
R_ = [cos(phi) -sin(phi)  0;
      sin(phi)  cos(phi)  0;
         0        0       1];
R = reshape(R_, 9, 1);
end