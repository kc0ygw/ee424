%% Valery Smith and Christopher Caldwell
%  Lab 5
%  March 22, 2018

%% Task 1

x_n = [1, -1, -1, 1, -1, 1, 1, 1, -1, 1, -1, 1];

p_n = [-1, -1, 1];
p_n_flip = fliplr(p_n);
y_n = conv(p_n, p_n_flip);
max_y_n = max(y_n);

figure(1)
subplot(3, 1, 1)
stem(0:length(x_n)-1, x_n)
title('x_n')
ylabel('Amplitude')
xlabel('Time')

subplot(3, 1, 2)
stem(0:length(p_n)-1, p_n)
title('p_n')
ylabel('Amplitude')
xlabel('Time')

subplot(3, 1, 3)
stem(0:length(y_n)-1, y_n)
title('y_n')
ylabel('Amplitude')
xlabel('Time')

%% Task 2

z = sign(randn(1, 50));


z_p_n = conv(p_n_flip, z);

figure(2)
subplot(2, 1, 1)
stem(1:50, z);
title('z')
ylabel('Amplitude')
xlabel('Time')

subplot(2, 1, 2)
stem(1:length(z_p_n), z_p_n)
title('z convolved with p_n')
ylabel('Amplitude')
xlabel('Time')

zpn_max = find(z_p_n==max(z_p_n)-1);

%% Task 3









