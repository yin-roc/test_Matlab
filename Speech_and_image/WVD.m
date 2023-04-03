% 生成信号
fs = 1000; % 采样率
t = 0:1/fs:1-1/fs; % 时间向量
x = sin(2*pi*100*t).*exp(-50*(t-0.5).^2); % 信号

% 计算Wigner-Ville分布
N = length(x);
wvd = zeros(N, N);
for m = 1:N
    for n = 1:N
        tau = n - m;
        if tau >= 1 && tau <= N && abs(tau) <= floor((N-1)/2) && round(m+tau/2) > 0 && round(m-tau/2) > 0 && round(m+tau/2) <= N && round(m-tau/2) <= N
            wvd(m,n) = x(round(m+tau/2))*conj(x(round(m-tau/2)));
        end
    end
end


% 绘制Wigner-Ville分布
t_axis = (0:N-1)/fs;
f_axis = (-N/2:N/2-1)/N*fs;
imagesc(t_axis, f_axis, abs(wvd));
axis xy;
xlabel('Time (s)');
ylabel('Frequency (Hz)');
title('Wigner-Ville Distribution');
