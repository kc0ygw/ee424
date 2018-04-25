import numpy as np

import matplotlib.pyplot as plt
import math
import wave
import scipy.signal
from scipy.io import wavfile


def create_spectrogram(song):

    rate, sig = wavfile.read(song)

    wav0, wav1 = np.split(sig, 2, axis=1)

    wav_mono = .5*(wav0+wav1)
    #wav_mono = wav0
    f, t, Sxx = scipy.signal.spectrogram(np.squeeze(wav_mono), rate)

    return f, t, Sxx

    
f, t, Sxx = create_spectrogram('/home/christopher/D/Neil Young - Alabama-PE0Ak7375lg.wav')
plt.pcolormesh(t, f, Sxx)
plt.ylabel('Frequency [Hz]')
plt.xlabel('Time [sec]')
plt.show()


   
