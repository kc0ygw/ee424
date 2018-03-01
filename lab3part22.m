clear
cla

signal = sinc(-1:0.02:0.98);
ksignal = 0:99;

figure(1)
stem(ksignal, signal)
title("The Bandlimited Signal")
ylabel("Amplitude")
xlabel("Time")

komega = ((1:2000) - 1)*2*pi/2000-pi;
for ii=1:2000
    y(ii) = dtft(signal, ksignal, komega(ii));
end

figure(2)
plot(komega,abs(y))
xlabel('\omega')
ylabel('|F(rect)(\omega)|')
title('Magnitude of DTFT from -\pi to \pi of the Signal')
grid

% High Pass Filter Response
M = 50;
kfilt = 1:M;
wc = 1/5;
lp = wc*sinc(wc*(kfilt-M/2));
hp = sinc(kfilt-M/2) - lp;

% dtft of lp

komega = ((1:2000) - 1)*2*pi/2000-pi;
for ii=1:2000
    y(ii) = dtft(lp, kfilt, komega(ii));
end

figure(3)
subplot(2,1,1)
plot(komega,abs(y))
xlabel('\omega')
ylabel('|F(rect)(\omega)|')
title('lp DTFT from -\pi to \pi of the Signal')
grid
subplot(2,1,2)
plot(komega,angle(y));
xlabel('\omega');
ylabel('\angle F(rect)(\omega)')
grid

%dtft of hp

komega = ((1:2000) - 1)*2*pi/2000-pi;
for ii=1:2000
    y(ii) = dtft(hp, kfilt, komega(ii));
end

figure(4)
subplot(2,1,1)
plot(komega,abs(y))
xlabel('\omega')
ylabel('|F(rect)(\omega)|')
title('hp DTFT from -\pi to \pi of the Signal')
grid
subplot(2,1,2)
plot(komega,angle(y));
xlabel('\omega');
ylabel('\angle F(rect)(\omega)')
grid

% One can see that the signal can pass through lp and not hp.

% Computer and Plot the output of the hp

% Pass Signal through channel:

% Modulate Signal

omega0 = 3*pi/5; % middle of hp

msignal = cos(omega0*ksignal).*signal;


% DTFT of msignal

komega = ((1:2000) - 1)*2*pi/2000-pi;
for ii=1:2000
    y(ii) = dtft(signal, ksignal, komega(ii));
end

figure(5)
subplot(2,1,1)
plot(komega,abs(y))
xlabel('\omega')
ylabel('|F(rect)(\omega)|')
title('msignal DTFT from -\pi to \pi of the Signal')
grid
subplot(2,1,2)
plot(komega,angle(y));
xlabel('\omega');
ylabel('\angle F(rect)(\omega)')
grid

% Compute Channel Output
moutput = conv(msignal,hp);

figure(6)
x = 0:1:148;
stem(x, moutput)
ylabel("Amplitude")
xlabel("Time")
title("msignal passing through hp")

komega = ((1:2000) - 1)*2*pi/2000-pi;
for ii=1:2000
    y(ii) = dtft(moutput, x, komega(ii));
end

figure(7)
subplot(2,1,1)
plot(komega,abs(y))
xlabel('\omega')
ylabel('|F(rect)(\omega)|')
title('moutput*hp DTFT from -\pi to \pi of the Signal')
grid
subplot(2,1,2)
plot(komega,angle(y));
xlabel('\omega');
ylabel('\angle F(rect)(\omega)')
grid

% Implement Demodulator

dsignal_top = cos(omega0*x).*moutput;
lp_dsignal_top = conv(lp, dsignal_top);

dsignal_bot = sin(omega0*x).*moutput;
lp_dsignal_bot = conv(lp, dsignal_bot);

dsignal = lp_dsignal_top + lp_dsignal_bot;

figure(8)
z = 0:1:197;
stem(z, dsignal)
title("dsignal")
ylabel("Amplitude")
xlabel("Time")

komega = ((1:2000) - 1)*2*pi/2000-pi;
for ii=1:2000
    y(ii) = dtft(dsignal, z, komega(ii));
end

figure(9)
subplot(2,1,1)
plot(komega,abs(y))
xlabel('\omega')
ylabel('|F(rect)(\omega)|')
title('dsignal DTFT from -\pi to \pi of the Signal')
grid
subplot(2,1,2)
plot(komega,angle(y));
xlabel('\omega');
ylabel('\angle F(rect)(\omega)')
grid





