% 生成包含噪声的信号
t = linspace(0, 1, 1000);
x = sin(2 * pi * 10 * t) + sin(2 * pi * 20 * t) + 0.5 * randn(1, 1000);

% 绘制信号
figure;
plot(t, x);
title('原始信号');

% 定义小波变换的参数
wavelet = 'db4';
level = 4;

% 将信号进行小波变换
[C, L] = wavedec(x, level, wavelet);

% 计算每一层的阈值
thr = wthrmngr('dw1ddenoLVL', C, L, wavelet);
[C_comp, L_comp] = wthresh(C, 's', thr);

% 重构去噪后的信号
x_comp = waverec(C_comp, L_comp, wavelet);

% 绘制去噪后的信号
figure;
plot(t, x_comp);
title('去噪后的信号');
