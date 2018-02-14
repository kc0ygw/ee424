%%
% Christopher Caldwell
% Valery Smith
% EE 424
% Lab 1
%%

%Task 1:

%Define x: 5 Hz cosine, sampled at 500 Hz for 1 sec. 
%		Resulting Nyquist Rate is 10 Hz.

f = 5;
t = 0:1/500:1;
x = cos(2*pi*f*t);

%Subsampling at a rate of 500/m Hz.
%Subsample for m = 10, 20, 30, 50

m = 10;
figure(1);
subplot(4,1,1);
stem(t(1:m:end), x(1:m:end));
hold on;
plot(t, x, '--');
ylabel("Amplitude")
xlabel("Time")
title("Subsample m = 10")

m1 = 20;
subplot(4,1,2);
stem(t(1:m1:end), x(1:m1:end));
hold on;
plot(t, x, '--');
ylabel("Amplitude")
xlabel("Time")
title("Subsample m = 20")

m2 = 30;
subplot(4,1,3);
stem(t(1:m2:end), x(1:m2:end));
hold on;
plot(t, x, '--');
ylabel("Amplitude")
xlabel("Time")
title("Subsample m = 30")

m5 = 50;
subplot(4,1,4);
stem(t(1:m5:end), x(1:m5:end));
hold on;
plot(t, x, '--');
ylabel("Amplitude")
xlabel("Time")
title("Subsample m = 50")

%put all plots in one figure




%%

%Task 2:
subplot_i = 3;

%a)

fs=8192;
f2=200;
dur=1;
t2=1/fs:1/fs:dur;

xh=cos(2*pi*f2*t2);
%%
sound(xh/(max(abs(xh))));
%%
xh8th = xh(1:8:end);

figure(2);

subplot(subplot_i,1,1);
stem(t2(1:1:256), xh8th(1:1:256));
title("xh8th samples")
ylabel("Amplitude")
xlabel("Time")

subplot(subplot_i,1,2);
stem(t2(1:1:256), xh(1:1:256));
title("xh samples")
ylabel("Amplitude")
xlabel("Time")

%b)
x0 = zeros(1,fs); %Vector of zeros
x0(1:8:fs) = xh8th; %Upsampled xh8th vector

subplot(subplot_i,1,3);
stem( x0(1:256));
title("x0 - Super Sampled xh8th")
ylabel("Amplitude")
xlabel("Time")


%%
sound(x0/(max(abs(x0))));
%%
%c)

filt_1 = ones([1,8]);
x1 = conv(x0, filt_1);

figure(3)
stem( x1(1:256));
title("x1 - sample-and-hold filter")
ylabel("Amplitude")
xlabel("Time")
%
sound(x1/(max(abs(x1))));
%%
%d)
filt_2 = linspace(0,1,8);
filt_2 = [filt_2,linspace(1,0,8)];
xf2 = conv(x0,filt_2);

figure(4)
stem( xf2(1:256));
title("xf2 - TRIANGLE")
ylabel("Amplitude")
xlabel("Time")
%e)
sinf = sinc(1024*[-16:16]/fs);
hf = sinf .*hann(length(sinf))';

xf3 = conv(x0,hf);
figure(5)
stem( xf3(1:256));
title("xf2 - HANN WINDOW")
ylabel("Amplitude")
xlabel("Time")
%f)

sinf2 = sinc(1024*[-32:32]/fs);
hf2 = sinf2 .*hann(length(sinf2))';

xf4 = conv(x0,hf2);
figure(6)
stem( xf4(1:256));
title("xf4 - BIGGER HANN WINDOW")
ylabel("Amplitude")
xlabel("Time")
%g)

comp0 = xh(1:256) - x0((1:256));
figure(7)
stem(comp0);
title("COMPARISON1 - original vs 0s")
ylabel("Amplitude")
xlabel("Time")

comp1 = xh(1:256) - x1((1:256));
figure(8)
stem(comp1);
title("COMPARISON2 - original vs SoH");
ylabel("Amplitude")
xlabel("Time")


comp2 = xh(1:256) - xf2((1:256)+8);
figure(9)
stem(comp2);
title("COMPARISON3 - original vs triangle");
ylabel("Amplitude")
xlabel("Time")

comp3 = xh(1:256) - xf3((1:256)+16);
figure(10)
stem(comp3);
title("COMPARISON4 - original vs Hann window");
ylabel("Amplitude")
xlabel("Time")

comp4 = xh(1:256) - xf4((1:256)+32);
figure(11)
stem(comp4);
title("COMPARISON5 - original vs BIGGER HANN WINDOW");
ylabel("Amplitude")
xlabel("Time")

%%
%Task 3!
%use xh for xh
%use xh8th for x
%use x0 for x0

x0new = round(x0/(1/2))*(1/2); %Quantizes to 5 Levels

figure(12)
stem(x0new)
ylabel("Amplitude")
xlabel("Time")
title("5 Levels of Quantization")
%Quantizes to 9 Levels

x0new_9 = round(x0/(1/4))*(1/4);

figure(13)
stem(x0new_9)
ylabel("Amplitude")
xlabel("Time")
title("9 Levels of Quantization")

%Quantizes to 17 Levels

x0new_17 = round(x0/(1/8))*(1/8);

figure(14)
stem(x0new_17)
ylabel("Amplitude")
xlabel("Time")
title("17 Levels of Quantization")

%Quantizes to 33 Levels

x0new_33 = round(x0/(1/16))*(1/16);

figure(15)
stem(x0new_33)
ylabel("Amplitude")
xlabel("Time")
title("33 Levels of Quantization")

%Quantizes to 65 Levels
x0new_65 = round(x0/(1/32))*(1/32);

figure(16)
stem(x0new_65)
ylabel("Amplitude")
xlabel("Time")
title("65 Levels of Quantization")
%Reconstructions

new_recon = conv(x0new, hf2);

figure(17)
stem(new_recon);
title("5 Level Quantization of x0new")
comp4 = xh(1:256) - new_recon((1:256)+32);
ylabel("Amplitude")
xlabel("Time")

figure(22)
stem(comp4);
title("COMPARISON6 - original vs filterd 2-bit quantization");
ylabel("Amplitude")
xlabel("Time")

%9
new_recon = conv(x0new_9, hf2);

figure(18)
stem(new_recon);
title("9 Level Quantization of x0new")
comp4 = xh(1:256) - new_recon((1:256)+32);
ylabel("Amplitude")
xlabel("Time")

figure(23)
stem(comp4);
title("COMPARISON7 - original vs filterd 3-bit quantization");
ylabel("Amplitude")
xlabel("Time")

%17
new_recon = conv(x0new_17, hf2);

figure(19)
stem(new_recon);
title("17 Level Quantization of x0new")
comp4 = xh(1:256) - new_recon((1:256)+32);
ylabel("Amplitude")
xlabel("Time")

figure(24)
stem(comp4);
title("COMPARISON8 - original vs filterd 4-bit quantization");
ylabel("Amplitude")
xlabel("Time")

%33
new_recon = conv(x0new_33, hf2);

figure(20)
stem(new_recon);
title("33 Level Quantization of x0new")
comp4 = xh(1:256) - new_recon((1:256)+32);
ylabel("Amplitude")
xlabel("Time")

figure(25)
stem(comp4);
title("COMPARISON9 - original vs filterd 5-bit quantization");
ylabel("Amplitude")
xlabel("Time")

%65
new_recon = conv(x0new_65, hf2);

figure(21)
stem(new_recon);
title("65 Level Quantization of x0new")
comp4 = xh(1:256) - new_recon((1:256)+32);
ylabel("Amplitude")
xlabel("Time")

figure(26)
stem(comp4);
title("COMPARISON10 - original vs filterd 6-bit quantization");
ylabel("Amplitude")
xlabel("Time")








   

 