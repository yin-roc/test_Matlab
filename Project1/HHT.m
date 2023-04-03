% 从文件中读取非平稳信号数据
signal_data = randn(1, 100); % 随机生成长度为100的向量
target = randi([0 1], 1, 100); % 随机生成长度为100的二进制向量

data = load('signal_data.mat');
signal_data = data.signal_data;

% 对信号进行初步观察和分析
figure;
plot(signal_data);
title('原始信号波形');
xlabel('时间（采样点）');
ylabel('幅值');


% 对信号进行HHT分解
imf = emd(signal_data);

% 绘制HHT分解结果和IMF分量
figure;
subplot(length(imf)+1,1,1);
plot(signal_data);
title('原始信号波形');
xlabel('时间（采样点）');
ylabel('幅值');

for i=1:length(imf)
    subplot(length(imf)+1,1,i+1);
    plot(imf(i));
    title(sprintf('IMF分量%d',i));
    xlabel('时间（采样点）');
    ylabel('幅值');
end



% 提取每个IMF分量的统计特征
function features = extract_features(imf)
features = [];
features(1) = mean(imf);
features(2)

end
