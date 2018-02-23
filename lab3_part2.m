%% Lab3 Part 2
clear
clc
% Modulation:
% Generate Bandlimited Signal
signal = sinc(-1:0.02:0.98);
ksignal = 0:99;
figure(1)
stem(ksignal, signal);
set(get(gca, 'XLabel'), 'String', 'Time');
set(get(gca, 'YLabel'), 'String', 'Amplitude');
set(get(gca, 'Title'), 'String', 'Signal Stem Plot');

% Compute DTFT of signal
komega = ((1:2000) - 1)*2*pi/2000-pi;
for ii=1:2000
    y(ii) = dtft(signal, ksignal, komega(ii));
end

% Plot DTFT of signal
figure(2)
subplot(2,1,1)
plot(komega,abs(y))
xlabel('\omega')
ylabel('|F(rect)(\omega)|')
title('DTFT from -\pi to \pi of the Signal')
grid
subplot(2,1,2)
plot(komega,angle(y));
xlabel('\omega');
ylabel('\angle F(rect)(\omega)')
grid

% Transmit signal through High Pass Filter

% Approximate Impulse Response of HPF
M = 50;
kfilt = 1:M;
wc = 1/5;
lp = wc*sinc( wc*(kfilt-M/2));
hp = sinc(kfilt-M/2) - lp;

% Plot Impulse Response lp[n] and DTFT{lp[n]}
% Compute DTFT of lp
komega = (1:50)*2*pi/50-pi;
for ii=1:50
    y2(ii) = dtft(lp, kfilt, komega(ii));
end

% FIXME NOT WORKING

% Plot DTFT of signal
figure(3)
subplot(3,1,1)
stem(lp)
grid
xlabel('time')
ylabel('Amplitude')
title('Impulse Response of lp[n]')
subplot(3,1,2)
plot(komega,abs(y2))
xlabel('\omega')
ylabel('|F(rect)(\omega)|')
title('DTFT from -\pi to \pi of the lp[n]')
grid
subplot(3,1,3)
plot(komega,angle(y2));
xlabel('\omega');
ylabel('\angle F(rect)(\omega)')
grid

% Plot DTFT and hp[n] impulse response
% Compute DTFT of lp
komega = (1:50)*2*pi/50-pi;
for ii=1:50
    y3(ii) = dtft(lp, kfilt, komega(ii));
end

% FIXME NOT WORKING

% Plot DTFT of signal
figure(4)
subplot(3,1,1)
stem(hp)
grid
xlabel('time')
ylabel('Amplitude')
title('Impulse Response of hp[n]')
subplot(3,1,2)
plot(komega,abs(y3))
xlabel('\omega')
ylabel('|F(rect)(\omega)|')
title('DTFT from -\pi to \pi of the hp[n]')
grid
subplot(3,1,3)
plot(komega,angle(y3));
xlabel('\omega');
ylabel('\angle F(rect)(\omega)')
grid

% Pass Signal through Channel:
omega0 = .375*pi;% 3/8 * pi % appropriate discrete-time angular frequency
msignal = cos(omega0*ksignal).*signal;

% Plot DTFT of msignal
komega = (1:100)*2*pi/100-pi;
for ii=1:100
    y4(ii) = dtft(msignal, 1:2*M, komega(ii));
end
figure(5)
subplot(3,1,1)
stem(y4)
grid
xlabel('time')
ylabel('Amplitude')
title('Impulse Response of msignal')
subplot(3,1,2)
plot(komega,abs(y4))
xlabel('\omega')
ylabel('|F(rect)(\omega)|')
title('DTFT from -\pi to \pi of msignal')
grid
subplot(3,1,3)
plot(komega,angle(y4));
xlabel('\omega');
ylabel('\angle F(rect)(\omega)')
grid

% Compute moutput











