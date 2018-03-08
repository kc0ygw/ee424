clear; cla; 

%% Lab 4
%% Valery and Christopher

% Part 2:

% Generate pulse
pl = pulse(400, 0.2, 8192);
figure(1);
plot(pl);
grid on;
sound(pl);

% Generate echo-corrupted signal
plp = [pl zeros(1,8192-length(pl))]; % zero padded pulse

nd = 1024; 
alpha = -.5; 

a = [1 zeros(1,nd-1) -alpha];
b = 1;
y1 = filter(b,a,plp);

% echo delay of 1024/8192 = .125 secs
% echo scale of alpha = -.5

figure(2);
plot(y1);
grid on;
% sound(y1);

% Task 3 - Redo by subtracting shifted version

z1 = filter(a,b,y1);
figure(3);
plot(z1);
xlabel('\omega')
ylabel('|F(rect)(\omega)|')
title('DTFT from -\pi to \pi of the Rectangular Pulse')
grid on;
% sound(z1);

% Task 4
nd = 1024; 
alpha2 = -.45; 

a2 = [1 zeros(1,nd-1) -alpha2];
b = 1;
y2 = filter(b,a2,plp);

% echo delay of 1024/8192 = .125 secs
% echo scale of alpha = -.45

figure(4);
plot(y2);
grid on;
% sound(y2);

z2 = filter(a,b,y2);
figure(5);
plot(z2);
grid on;
sound(z1);

% 10% error is good enough

% Looking at errors in echo delay Nd

nd = 1024; 
alpha3 = -.5; 

a4 = [1 zeros(1,nd-1-1) -alpha3];    % -1
a5 = [1 zeros(1,nd-1+1) -alpha3];    % +1
a6 = [1 zeros(1,nd-1-2) -alpha3];    % -2
a7 = [1 zeros(1,nd-1+2) -alpha3];    % +2
a8 = [1 zeros(1,nd-1-10) -alpha3];   % -10
a9 = [1 zeros(1,nd-1+10) -alpha3];   % +10
a10 = [1 zeros(1,nd-1-20) -alpha3]; % -20
a11 = [1 zeros(1,nd-1+20) -alpha3]; % +20

%suprisingly I'm still hungry
%jk not suprisngly
%Foooooood
%I like pizza


b = 1;
y4 = filter(b,a4,plp);
y5 = filter(b,a5,plp);
y6 = filter(b,a6,plp);
y7 = filter(b,a7,plp);
y8 = filter(b,a8,plp);
y9 = filter(b,a9,plp);
y10 = filter(b,a10,plp);
y11 = filter(b,a11,plp);

% echo delay of 1024/8192 = .125 secs
% echo scale of alpha = -.5

figure(6);
plot(y2);
grid on;
% sound(y2);

z2 = filter(a,b,y2);
figure(515);
plot(z2);
grid on;
sound(z1);

z4 = filter(a4,b,y2);
figure(5);
plot(z4);
grid on;
sound(z4);

z5 = filter(a5,b,y2);
figure(6);
plot(z5);
grid on;
sound(z5);

z6 = filter(a6,b,y2);
figure(7);
plot(z6);
grid on;
sound(z6);

z7 = filter(a7,b,y2);
figure(8);
plot(z7);
grid on;
sound(z7);
%it looks squishy
%squishy squishy squishy