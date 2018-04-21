from __future__ import unicode_literals #there's a shitton of dependancies make sure you have them all
import wave,math,os, audioop, scipy
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
import tensorflow as tf
#there are 4 artists with 0-19 songs each

ydl_opts = {}
artists = ["NY","TS","FM","TP"]
trainingDic={"NY":[[],[]],"TS":[[],[]],"FM":[[],[]],"TP":[[],[]]}
songdata=[[0,0],[0,0],[0,0],[0,0]] #initialize the array
#the input needs to be formatted as a dictionary 
#dictionaries are cool
#for urls in song_list:
 #   command = "youtube-dl --extract-audio --audio-format wav " + urls
  #  call(command.split(), shell=False)
i=0 #variable to incriment through the array
location = "/mnt/c/Users/Valery/424/" #location of where the file is, the music needs to be in the same directory
#here is reading the wav
for file in os.listdir(location):  
    
    if file.endswith(".wav") and file.startswith("NY"):
        #print(file)
        trainingDic['NY'][i]=wavfile.read(file) #put tthe sampling frequency and the song data as a row in the array
        i=i+1
    i=0    
    if file.endswith(".wav") and file.startswith("TS"):
        #print(file)
        trainingDic['TS'][i]=wavfile.read(file) #put tthe sampling frequency and the song data as a row in the array
        i=i+1  
    i=0    
    if file.endswith(".wav") and file.startswith("FM"):
        #print(file)
        trainingDic['FM'][i]=wavfile.read(file) #put tthe sampling frequency and the song data as a row in the array
        i=i+1
    i=0    
    if file.endswith(".wav") and file.startswith("TP"):
        #print(file)
        trainingDic['TP'][i]=wavfile.read(file) #put tthe sampling frequency and the song data as a row in the array
        i=i+1             
#and we are done reading the wave


print(trainingDic['TS']) #check that the data was stored properly
#mk now let's split it into smaller ones


"""
clip=[0][1]
print(clip)
print(clip[44100:44200],clip[44100:44200])
plotly.offline.plot({
    "data": [Scatter(x=list(range(1,100)),y= clip[44100:44200] )],
    "layout": Layout(title="hello world")
})
#okay now take the fft



#print('\n'.join([str(pair) for pair in Braver])
"""
