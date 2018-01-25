%%
% Christopher Caldwell
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

m = 2;

stem(t(1:m:end), x(1:m:end));

hold on;

plot(t, x, --);


