t = 1:pi/4:10*pi;
x = 10.*cos(10.*pi.*t).*sin(2.*pi.*t);

figure(1);
subplot(2,1,1);

plot(t, x);
title('A Continuous Signal');
xlabel('Time');
ylabel('Amplitude');

subplot(2,1,2);
stem(t, x);
title('A Discrete Signal');
xlabel('Time');
ylabel('Amplitude');

%figure(3);

% subplot(3,1,3);
% freqz(x);
% title('A Sine Wave');
% xlabel('Time');
% ylabel('Amplitude');
