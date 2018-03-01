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
figure1=plot(krect, rect);
saveas(figure1,'lab31.png')
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
figure2=plot(ky,angle(y));
saveas(figure2,'lab32.png')
xlabel('\omega');
ylabel('\angle F(rect)(\omega)')
grid
%% ii

% For the Magnitude peaks and nulls, it is exactly what we expect, because
% we are plotting the DTFT of a rectangle. The jumps in phase are related 
% to sign changes in the digital sinc.


%% iii
figure(3)
figure3=plot(ky,y);
saveas(figure3,'lab33.png')
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
figure4=plot(z)
saveas(figure4,'lab34.png')
xlabel('n')
ylabel('amplitude')
title('convolution of two rectangles')

kzy = ((1:2000) - 1)*2*pi/2000-pi;
for ii=1:2000
    zy(ii) = dtft(z, kzrect, kzy(ii));
end

figure(5)
subplot(2,1,1)
figure5=plot(kzy,abs(zy));
saveas(figure5,'lab35.png')
xlabel('\omega')
ylabel('|F(rect*rect)(\omega)|')
title('DTFT from -\pi to \pi of the Rectangular Pulse convoluted with another rectangular pulse')
grid
subplot(2,1,2)
figure5=plot(kzy,angle(zy));
saveas(figure5,'lab35.png')
xlabel('\omega');
ylabel('\angle F(rect)(\omega)')
grid


% plot and explain 
% We took the DTFT of the triangle and it outputed a plot of Sinc-Squared.

%%
% Part D
%
% i)
test_input = zeros(1, 200);
test_input(1)=1;
imp_response_filt1 = filt1(test_input);


figure(6)
figure6=plot(imp_response_filt1)
saveas(figure6,'lab36.png')
grid
title("Impulse Step Response of Filter 1")
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
figure7=plot(kdc,angle(dc));
saveas(figure5,'lab37.png')
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
figure8=plot(kdc,abs(dc))
xlabel('\omega')
ylabel('|Filter1(\omega)|')
title('nawww dawg')
grid on;
saveas(figure5,'lab35.png')
%subplot(2,1,2)
% plot(w, abs(real(calc_hfw)), '--')

%it makes more sense to do this with impulse response so, we changed the input function from a unit step/rectangle 
%to an impulse function, allowing us to view the inpulse response.
%Co-incidentally this also had our derived frequency response line up with
%the frequncy respinse genrated by matlab because our calculations assumed
%x(n)= impulse. Seeing the impulse respulse it is evident that it is a
%transient. that settles at about n=80, it first spikes down then up, with
%smaller amplitudes until it settles. 
%
%

%%
% iv \alpha.
kx = ([1:200]-1); x=2*cos(kx*pi/8);
ycos = filt1(x);
figure(v+1)
figure1a=plot(kx, [x',ycos'])
saveas(figure1a,'lab3ten.png')
grid
xlabel("Time")
ylabel("Amplitude")
title("Plot comparing cos(\pi/8 * t) before and after Filt1")


% What are the interesting features of this plot?

%after the filter the phase is changed by like pi/4 or something not quite pi/2.
%after the inital tranisent the amplitude of the sinusoid settles to be
%about 4.7 * that of the origonal. This makes sense because looking at the
%frequency response, the filter will multiply frequincies of pi/8 by 
%4.737 which is what we see hapening 
% How does this plot relate to the DTFT computed and plotted above?

% iv \Beta.

% Make prediction based on iii \alpha when driving filt1 with 3pi/4 
%%lol we didn't need to graph that
%%
%The result when the 3*Pi/4 cosine is driven through the filter will be a
%reulting sinusoid with a trasient ant the begining out the output that has
%a phase shift of like pi*4 or something less than pi/2, and after the
%transient settles the amplitude will be 0.825 because that is the amplitude
%of the frequency response when omega = 3*pi/4. and 0.85 *1 =0.825. Juding 
% by our graph this is a valid explanation of what happens.




x2 = cos(kx*3*pi/4);
ycos2 = filt1(x2);
figure(v+2)
figure11=plot(kx, [x2', ycos2'])
saveas(figure11,'lab35.png')
grid on;
xlabel("Time")
ylabel("Amplitude")
title("Plot comparing cos(3\pi/4 * t) before and after Filt1")


% When we fed filt1 with a step, we saw a large transient response in the 
% step response. Thus we expected the gain in amplitude in when feeding
% filt1 with a cosine - it will compound with the cosine and not fully
% dissipate.
% 
% When we feed it with the faster cosine 

% Continue this discussion.

%% v
% What is the effect of the following command?
g = zeros(1, 100);
g(1)=1;
y2 = filt1(filt1(g));
%these comannds filter the filter so the frequncy response of this new thing is H(w)^2. 
%whoa I wonder what happends if I stop using a step input and instead us an
%impulse?
%it's very clearly the first impulse response squared and then the sign fliped.
% We detrimed this because it starts positive and then goes negitive in the
% oscilation, the inverse of the origonal. And the amplitudes have magnnitude matching square of the
% origonal impulse response. and because of the amplitude magnitude increase the transient lasts signifigantly longer.

%basically this lab taught us that impulse >>>>>>>>>> unit step. it is sooo
%much nice to work with. 


figure(v+3)
figure12=plot(1:100, y2)
grid on
title("filtering the filter")
saveas(figure12,'lab35.png')

figure(v+4)
figure13=plot(kdc,(abs(dc).^2))
xlabel('\omega')
ylabel('|Filter1(\omega)|')
title('nawww dawg squared')
saveas(figure13,'lab35.png')








