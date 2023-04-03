% 生成输入信号
fs = 1000; % 采样率为1000Hz
t = 0:1/fs:1; % 生成1秒的时间向量
f1 = 50; % 信号1的频率为50Hz
f2 = 150; % 信号2的频率为150Hz
x = sin(2*pi*f1*t) + sin(2*pi*f2*t); % 生成信号x，包含50Hz和150Hz的正弦波

% 进行小波变换
[C,L] = wavedec(x, 5, 'db4'); % 使用db4小波进行5层小波分解

% 重构小波系数
A5 = wrcoef('a', C, L, 'db4', 5); % 重构5级近似系数
D5 = wrcoef('d', C, L, 'db4', 5); % 重构5级细节系数
D4 = wrcoef('d', C, L, 'db4', 4); % 重构4级细节系数
D3 = wrcoef('d', C, L, 'db4', 3); % 重构3级细节系数
D2 = wrcoef('d', C, L, 'db4', 2); % 重构2级细节系数
D1 = wrcoef('d', C, L, 'db4', 1); % 重构1级细节系数

% 绘制信号和小波分解结果
subplot(7,1,1); plot(t,x); title('原始信号');
subplot(7,1,2); plot(t,A5); title('5级近似系数');
subplot(7,1,3); plot(t,D5); title('5级细节系数');
subplot(7,1,4); plot(t,D4); title('4级细节系数');
subplot(7,1,5); plot(t,D3); title('3级细节系数');
subplot(7,1,6); plot(t,D2); title('2级细节系数');
subplot(7,1,7); plot(t,D1); title('1级细节系数');
