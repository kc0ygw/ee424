


%% *EE 424: Lab 1 Signal Reconstruction*


%% _Valery Smith and Christopher Caldwell_

%% Introduction:

%% Task 1:

% In this first section of the lab, we needed to define a vector that represented a 5 Hz cosine waveform, sampled at 500 Hz for 1 second. Next, we subsampled at four different frequencies: 50 Hz, 25 Hz, 16.66….. Hz, and 10 Hz.
% We plotted them as subplots in comparison to the continuous time cosine, that is shown as an overlying dashed line.
% *Figure 1: Subsampling a Sampled Cosine*
% It does become quite clear that reconstruction becomes non-trivial as the frequency at which one samples approaches the Nyquist Sampling Frequency.

%% Task 2:

% In this second section, we look at different reconstructions of a sampled sinusoid. Everything was in the audio range, so that we could also *hear* the changes as we *saw* he changes in our plots.
% Our basic signal was a 200 Hz cosine, sampled at 8192 Hz. We took every 8th symbol and put them in another vector. Then we convolved this vector with different filters to see if we could reconstruct the original 200 Hz cosine wave.
% The different filters we convolved it with were an 8-sample constant function (the DT version of the CT sample and hold system), a wedge filter, a Hann-windowed sinc, and a Hamming-windowed sinc (the difference being that the Hamming-windowed sinc has a small DC-value, while the Hann-windowed sinc does not). Below are our plots:

%%
% <insert figures>
%%

% Once we created these new reconstructed signals, we plotted the deviation from from the original signal - the error. Here are these plots:

%%
% <insert figures>
%%
% It is clear, that linear interpolation and wedge filters are not as good as sinc functions. But of the windowed sincs, the Hann window works the best.

%% Task 3:

% In the last section of this lab, we quantized the original x0 (a 200 hz cosine wave sampled at 8192 hz), at 2-6 bit+1 levels. We then reconstructed and compared the quantization schemes with the original and plotted these comparisons.  

% Observing these plots it appears that as the number of quantization levels increase the more it resembles the reconstruction using the Hann window comparison from Task two. We were expected the amount of error to decrease as the quantization levels increase, this did happen, but we did not expect what looks like a transient in the beginning of the comparison graphs.  

