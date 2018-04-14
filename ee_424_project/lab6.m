% Lab six run code

%% Valery Smith and Christopher Caldwell
%% EE 520
close all
load('sound.mat')

Fs = 8192; % Hz
L = 200000;
N = 100;
M = L/N;

% % soundsc(s1, Fs)


% 
% % soundsc(s2, Fs)

% % soundsc(s3, Fs)

% 
% % Time and Frequency Labels

fl = linspace(0, 4000, 5);
tl = linspace(0, 18, 10);




figure(1)
myspectrogram(s1,128,Fs)
title("Bird - 128")
figure(2)
myspectrogram(s1,256,Fs)
title("Bird - 256")
figure(3)
myspectrogram(s1,512,Fs)
title("Bird - 512")
figure(4)
myspectrogram(s1,1024,Fs)
title("Bird - 1024")

figure(5)
myspectrogram(s2,128,Fs)
title("Door - 128")
figure(6)
myspectrogram(s2,256,Fs)
title("Door - 256")
figure(7)
myspectrogram(s2,512,Fs)
title("Door - 512")
figure(8)
myspectrogram(s2,1024,Fs)
title("Door - 1024")

figure(9)
myspectrogram(s3,128,Fs)
title("Orca - 128")
figure(10)
myspectrogram(s3,256,Fs)
title("Orca - 256")
figure(11)
myspectrogram(s3,512,Fs)
title("Orca - 512")
figure(12)
myspectrogram(s3,1024,Fs)
title("Orca - 1024")




[s4, Fs] = audioread('Nicki-Minaj-Anaconda.wav');

s4 = .5*(s4(:,1) + s4(:,2));
figure(22)
plot(0:((4*60)+49)/(length(s4)):((4*60)+49)-((4*60)+49)/(length(s4)),s4)
title("Nikki Minaj's Anaconda")
xlabel('Time in seconds');
figure(13)
myspectrogram(s4, 512, Fs);
title("Anaconda - 512")

figure(14)
myspectrogram(s4, 256, Fs);
title("Anaconda - 256")

figure(15)
myspectrogram(s4, 1024, Fs);
title("Anaconda - 1024")



