function [new_zeta, new_sigma] = Weight_Matrix(Zeta, Sigma, Neighbor, N, Delta_STC, Delta_VTV, index, dt, Loop, Tk)

Ni = Neighbor{index};
sigma = Sigma{index}(Loop,:);  
zeta = Zeta{index}(Loop,:);

%% Parameters
mu = 5; l=0.5; k=0.5;
xita = 1.2;

%% Calculate local trustworthiness
g = zeros(1,N);
Xi = zeros(1,N);
dsigma = zeros(1,N);
for j=Ni
    eta_err = norm(Delta_STC{j}(Tk(index),:) + Delta_VTV{j}(Tk(index),:));
    deta_err = norm(Delta_STC{j}(Tk(index),:) + Delta_VTV{j}(Tk(index),:));
    h = l*(k*eta_err*(deta_err+1)+deta_err);
    g(j) = exp( -log(h+1) / (sigma(j)^2 + xita) );
    if h==0
        Xi(j) = 0;
    else
        Xi(j) = -g(j)* log( g(j) );
    end
    dsigma(j) = - mu * sigma(j) * Xi(j) * (g(j) - zeta(j) );
%     dsigma(j) = - mu * sigma(j) * (g(j) - zeta(j) ); 
end

%% Calculate modified trustworthiness
dzeta = zeros(1,N);
for j=1:N
    sum = 0;
    for k=Ni
        sum = sum + Zeta{k}(end,j) - zeta(j);
    end
    %% If the j-th member belongs to neighbors
    if numel(find(Ni==j)) == 1
        % Adding a coefficient is non-standard. Here the coefficient is added to highlight the impact of different sampling times of each member's sensing device (as per the previous reviewer's suggestion).
        % Different sampling times, and adding a coefficient greater than 1 in front will amplify the differences in judgments of j-boat between this member and neighbors. 
        % The results show that this difference will slow down the convergence of the weight matrix.
        dzeta(j) = 2*sum + 15*(g(j) - zeta(j));
%         dzeta(j) = sum + (g(j) - zeta(j)); % Not adding a coefficient will result in better tracking performance.
    else
        dzeta(j) = 2*sum;
%         dzeta(j) = sum;
    end
end

%% Iterative update
new_zeta = zeta + dzeta*dt;
new_sigma = sigma + dsigma*dt;
