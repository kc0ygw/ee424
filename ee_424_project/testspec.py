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
    
    img_v = np.array(64*(yl+dbf)//dbf)
    img_v = img_v.astype(float)
    print(img_v)

    plt.imshow((tl, fl, img_v, 'gray', 'float',))

 #   plt.xlabel('Time, s')
  #  plt.ylabel('Frequency, Hz')

def myspectrogram(x, m: int, Fs: int):

    print(x.shape)

    # 
    # Pad x up to a multiple of m 
    # 

    lx = len(x)
    nt = int(np.ceil(lx/m))
    print(nt)
    print(nt*m)

    xp = np.zeros(int(nt*m))

    # print(xp.shape)
    x = np.transpose(x)

    xp[0:lx] = x

    #
    # use reshape to make it an m by nt matrix
    # 
    
    xm = np.ndarray.reshape(xp, m, nt)


    fl = np.arange(0, (-1 + m//2))*Fs//m
    print(fl)
    tl = np.arange(0, nt-1)*m//Fs
    print(tl)
    sg_plot(tl, fl, xm)


#[s4, Fs] = audioread('Nicki-Minaj-Anaconda.wav');
samp, sig = wavfile.read('/home/christopher/D/Neil Young - Alabama-PE0Ak7375lg.wav')
wav0, wav1 = np.split(sig, 2, axis=1)

wav_mono = .5*(wav0)+.5*(wav1)

fs = 8192

f, t, Sxx = scipy.signal.spectrogram(np.squeeze(wav_mono), fs)
print(Sxx.shape)
plt.pcolormesh(t, f, Sxx)
plt.ylabel('Frequency [Hz]')
plt.xlabel('Time [sec]')
plt.show()
# wavfile.write("wav_m.wav", samp, wav_mono)



# t = np.arange(0,((4*60)+49)-((4*60)+49)/(len(wav_mono)),((4*60)+49)/(len(wav_mono)+1))

# # print(len(wav_mono))
# # plt.plot(t, wav_mono)
# # plt.title("Neil Young Alabama")
# # plt.xlabel('Time in seconds')
# # plt.show()
# # print(wav_mono.shape)
# # wav_mono = np.transpose(wav_mono)
# # print(wav_mono.shape)
# myspectrogram(wav_mono, 256, 8192)
# plt.title("Neill Young - 1024")
# plt.show()