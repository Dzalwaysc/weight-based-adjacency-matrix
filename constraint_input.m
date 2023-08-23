%% 调参方式：先选取最大值的两倍数做为R，如最大值为500N，则我们选取R=1000
%%           然后调整density里的out，直至aa输出为1为止（输出1后，还是能在输出为1的前提下继续进行微调的）
%% 快速得到一个out的方式，即有out=1/R，出来的数就能让aa=1
function [tao_contraint, d] = constraint_input(tao, max_tao)
    R = 20;
    d = Pra(R,tao);
    tao_contraint = p0(R)*tao - d;
end
