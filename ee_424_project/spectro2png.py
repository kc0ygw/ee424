from __future__ import unicode_literals #there's a shitton of dependencies make sure you have them all
import wave, math, os, audioop, scipy
import os
from playsound import playsound
import scipy.io 
from scipy.io import wavfile
import scipy.signal
import youtube_dl
from subprocess import call
from numpy import fft
import numpy as np
import plotly
from plotly.graph_objs import Scatter, Layout #this is for plotting maybe unessecary
import pandas as pd
import tensorflow as tfs
import scipy.misc as misc
import matplotlib.pyplot as plt
import re
#there are 4 artists with 0-19 songs each

def create_spectrogram(song, file):

    rate, sig = wavfile.read(song)

    wav0, wav1 = np.split(sig, 2, axis=1)

    wav_mono = .5*(wav0+wav1)
    #wav_mono = wav0
    f, t, Sxx = scipy.signal.spectrogram(np.squeeze(wav_mono), rate)
    
    plt.pcolormesh(t, f, Sxx)
    plt.ylabel('Frequency [Hz]')
    plt.xlabel('Time [sec]')
 
    plt.plot()
    plt.savefig(file)

trainingDic={"NY":[],"TS":[],"FM":[],"TP":[]}

#location = "/mnt/c/Users/Valery/424/" #location of where the file is, the music needs to be in the same directory
location  = "/home/christopher/Music/music_424"

#here is reading the wav

for file in os.listdir(location):  
    png_name = re.sub('.wav', '.png', file)

    if file.endswith(".wav") and file.startswith("NY"):
        # print(file)
        create_spectrogram(location+'/'+file, location+'/'+png_name)
        print(png_name)
        trainingDic['NY'].append(misc.imread(location+'/'+png_name)) #put the sampling frequency and the song data as a row in the array
        
       
    if file.endswith(".wav") and file.startswith("TS"):
        # print(file)
        create_spectrogram(location+'/'+file, location+'/'+png_name)
        print(png_name)
        trainingDic['NY'].append(misc.imread(location+'/'+png_name))
          
       
    if file.endswith(".wav") and file.startswith("FM"):
        # print(file)
        create_spectrogram(location+'/'+file, location+'/'+png_name)
        print(png_name)
        trainingDic['NY'].append(misc.imread(location+'/'+png_name))
       
    if file.endswith(".wav") and file.startswith("TP"):
        # print(file)
        create_spectrogram(location+'/'+file, location+'/'+png_name)
        print(png_name)
        trainingDic['NY'].append(misc.imread(location+'/'+png_name))            
#and we are done reading the wave


#print('\n'.join(map(str, trainingDic['TP'][1][1][4800:4809]))) #check that the data was stored properly
#mk now let's split it into smaller ones