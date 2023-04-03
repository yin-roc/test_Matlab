% 生成测试信号
fs = 1000;   % 采样率为1000Hz
t = 0:1/fs:1-1/fs;  % 1秒的时间
f1 = 10;   % 信号频率为50Hz
f2 = 30;  % 信号频率为100Hz
x = cos(2*pi*f1*t) + cos(2*pi*f2*t);  % 两个正弦波信号的叠加

function [wv, t_axis, f_axis] = WVD(x, fs)

    % 计算 Wigner-Ville 分布
    wv = wvd(x); 
    
    % 时间轴和频率轴
    t_axis = linspace(0, length(x)/fs, length(x));
    f_axis = linspace(0, fs/2, length(x)/2+1);

    % 绘图
    figure;
    subplot(211);
    plot(t_axis, x);
    title('信号');
    xlabel('时间 (s)');
    ylabel('幅值');
    xlim([0 t_axis(end)]);
    
    subplot(212);
    imagesc(t_axis, f_axis, abs(wv(1:length(f_axis), :)));
    axis xy;
    title('Wigner-Ville 分布');
    xlabel('时间 (s)');
    ylabel('频率 (Hz)');
    xlim([0 t_axis(end)]);
    ylim([0 f_axis(end)]);
    colormap(jet);
    colorbar;
end
