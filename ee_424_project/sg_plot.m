function sg_plot(tl,fl,y)
%
%  function sg_plot(tl,fl,y)
%
%  Plot an image of the spectrogram y, with the axis labeled with time tl,
%  and frequency fl
% 
%    tl -- time axis label, nt samples
%    fl -- frequency axis label, nf samples
%    y  -- spectrogram, nf by nt array
%

% find the maximum
mx = max(max(abs(y)));

% compute 20*log magnitude, scaled to the max
yl = 20*log10(abs(y/mx)+eps);

% show 60 dB of dynamic range
dbf = 60;

image(tl,fl,64*(yl+dbf)/dbf); axis xy; colormap('gray');

xlabel('Time, s');
ylabel('Frequency, Hz');