function dEta = obtain_dEta(State, V)
R = reshape(obtain_R(State), 3, 3);
dEta = R*V';
end