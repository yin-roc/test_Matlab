% 生成信号
fs = 1000; % 采样率
t = 0:1/fs:1; % 时间轴
f1 = 20; % 信号频率
f2 = 100; % 信号频率
x = sin(2*pi*f1*t) + sin(2*pi*f2*t); % 信号

% 计算希尔伯特谱
h = hilbert(x); % Hilbert 变换
inst_amp = abs(h); % 信号瞬时幅值
inst_freq = diff(unwrap(angle(h)))*fs/(2*pi); % 信号瞬时频率

% 绘制希尔伯特谱
figure;
subplot(211);
plot(t, x);
title('信号');
xlabel('时间 (s)');
ylabel('幅值');
xlim([0 0.1]);
ylim([-2 2]);

subplot(212);
plot(t(1:end-1), inst_freq);
title('希尔伯特谱');
xlabel('时间 (s)');
ylabel('频率 (Hz)');
xlim([0 0.1]);
ylim([0 200]);
