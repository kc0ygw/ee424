cla
clear
%% Task1
%% Part A

rect=zeros(1, 30); rect(6:15)=1;

krect=[0:29];
figure(1)
subplot(211)
stem(krect, rect);
title('Christopher and Valery, A, Stem Plot of Rectangle');
xlabel('n');
ylabel('rect[n]')

subplot(212)
plot(krect, rect);
title('Christopher and Valery, A, Plot of Rectangle');
xlabel('n');
ylabel('rect[n]'), %print
%% iii

% We should use Stem Plot!!!
%% iv
% If N approached infinity, such that it is not tractable to visually see 
% the different samples, then we would probably switch to the continuous 
% time plot.

%% Task B

%% Task C

%% i 

ky = ((1:2000) - 1)*2*pi/2000-pi;
for ii=1:2000
    y(ii) = dtft(rect, krect, ky(ii));
end

figure(2)
subplot(2,1,1)
plot(ky,abs(y))
xlabel('\omega')
ylabel('|F(rect)(\omega)|')
title('DTFT from -\pi to \pi of the Rectangular Pulse')
grid
subplot(2,1,2)
plot(ky,angle(y));
xlabel('\omega');
ylabel('\angle F(rect)(\omega)')
grid
%% ii

% For the Magnitude peaks and nulls, it is exactly what we expect, because
% we are plotting the DTFT of a rectangle. The jumps in phase are related 
% to sign changes in the digital sinc.


%% iii
figure(3)
plot(ky,y)
grid
ylabel('Amplitude')
xlabel('\omega')

% Note that the Imaginary parts have been ignored from y in this plot.
% It looks like a sinc along with a cosine or a sine function. 
%
% To improve resolution, we increase number of ky elements to create a
% longer vector with finer slices.

%% iv
% We expect the x[n]*x[n] DTFT to yeild a variation of the sinc^2 function
% because convolving two rectabgles is the same as multiplying two sincs in
% frequency

%% v
x=rect;
z=conv(x,x);
kzrect=[0:length(z)-1];
figure(4)
plot(z)
xlabel('n')
ylabel('amplitude')
title('convolution of two rectangles')

kzy = ((1:2000) - 1)*2*pi/2000-pi;
for ii=1:2000
    zy(ii) = dtft(z, kzrect, kzy(ii));
end

figure(5)
subplot(2,1,1)
plot(kzy,abs(zy))
xlabel('\omega')
ylabel('|F(rect*rect)(\omega)|')
title('DTFT from -\pi to \pi of the Rectangular Pulse convoluted with another rectangular pulse')
grid
subplot(2,1,2)
plot(kzy,angle(zy));
xlabel('\omega');
ylabel('\angle F(rect)(\omega)')
grid


% plot and explain 
% We took the DTFT of the triangle and it outputed a plot of Sinc-Squared.

%%
% Part D
%
% i)
test_input = ones(1, 200);
imp_response_filt1 = filt1(test_input);

figure(6)
plot(imp_response_filt1)
grid
title("Unit Step Response of Filter 1")
xlabel("Time")
ylabel("Amplitude")

% ii)


dcrect=[0:length(imp_response_filt1)-1];
kdc = ((1:2000) - 1)*2*pi/2000-pi;

for ii=1:2000
    dc(ii) = dtft(imp_response_filt1, dcrect, kdc(ii));
end
figure(7)
subplot(2,1,1)
plot(kdc,abs(dc))
xlabel('\omega')
ylabel('|Filter1(\omega)|')
title('DTFT from -\pi to \pi of the Rectangular Pulse convoluted with another rectangular pulse')
grid
subplot(2,1,2)
plot(kdc,angle(dc));
xlabel('\omega');
ylabel('\angle Filter1(\omega)')
grid

% Derive an expression for the frequency respones of Filter 1
% <insert from scratch paper>

% iii)
% Plot of Overlayed Magnitudes
% Computation of Theoretical Expression.
figure(8)
syms w;
aa =exp(-i*2*kdc)-2;
bb = (1-1.4*exp(-i*kdc)+0.85*exp(-i*2*kdc));
test_y = aa./(bb);
plot(kdc,abs(real(test_y)), '--')
hold on
v = 9;
% figure(v)
% subplot(2,1,1)
plot(kdc,abs(dc))
xlabel('\omega')
ylabel('|Filter1(\omega)|')
title('nawww dawg')
grid on;
%subplot(2,1,2)
% plot(w, abs(real(calc_hfw)), '--')

%%
% iv \alpha.
kx = ([1:200]-1); x=cos(kx*pi/8);
ycos = filt1(x);
figure(v+1)
plot(kx, [x',ycos'])
grid
xlabel("Time")
ylabel("Amplitude")
title("Plot comparing cos(\pi/8 * t) before and after Filt1")

% What are the interesting features of this plot?
% How does this plot relate to the DTFT computed and plotted above?

% iv \Beta.

% Make prediction based on iii \alpha when driving filt1 with 3pi/4

x2 = cos(kx*3*pi/4);
ycos2 = filt1(x2);
figure(v+2)
plot(kx, [x2', ycos2'])
grid on;
xlabel("Time")
ylabel("Amplitude")
title("Plot comparing cos(3\pi/4 * t) before and after Filt1")

% EXPLAIN THE ABOVE TWO SECTIONS QUANTITITATIVELY:

% When we fed filt1 with a step, we saw a large transient response in the 
% step response. Thus we expected the gain in amplitude in when feeding
% filt1 with a cosine - it will compound with the cosine and not fully
% dissipate.
% 
% When we feed it with the faster cosine 






