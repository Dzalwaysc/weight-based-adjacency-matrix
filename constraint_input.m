%% 调参方式：先选取最大值的两倍数做为R，如最大值为500N，则我们选取R=1000
%%           然后调整density里的out，直至aa输出为1为止（输出1后，还是能在输出为1的前提下继续进行微调的）
%% 快速得到一个out的方式，即有out=1/R，出来的数就能让aa=1
clear all
u = linspace(-50,50,200);
R = 20;
for i=1:1:200
    w(i) = p0(R)*u(i) - Pra(R,u(i));
    aa = p0(R);
end

for i=1:1:200
    if abs(u(i))<10
        w_s(i) = u(i);
    else
        w_s(i)=sign(u(i))*10;
    end
end
plot(u, w_s,'-b', u, w, ':r','LineWidth',2);
set(gca,'FontSize', 16);
legend('hard-limited model', 'dead zone-based model', 'FontSize', 12);
xlabel('Command control input (N)', 'interpreter', 'latex');
ylabel('Actual control input (N)', 'interpreter', 'latex');