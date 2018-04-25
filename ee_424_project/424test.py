from __future__ import unicode_literals #there's a shitton of dependencies make sure you have them all
import wave, math, os, audioop, scipy
import os
from playsound import playsound
import scipy.io 
from scipy.io import wavfile
import youtube_dl
from subprocess import call
from numpy import fft
import plotly
from plotly.graph_objs import Scatter, Layout #this is for plotting maybe unessecary
import pandas as pd
import tensorflow as tfs
#there are 4 artists with 0-19 songs each


trainingDic={"NY":[],"TS":[],"FM":[],"TP":[]}

#location = "/mnt/c/Users/Valery/424/" #location of where the file is, the music needs to be in the same directory
location  = "/home/christopher/Music/music_424"

#here is reading the wav

for file in os.listdir(location):  
    
    if file.endswith(".wav") and file.startswith("NY"):
        #print(file)
        trainingDic['NY'].append(wavfile.read(file)) #put the sampling frequency and the song data as a row in the array
        
       
    if file.endswith(".wav") and file.startswith("TS"):
        #print(file)
        trainingDic['TS'].append(wavfile.read(file)) #put the sampling frequency and the song data as a row in the array
          
       
    if file.endswith(".wav") and file.startswith("FM"):
        #print(file)
        trainingDic['FM'].append(wavfile.read(file)) #put the sampling frequency and the song data as a row in the array
        
       
    if file.endswith(".wav") and file.startswith("TP"):
        #print(file)
        trainingDic['TP'].append(wavfile.read(file)) #put tthe sampling frequency and the song data as a row in the array
                    
#and we are done reading the wave


print('\n'.join(map(str, trainingDic['TP'][1][1][4800:4809]))) #check that the data was stored properly
#mk now let's split it into smaller ones


