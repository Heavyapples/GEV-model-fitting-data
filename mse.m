data = [17, 23, 11, 12, 15, 15, 17, 22, 15, 22, 6, 16, 26, 10, 21, 22, 23, 9, 18, 25, 17, 15, 18, 17, 13, 14, 16, 19, 19, 17, 9, 22, 17, 17, 16, 12, 25, 30, 20, 19, 22, 22, 9, 21, 16, 25, 7, 21, 19, 26, 15, 26, 20, 21, 29, 29, 17, 14, 18, 20, 21, 17];

k_value = -0.307177879;
mu_value = 16.44727319;
alpha_value = 5.384757022;

syms x k mu alpha;

% 定义CDF
cdf = exp(-((1 - k*((x - mu) / alpha))^(1/k)));

% 对CDF关于x求导数，得到PDF
pdf = diff(cdf, x);

% 将符号表达式转换为MATLAB函数
pdf_func = matlabFunction(pdf);

% 使用拟合参数和数据计算拟合值
fit_values = pdf_func(data, k_value, mu_value, alpha_value);

% 计算残差
residuals = data - fit_values;

% 计算残差平方和（RSS）
RSS = sum(residuals.^2);

% 计算均方误差（MSE）
MSE = RSS / length(data);

fprintf('均方误差 (MSE) = %.4f\n', MSE);
