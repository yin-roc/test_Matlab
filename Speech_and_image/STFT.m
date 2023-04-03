% 生成测试信号
fs = 1000;   % 采样率为1000Hz
t = 0:1/fs:1-1/fs;  % 1秒的时间
f1 = 20;   % 信号频率为50Hz
f2 = 200;  % 信号频率为100Hz
x = cos(2*pi*f1*t) + cos(2*pi*f2*t);  % 两个正弦波信号的叠加

% 显示测试信号
figure;
plot(t,x);
xlabel('Time (sec)');
ylabel('Amplitude');
title('Test Signal');

% 设置STFT参数
win_len = 0.02;   % 窗口长度为20ms
hop_len = 0.01;   % 帧移长度为10ms
n_fft = 512;      % FFT长度为512

% 计算STFT
win = hamming(round(win_len*fs));  % 汉明窗口
[S,F,T] = spectrogram(x, win, round(hop_len*fs), n_fft, fs);

% 绘制频谱图
figure;
imagesc(T,F,20*log10(abs(S)));
set(gca,'YDir','normal');
xlabel('Time (sec)');
ylabel('Frequency (Hz)');
title('STFT Magnitude');
colorbar;

