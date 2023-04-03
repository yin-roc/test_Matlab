% 生成长度为2000的信号
fs = 1000;
t = linspace(0, 2, 2000);
x = sin(2*pi*50*t) + sin(2*pi*200*t);

% 设置STFT参数
window = hamming(256);
noverlap = length(window)/2;
nfft = 1024;

% 计算STFT谱
[S, F, T] = spectrogram(x, window, noverlap, nfft, fs);

% 绘制谱图
figure;
surf(T, F, 20*log10(abs(S)), 'EdgeColor', 'none');
axis tight;
view(0,90);
xlabel('Time (s)');
ylabel('Frequency (Hz)');
colorbar;
