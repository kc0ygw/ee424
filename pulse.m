function p = pulse(f,td,fs)
% f -- frequency in Hz
% td -- duration of the pulse (sec)
% fs -- sampling frequency

n = floor(td*fs);
t = [1:n]/fs;
p = hann(n)'.*cos(2*pi*f*t);

