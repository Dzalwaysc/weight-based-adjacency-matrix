function J = obtain_J(eta)
phi = eta(3);
J_ = [cos(phi) -sin(phi)  0;
      sin(phi)  cos(phi)  0;
         0        0       1];
J = reshape(J_, 9, 1);
end