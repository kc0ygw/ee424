function myspectrogram(x,m,fs)
%first let's get the blocksize and length of the signal
x_leng = length(x)
numblock=ceil(x_leng/m)
tmp = mod(numblock,2);

if tmp == 0
    z1 = ((numblock)*m);
else
    z1 = ((numblock+1)*m);
end
%Now lets zero pad
xp =zeros(1,z1);
xp(1:x_leng)=x;

% defining new xp = nxp
nxp = zeros(1, m*(2*numblock - 1)); % 2nt - 1 = m*(2*numblock - 1)

% define first m elements as xmw column 1

% nxp(1:length(xp)) = xp(1:z1);

% define the rest as the overlapped elements

for jj = 1:2*numblock-1
    nxp((jj-1)*m+1:jj*m) = xp((jj-1)*(m/2)+1:m+((jj-1)*m/2));
end


nxm = reshape(nxp, m, 2*numblock-1);

% hh = hann(m)*ones(1, tmp_ln);

size(nxm)
size(hann(m)*ones(1, 2*numblock-1))
% for ii = 1:1:m
xmw = nxm.*(hann(m)*ones(1, 2*numblock-1));
% end

nxmf = fft(xmw);



tl=[1:fs:numblock/fs];
fl=[0:(m/2-1)]*fs/m;

sg_plot(tl,fl,nxmf(1:m/2,:));

