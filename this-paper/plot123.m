% 定义 t 的范围
t = linspace(0, 50, 1000);

% % 计算连续函数的各个分量
% component1 = 10.^((t./15)-1) .* (2 * cos(pi * t / 120));
% component2 = 10.^((t./15)-1) .* cos(pi * t / 120);
% component3 = 10.^((t./15)-1) .* (0.1 * pi * cos(pi * t / 120));
% 
% % 绘制函数
% figure;
% plot(t, component1, 'DisplayName', '2cos(\pi t / 120)');
% hold on;
% plot(t, component2, 'DisplayName', 'cos(\pi t / 120)');
% plot(t, component3, 'DisplayName', '0.1\picos(\pi t / 120)');
% hold off;
% 
% xlabel('t');
% ylabel('Function Value');
% title('\Delta_{4}^{VTV, cont} Components');
% legend('show');


% for i = 1:size(t,2)
%     Dleta_plot(i, :) = [0.2*cos(pi/2*t(i)/60), 0.1*cos(pi/2*t(i)/60), 0.01*pi*cos(pi/2*t(i)/60)];
% 
%     if t(i)<15
%         Dleta_plot(i, :) = [0.2*cos(pi/2*t(i)/60), 0.1*cos(pi/2*t(i)/60), 0.01*pi*cos(pi/2*t(i)/60)];
%     elseif t(i)<30 && t(i)>=15
%         Dleta_plot(i, :) = [2*cos(pi/2*t(i)/60), 1*cos(pi/2*t(i)/60), 0.1*pi*cos(pi/2*t(i)/60)];
%     else
%         Dleta_plot(i, :) = [20*cos(pi/2*t(i)/60), 10*cos(pi/2*t(i)/60), pi*cos(pi/2*t(i)/60)];
%     end
% end
% 
% plot(t, Dleta_plot(:,1), t, Dleta_plot(:,2), t, Dleta_plot(:,3));

% 假设 t 是已定义的时间向量
t = linspace(0, 45, 1000); % 例如，从0到45秒，共1000个点

% 初始化 Dleta_plot 矩阵
Dleta_plot = zeros(size(t, 2), 3);

% 定义 sigmoid 函数，用于平滑过渡
sigmoid = @(x) 1./(1 + exp(-x));

% 平滑过渡的参数，控制过渡的速度
k = 10; % 调整这个参数可以控制过渡的“陡峭度”

% 通过循环计算每个时间点的值
for i = 1:length(t)
    % 计算每个段的权重
    w1 = sigmoid(k*(15-t(i))); % 第一段与第二段的过渡
    w2 = sigmoid(k*(t(i)-15)) * (1-sigmoid(k*(t(i)-30))); % 第二段与第三段的过渡
    w3 = sigmoid(k*(t(i)-30)); % 第三段开始
    
    % 计算加权平均
    Dleta_plot(i, :) = w1 .* [0.2*cos(pi/2*t(i)/60), 0.1*cos(pi/2*t(i)/60), 0.01*pi*cos(pi/2*t(i)/60)] + ...
                        w2 .* [2*cos(pi/2*t(i)/60), 1*cos(pi/2*t(i)/60), 0.1*pi*cos(pi/2*t(i)/60)] + ...
                        w3 .* [20*cos(pi/2*t(i)/60), 10*cos(pi/2*t(i)/60), pi*cos(pi/2*t(i)/60)];
end

% 绘图
plot(t, Dleta_plot(:,1), t, Dleta_plot(:,2), t, Dleta_plot(:,3));
legend('Component 1', 'Component 2', 'Component 3');
xlabel('Time (s)');
ylabel('Value');
title('Continuous Transition of Dleta\_plot');