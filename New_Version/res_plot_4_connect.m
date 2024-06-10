%% ---------------------------  Results in Manuscript  -----------------------------------

%% Path Trajectories
% figure(2)
% plot(eta{1}(:,1),eta{1}(:,2),'k', 'LineWidth', 2)
% hold on
% plot(eta{2}(:,1),eta{2}(:,2), 'Color', [0 0.4470 0.7410], 'LineWidth', 2)
% hold on
% plot(eta{3}(:,1),eta{3}(:,2),'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2)
% hold on
% plot(eta{4}(:,1),eta{4}(:,2),'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2)
% hold on
% plot(eta{5}(:,1),eta{5}(:,2),'Color', [0.2706 0.5451 0.4549], 'LineWidth', 2)
% hold on
% 
% plot(eta{6}(:,1),eta{6}(:,2),'Color', [0.5764 0.4784 0.8588], 'LineWidth', 2)
% hold on
% plot(eta{7}(:,1),eta{7}(:,2),'Color', [0.8235 0.7058 0.5490], 'LineWidth', 2)
% hold on
% plot(eta{8}(:,1),eta{8}(:,2),'Color', [1 0.4117 0.7058], 'LineWidth', 2)
% hold on
% plot(eta{9}(:,1),eta{9}(:,2),'Color', [0.5450 0.5372 0.5372], 'LineWidth', 2)
% hold on
% plot(eta{10}(:,1),eta{10}(:,2),'Color', [0 0.7490 1], 'LineWidth', 2)
% xlabel('$x$(m)','interpreter','latex')
% ylabel('$y$(m)','interpreter','latex')
% set(gca, 'FontSize', 16)
% 
% temp=size(Time,2);
% L=1.255*2;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
% B=0.5*2;
% L01=0.8*2;  
% 
% % Draw Graph Line and Member Pattern
% i = 1
% [xx yy]=ship_contour(eta{1}(i,:)',L,B,L01);
% fill(xx,yy,'k')
% [xx yy]=ship_contour(eta{2}(i,:)',L,B,L01);
% fill(xx,yy,[0 0.4470 0.7410])
% [xx yy]=ship_contour(eta{3}(i,:)',L,B,L01);
% fill(xx,yy,[0.8500 0.3250 0.0980])
% [xx yy]=ship_contour(eta{4}(i,:)',L,B,L01);
% fill(xx,yy,[0.9290 0.6940 0.1250])
% [xx yy]=ship_contour(eta{5}(i,:)',L,B,L01);
% fill(xx,yy,[0.2706 0.5451 0.4549])
% 
% [xx yy]=ship_contour(eta{6}(i,:)',L,B,L01);
% fill(xx,yy,[0.5764 0.4784 0.8588])
% [xx yy]=ship_contour(eta{7}(i,:)',L,B,L01);
% fill(xx,yy,[0.8235 0.7058 0.5490])
% [xx yy]=ship_contour(eta{8}(i,:)',L,B,L01);
% fill(xx,yy,[1 0.4117 0.7058])
% [xx yy]=ship_contour(eta{9}(i,:)',L,B,L01);
% fill(xx,yy,[0.5450 0.5372 0.5372])
% [xx yy]=ship_contour(eta{10}(i,:)',L,B,L01);
% fill(xx,yy,[0 0.7490 1])
%  
% i = 50000
% [xx yy]=ship_contour(eta{1}(i,:)',L,B,L01);
% p1 = fill(xx,yy,'k')
% [xx yy]=ship_contour(eta{2}(i,:)',L,B,L01);
% p2 = fill(xx,yy,[0 0.4470 0.7410])
% [xx yy]=ship_contour(eta{3}(i,:)',L,B,L01);
% p3 = fill(xx,yy,[0.8500 0.3250 0.0980])
% [xx yy]=ship_contour(eta{4}(i,:)',L,B,L01);
% p4 = fill(xx,yy,[0.9290 0.6940 0.1250])
% [xx yy]=ship_contour(eta{5}(i,:)',L,B,L01);
% p5 = fill(xx,yy,[0.2706 0.5451 0.4549])
% 
% [xx yy]=ship_contour(eta{6}(i,:)',L,B,L01);
% p6 = fill(xx,yy,[0.5764 0.4784 0.8588])
% [xx yy]=ship_contour(eta{7}(i,:)',L,B,L01);
% p7 = fill(xx,yy,[0.8235 0.7058 0.5490])
% [xx yy]=ship_contour(eta{8}(i,:)',L,B,L01);
% p8 = fill(xx,yy,[1 0.4117 0.7058])
% [xx yy]=ship_contour(eta{9}(i,:)',L,B,L01);
% p9 = fill(xx,yy,[0.5450 0.5372 0.5372])
% [xx yy]=ship_contour(eta{10}(i,:)',L,B,L01);
% p10 = fill(xx,yy,[0 0.7490 1])
% 
% line([eta{1}(i,1) eta{2}(i,1) eta{3}(i,1) eta{9}(i,1) eta{10}(i,1) eta{5}(i,1) eta{7}(i,1) eta{2}(i,1)], ...
%      [eta{1}(i,2) eta{2}(i,2) eta{3}(i,2) eta{9}(i,2) eta{10}(i,2) eta{5}(i,2) eta{7}(i,2) eta{2}(i,2)], ...
%      'color','k','linestyle',':','LineWidth',1)
% hold on
% line([eta{1}(i,1) eta{6}(i,1) eta{9}(i,1) eta{8}(i,1) eta{10}(i,1) eta{1}(i,1) eta{8}(i,1) eta{3}(i,1)], ...
%      [eta{1}(i,2) eta{6}(i,2) eta{9}(i,2) eta{8}(i,2) eta{10}(i,2) eta{1}(i,2) eta{8}(i,2) eta{3}(i,2)], ...
%      'color','k','linestyle',':','LineWidth',1)
% hold on
% line([eta{1}(i,1) eta{5}(i,1) eta{4}(i,1) eta{6}(i,1) eta{2}(i,1) eta{7}(i,1)], ...
%      [eta{1}(i,2) eta{5}(i,2) eta{4}(i,2) eta{6}(i,2) eta{2}(i,2) eta{7}(i,2)], ...
%      'color','k','linestyle',':','LineWidth',1)
% hold on
% line([eta{3}(i,1) eta{7}(i,1) eta{4}(i,1) eta{8}(i,1)], ...
%      [eta{3}(i,2) eta{7}(i,2) eta{4}(i,2) eta{8}(i,2)], ...
%      'color','k','linestyle',':','LineWidth',1)
%  
% legend([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10], {'Leader', 'i=1', 'i=2', 'i=3', 'i=4', 'i=5', 'i=6', 'i=7', 'i=8', 'i=9'}, 'NumColumns', 5, 'FontSize', 12);
% axis equal

%% Weight-based adjacency matrix
% figure(5)
% subplot(3,1,1)
% plot(Time, Zeta{2}(:,2), Time, Zeta{3}(:,2), Time, Zeta{4}(:,2), Time, Zeta{5}(:,2), ...
%      Time, Zeta{6}(:,2), Time, Zeta{7}(:,2), Time, Zeta{8}(:,2), Time, Zeta{9}(:,2), Time, Zeta{10}(:,2), 'LineWidth', 2 );
% legend('$\zeta_{12}$', '$\zeta_{22}$', '$\zeta_{32}$', '$\zeta_{42}$', ...
%        '$\zeta_{52}$', '$\zeta_{62}$', '$\zeta_{72}$', '$\zeta_{82}$', '$\zeta_{92}$', ...
%        'NumColumns', 5, 'interpreter','latex', 'FontSize', 16); hold on
% xlim([0,50]);
% set(gca, 'FontSize', 16)
% 
% subplot(3,1,2)
% plot(Time, Zeta{2}(:,5), Time, Zeta{3}(:,5), Time, Zeta{4}(:,5), Time, Zeta{5}(:,5), ...
%      Time, Zeta{6}(:,5), Time, Zeta{7}(:,5), Time, Zeta{8}(:,5), Time, Zeta{8}(:,5), Time, Zeta{10}(:,5),'LineWidth', 2 );
% xlim([0,50]);
% set(gca, 'FontSize', 16)
% 
% subplot(3,1,3)
% plot(Time, Zeta{2}(:,10), Time, Zeta{3}(:,10), Time, Zeta{4}(:,10), Time, Zeta{5}(:,10), ...
%      Time, Zeta{6}(:,10), Time, Zeta{7}(:,10), Time, Zeta{8}(:,10), Time, Zeta{9}(:,10), Time, Zeta{10}(:,10), 'LineWidth', 2 );
% xlim([0,50]);
% xlabel('$t$(s)','interpreter','latex')
% set(gca, 'FontSize', 16)

%% tracking errors
%TopFig: kinematics 
for i=1:size(err{2},1)
    err_sum1(i) = norm(err{2}(i,1)) + norm(err{3}(i,1)) + norm(err{4}(i,1)) + norm(err{5}(i,1)) ...
                + norm(err{6}(i,1)) + norm(err{7}(i,1)) + norm(err{9}(i,1)) + norm(err{9}(i,1)) + norm(err{10}(i,1));
    err_sum2(i) = norm(err{2}(i,2)) + norm(err{3}(i,2)) + norm(err{4}(i,2)) + norm(err{5}(i,2)) ...
                + norm(err{6}(i,2)) + norm(err{7}(i,2)) + norm(err{9}(i,2)) + norm(err{9}(i,2)) + norm(err{10}(i,2));
    err_sum3(i) = norm(err{2}(i,3)) + norm(err{3}(i,3)) + norm(err{4}(i,3)) + norm(err{5}(i,3)) ...
                + norm(err{6}(i,3)) + norm(err{7}(i,3)) + norm(err{9}(i,3)) + norm(err{9}(i,3)) + norm(err{10}(i,3));
end
err_sum = (err_sum1 + err_sum2 + err_sum3) / 9;

count = 1;
for i=1:1500:size(Time, 2)
    T_1(count) = Time(i);
    err_sum_(count) = err_sum(i);
    count = count + 1;
end

figure(1)
subplot(2,1,1)
plot(T_1, err_sum_, '-o', 'MarkerSize', 4, 'LineWidth', 2);
set(gca, 'FontSize', 16)
xlim([0,50]);
hold on

% TopFig: dynamics
for i=1:size(derr{2},1)
    derr_sum1(i) = norm(derr{2}(i,1)) + norm(derr{3}(i,1)) + norm(derr{4}(i,1)) + norm(derr{5}(i,1)) ...
                 + norm(derr{6}(i,1)) + norm(derr{7}(i,1)) + norm(derr{8}(i,1)) + norm(derr{9}(i,1)) + norm(derr{10}(i,1));
    derr_sum2(i) = norm(derr{2}(i,2)) + norm(derr{3}(i,2)) + norm(derr{4}(i,2)) + norm(derr{5}(i,2)) ...
                 + norm(derr{6}(i,2)) + norm(derr{7}(i,2)) + norm(derr{8}(i,2)) + norm(derr{9}(i,2)) + norm(derr{10}(i,2));
    derr_sum3(i) = norm(derr{2}(i,3)) + norm(derr{3}(i,3)) + norm(derr{4}(i,3)) + norm(derr{5}(i,3)) ...
                 + norm(derr{6}(i,3)) + norm(derr{7}(i,3)) + norm(derr{8}(i,3)) + norm(derr{9}(i,3)) + norm(derr{10}(i,3));
end

derr_sum = (derr_sum1 + derr_sum2 + derr_sum3) / 9;

count = 1;
for i=1:1500:size(Time, 2)
    T_2(count) = Time(i);
    derr_sum_(count) = derr_sum(i);
    count = count + 1;
end

plot(T_2, derr_sum_, '-x', 'MarkerSize', 6, 'LineWidth', 2);
legend('$E_{\eta}$', '$E_{\omega}$', 'NumColumns', 2, 'Interpreter','latex')

% DownFig: estimations
subplot(2,1,2)
for i=2:10
    for j=1:size(delta_breve_eta{i},1)
        estimation_err1{i}(j) = norm(delta_breve_eta{i}(j,:) - breve_eta{i}(j,:));
        estimation_err2{i}(j) = norm(delta_Delta_eta{i}(j,:) - Delta_eta{i}(j,:));
        estimation_err3{i}(j) = norm(delta_breve_omega{i}(j,:) - breve_omega{i}(j,:));
        estimation_err4{i}(j) = norm(delta_Delta_omega{i}(j,:) - Delta_omega{i}(j,:));
        estimation_err_sum{i}(j) = estimation_err1{i}(j)+estimation_err2{i}(j)+estimation_err3{i}(j)+estimation_err4{i}(j);
    end
end
TT = (estimation_err_sum{2} + estimation_err_sum{3} + estimation_err_sum{4} + estimation_err_sum{5}) / 9;

count = 1;
for i=1:1500:size(Time, 2)
    T_3(count) = Time(i);
    TT_(count) = TT(i);
    count = count + 1;
end


plot(T_3, TT_, '-s', 'LineWidth', 2, 'Color', [0.93,0.69,0.13]); % 'Color', (0.93,0.69,0.13)
set(gca, 'FontSize', 16)
xlim([0,50]);
xlabel('$t$(s)','interpreter','latex')
hold on

legend('$E_{\delta}$', 'Interpreter','latex')

%% ---------------------------  other results  ---------------------------------

%% tracking errors of kinematics
% figure(1)
% subplot(3,1,1)
% plot(Time, err{2}(1:end,1), Time, err{3}(1:end,1), Time, err{4}(1:end,1), Time, err{5}(1:end,1), 'LineWidth', 2 );
% ylabel('$\eta_{e1}$(m)','interpreter','latex')
% set(gca, 'FontSize', 16)
% legend('ASV1', 'ASV2', 'ASV3', 'ASV4', 'NumColumns', 4, 'FontSize', 12);
% subplot(3,1,2)
% plot(Time, err{2}(1:end,2), Time, err{3}(1:end,2), Time, err{4}(1:end,2), Time, err{5}(1:end,2), 'LineWidth', 2 );
% ylabel('$\eta_{e2}$(m)','interpreter','latex')
% set(gca, 'FontSize', 16)
% subplot(3,1,3)
% plot(Time, err{2}(1:end,3), Time, err{3}(1:end,3), Time, err{4}(1:end,3), Time, err{5}(1:end,3), 'LineWidth', 2 );
% xlabel('$t$(s)','interpreter','latex')
% ylabel('$\eta_{e3}$(rad)','interpreter','latex')
% set(gca, 'FontSize', 16)

%% tracking errors of dynamics
% figure(2)
% subplot(3,1,1)
% plot(Time, derr{2}(1:end,1), Time, derr{3}(1:end,1), Time, derr{4}(1:end,1), Time, derr{5}(1:end,1), 'LineWidth', 2 );
% xlim([0,30]);
% ylabel('$\omega_{e1}$(m/s)','interpreter','latex')
% set(gca, 'FontSize', 16)
% legend('i=1', 'i=2', 'i=3', 'i=4', 'NumColumns', 4, 'FontSize', 12);
% subplot(3,1,2)
% plot(Time, derr{2}(1:end,2), Time, derr{3}(1:end,2), Time, derr{4}(1:end,2), Time, derr{5}(1:end,2), 'LineWidth', 2 );
% xlim([0,30]);
% ylabel('$\omega_{e2}$(m/s)','interpreter','latex')
% set(gca, 'FontSize', 16)
% subplot(3,1,3)
% plot(Time, derr{2}(1:end,3), Time, derr{3}(1:end,3), Time, derr{4}(1:end,3), Time, derr{5}(1:end,3), 'LineWidth', 2 );
% xlim([0,30]);
% xlabel('$t$(s)','interpreter','latex')
% ylabel('$\omega_{e3}$(rad/s)','interpreter','latex')
% set(gca, 'FontSize', 16)

%% continuous control input, check if the chattering is severe
% figure(3)
% subplot(3,2,1)
% 
% count = 1;
% for i=Time
%     CTA(count) = 12*sin(pi/2*i/10);
%     count = count+1;
% end
% 
% count = 1;
% for i=1:1:size(Time,2)
%     T_(count) = Time(i);
%     tau_2(count,:) = breve_tau{2}(i,:);
%     tau_3(count,:) = breve_tau{3}(i,:);
%     tau_4(count,:) = breve_tau{4}(i,:);
%     tau_5(count,:) = breve_tau{5}(i,:);
%     CTA_(count,:) = CTA(i);
%     count = count + 1;
% end
% 
% plot(T_, tau_2(:,1), T_, tau_2(:,2), T_, tau_2(:,3), 'LineWidth', 2);
% ylabel('$i=1$','interpreter','latex')
% set(gca, 'FontSize', 16)
% legend('$\breve{\tau}_{i1}$(N)', '$\breve{\tau}_{i2}$(N)', '$\breve{\tau}_{i3}$(Nm)', 'NumColumns', 3, 'interpreter', 'latex', 'FontSize', 12);
% 
% subplot(3,2,3)
% plot(T_, tau_3(:,1), T_, tau_3(:,2), T_, tau_3(:,3), 'LineWidth', 2);
% ylabel('$i=2$','interpreter','latex')
% set(gca, 'FontSize', 16)
% 
% subplot(3,2,5)
% plot(T_, tau_4(:,1), T_, tau_4(:,2), T_, tau_4(:,3), 'LineWidth', 2);
% xlabel('$t$(s)','interpreter','latex')
% ylabel('$i=3$','interpreter','latex')
% set(gca, 'FontSize', 16)
% 
% subplot(3,2,[2,4,6])
% plot(T_, tau_5(:,1), T_, tau_5(:,2), T_, tau_5(:,3), T_, CTA_, 'LineWidth', 2);
% xlabel('$t$(s)','interpreter','latex')
% ylabel('$i=4$','interpreter','latex')
% set(gca, 'FontSize', 16)


%% check if the estimations are accurate
% for i = 1:size(d_delta_Delta_eta{5},1)
%     delta_Delta_STC5(i,:) = -(d_delta_Delta_eta{5}(i,:) + delta_Delta_eta{5}(i,:));
% 
%     eta_est(i,:) = breve_eta{5}(i,:) - delta_Delta_STC5(i,:);
% end
% figure(7)
% plot(Time, eta{5}(:,1), Time, eta_est(:,1));
% 
% figure(8)
% plot(Time, eta{5}(:,2), Time, eta_est(:,2));
% 
% figure(9)
% plot(Time, eta{5}(:,3), Time, eta_est(:,3));


%% tracking errors of estimations
% for i=2:5
%     for j=1:size(delta_breve_eta{i},1)
%         estimation_err1{i}(j) = norm(delta_breve_eta{i}(j,:) - breve_eta{i}(j,:));
%         estimation_err2{i}(j) = norm(delta_Delta_eta{i}(j,:) - Delta_eta{i}(j,:));
%         estimation_err3{i}(j) = norm(delta_breve_omega{i}(j,:) - breve_omega{i}(j,:));
%         estimation_err4{i}(j) = norm(delta_Delta_omega{i}(j,:) - Delta_omega{i}(j,:));
%     end
% end
% 
% figure(1)
% plot(Time, estimation_err1{2}, '-', Time, estimation_err1{3}, '--', Time, estimation_err1{4}, '-.', Time, estimation_err1{5}, ':', 'LineWidth', 2);
% set(gca, 'FontSize', 16)
% xlabel('$t(s)$', 'Interpreter','latex')
% ylabel('$\delta_{\breve{\eta}}$', 'Interpreter','latex')
% xlim([0, 50])
% legend('$i=1$',...
%     '$i=2$',...
%     '$i=3$',...
%     '$i=4$',...
%     'NumColumns', 2, ...
%     'Interpreter','latex')
% 
% figure(2)
% plot(Time, estimation_err2{2}, '-', Time, estimation_err2{3}, '--', Time, estimation_err2{4}, '-.', Time, estimation_err2{5}, ':', 'LineWidth', 2);
% set(gca, 'FontSize', 16)
% xlabel('$t(s)$', 'Interpreter','latex')
% ylabel('$\delta_{\Delta \eta}$', 'Interpreter','latex')
% xlim([0, 50])
% legend('$i=1$',...
%     '$i=2$',...
%     '$i=3$',...
%     '$i=4$',...
%     'NumColumns', 2, ...
%     'Interpreter','latex')
% 
% figure(3)
% plot(Time, estimation_err3{2}, '-', Time, estimation_err3{3}, '--', Time, estimation_err3{4}, '-.', Time, estimation_err3{5}, ':', 'LineWidth', 2);
% set(gca, 'FontSize', 16)
% xlabel('$t(s)$', 'Interpreter','latex')
% ylabel('$\delta_{\breve{\omega}}$', 'Interpreter','latex')
% xlim([0, 50])
% legend('$i=1$',...
%     '$i=2$',...
%     '$i=3$',...
%     '$i=4$',...
%     'NumColumns', 2, ...
%     'Interpreter','latex')
% 
% figure(4)
% plot(Time, estimation_err4{2}, '-', Time, estimation_err4{3}, '--', Time, estimation_err4{4}, '-.', Time, estimation_err4{5}, ':', 'LineWidth', 2);
% set(gca, 'FontSize', 16)
% xlabel('$t(s)$', 'Interpreter','latex')
% ylabel('$\delta_{\Delta \omega}$', 'Interpreter','latex')
% xlim([0, 50])
% legend('$i=1$',...
%     '$i=2$',...
%     '$i=3$',...
%     '$i=4$',...
%     'NumColumns', 2, ...
%     'Interpreter','latex')

%% check if the chattering of estimations is severe
% figure(5)
% plot(Time, delta_breve_omega{4}(:,1), Time, breve_omega{4}(:,1));
% figure(6)
% plot(Time, delta_breve_omega{4}(:,2), Time, breve_omega{4}(:,2));
% figure(7)
% plot(Time, delta_breve_omega{4}(:,3), Time, breve_omega{4}(:,3));

% figure(5)
% plot(Time, delta_Delta_omega{4}(:,1), Time, Delta_omega{4}(:,1));
% figure(6)
% plot(Time, delta_Delta_omega{4}(:,2), Time, Delta_omega{4}(:,2));
% figure(7)
% plot(Time, delta_Delta_omega{4}(:,3), Time, Delta_omega{4}(:,3));