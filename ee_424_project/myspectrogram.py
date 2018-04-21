"""
Christopher Caldwell Valery Smith
EE 424
04-14-18
"""

import numpy as np
import matplotlib.pyplot as plt
import math
import wave
import scipy.signal
from scipy.io import wavfile


def sg_plot(tl, fl, y):

    """
    function sg_plot(tl, fl, y)

    Plot and image of the spectrogram y, with the axis labeled with time tl,
    and frequency fl

        tl -- time axis label, nt samples
        fl -- frequency axis label, nf samples
            y -- spectrogram, nf by nt array
    """

    # find the maximum
    mx = np.amax(np.amax(np.absolute(y)))

    # compute 20*log magnitude, scaled to the max
    yl = 20*np.log10(np.absolute(y//mx)+np.finfo(float).eps)

    dbf = 60

    plt.imshow((tl, fl, 64*(yl+dbf)//dbf), cmap='gray')

    plt.xlabel('Time, s')
    plt.ylabel('Frequency, Hz')


def myspectrogram(x, m: int, fs: int):

    # first let's get the blocksize and length of the signal
    x_leng = len(x)
    numblock = math.ceil(x_leng//m)
    tmp = numblock%2

    # if tmp == 0:
    #     z1 = (-1+numblock)*m
    # else:
    #     z1 = (numblock)*m
    
    # Zero Padding
    # x = np.transpose(x)
    # xp = np.zeros(z1)
    # print(len(x))
    # print(len(xp))
    # print(len(xp)-len(x))
    # print(x.shape)
    # print(xp.shape)
    # print(x)
    # print(xp)
    x = np.transpose(x)
    xp[0:x_leng] = x
    

    # # # Defining new xp = nxp

    # nxp = np.zeros(m*(2*numblock))

    # print('0 -> '+str(m-1))
    # print(xp)

    # for jj in range(0, 2*numblock):
    #     nxp[jj*m:(jj+1)*m-1] = xp[jj*(m//2):-1+m+((jj)*m//2)]

    # nxm = np.ndarray.reshape(nxp, m, 2*numblock);
    
 
    # xmw = nxm*(scipy.signal.hann(m)*np.ones(0, 2*numblock))

    # nxmf = np.fft.fft(xmw)


    # # #tl=[1:fs:numblock/fs]
    # # tl = np.arange(1, numblock/fs, fs)
    # # print(tl)
    # # # fl=[0:(m/2-1)]
    # # fl = np.arange(0, (m/2-1))
    # # print(fl)
    # # print(nxmf[1:m/2,:])
    # # sg_plot(tl, fl, nxmf[1:m/2,:])


#[s4, Fs] = audioread('Nicki-Minaj-Anaconda.wav');
samp, sig = wavfile.read('/home/christopher/D/Neil Young - Alabama-PE0Ak7375lg.wav')
wav0, wav1 = np.split(sig, 2, axis=1)

wav_mono = .5*(wav0)+.5*(wav1)

wavfile.write("wav_m.wav", samp, wav_mono)

t = np.arange(0,((4*60)+49)-((4*60)+49)/(len(wav_mono)),((4*60)+49)/(len(wav_mono)+1))

# print(len(wav_mono))
# plt.plot(t, wav_mono)
# plt.title("Neil Young Alabama")
# plt.xlabel('Time in seconds')
# plt.show()

myspectrogram(wav_mono, 256, 44100)
plt.title("Neill Young - 1024")
plt.show()