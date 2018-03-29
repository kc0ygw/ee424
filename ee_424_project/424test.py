from __future__ import unicode_literals #there's a shitton of dependancies make sure you have them all
import wave,math,os, audioop, scipy
import os
from playsound import playsound
import scipy.io 
from scipy.io import wavfile
import youtube_dl
from subprocess import call
from numpy import fft
import matplotlib.pyplot as plt


song_list = { # Neil Young
              "https://www.youtube.com/watch?v=SYUgGs9IStY", # 1  Old Man
              "https://www.youtube.com/watch?v=c-WUo4sFGgA", # 2  The Needle and the Damage Done
              "https://www.youtube.com/watch?v=pO8kTRv4l3o", # 3  Heart of Gold
              "https://www.youtube.com/watch?v=9Z7HM4UGANM", # 4  Out on the Weekend
              "https://www.youtube.com/watch?v=PE0Ak7375lg", # 5  Alabama
              "https://www.youtube.com/watch?v=m-b76yiqO1E", # 6  Cortez The Killer
              "https://www.youtube.com/watch?v=kVRxdPWV3RM", # 7  Southern Man
              "https://www.youtube.com/watch?v=1e3m_T-NMOs", # 8  After The Gold Rush
              "https://www.youtube.com/watch?v=dgxI3PT9IN8", # 9  Tell Me Why
              "https://www.youtube.com/watch?v=S5dh8NcQq70", # 10 Only Love Can Break Your Heart
              "https://www.youtube.com/watch?v=F7letrMf_nE", # 11 Don't Let It Bring You Down
              "https://www.youtube.com/watch?v=zphUt_tp898", # 12 Cowgirl In The Sand
              "https://www.youtube.com/watch?v=PTMMS88gi6c", # 13 Four Strong Winds
              "https://www.youtube.com/watch?v=L86gQQBYSc4", # 14 Sugar Mountain
              "https://www.youtube.com/watch?v=t4Y1wDdMYH4", # 15 My my, hey hey (Out of the blue)
              "https://www.youtube.com/watch?v=6-WMbP1RcC4", # 16 Like A Hurricane
              "https://www.youtube.com/watch?v=hkg-bzTHeAk", # 17 Ohio
              "https://www.youtube.com/watch?v=OBPCTaEwaeA", # 18 Eldorado
              "https://www.youtube.com/watch?v=qJ6hmupAtIg", # 19 Crime in the City (Sixty to Zero Part 1)
              "https://www.youtube.com/watch?v=xDPeKrWqjj8",  # 20 Don't Cry
              # Taylor Swift
              "https://www.youtube.com/watch?v=e-ORhEE9VVg", # 1  Blank Space
              "https://www.youtube.com/watch?v=nfWlot6h_JM", # 2  Shake It Off
              "https://www.youtube.com/watch?v=QcIy9NiNbmo", # 3  Bad Blood ft. Kendrick Lamar
              "https://www.youtube.com/watch?v=3tmd-ClpJxA", # 4  Look What You Made Me Do
              "https://www.youtube.com/watch?v=wIft-t-MQuE", # 5  ...Ready For It?
              "https://www.youtube.com/watch?v=tCXGJQYZ9JA", # 6  Delicate
              "https://www.youtube.com/watch?v=vNoKguSdy4Y", # 7  I Knew You Were Trouble
              "https://www.youtube.com/watch?v=WA4iX5D9Z64", # 8  We Are Never Ever Getting Back Together
              "https://www.youtube.com/watch?v=VuNIsY6JdUw", # 9  You Belong With Me
              "https://www.youtube.com/watch?v=8xg3vE8Ie_E", # 10 Love Story
              "https://www.youtube.com/watch?v=XPBwXKgDTdE", # 11 Mine
              "https://www.youtube.com/watch?v=Jb2stN7kH28", # 12 Our Song
              "https://www.youtube.com/watch?v=Pb-K2tXWK4w", # 13 Fifteen
              "https://www.youtube.com/watch?v=xKCek6_dB0M", # 14 Teardrops On My Guitar
              "https://www.youtube.com/watch?v=jYa1eI1hpDE", # 15 Mean
              "https://www.youtube.com/watch?v=AgFeZr5ptV8", # 16 22
              "https://www.youtube.com/watch?v=Zlot0i3Zykw", # 17 Red
              "https://www.youtube.com/watch?v=oKar-tF__ac", # 18 Sparks Fly
              "https://www.youtube.com/watch?v=LZ34LlaIk88", # 19 Ours
              "https://www.youtube.com/watch?v=D1Xr-JFLxik", # 20 White Horse
              # Fleetwood Mac
              "https://www.youtube.com/watch?v=K_PQ4fRQ5Kc", # 1  Landslide
              "https://www.youtube.com/watch?v=mrZRURcb1cM", # 2  Dreams
              "https://www.youtube.com/watch?v=JDG2m5hN1vo", # 3  The Chain
              "https://www.youtube.com/watch?v=U_aYibUx1B8", # 4  Rhiannon
              "https://www.youtube.com/watch?v=EX8tFvInN3Y", # 5  Gypsy
              "https://www.youtube.com/watch?v=Xr9Oubxw1gA", # 6  Little Lies
              "https://www.youtube.com/watch?v=9b4F_ppjnKU", # 7  Seven Wonders(Live Video)
              "https://www.youtube.com/watch?v=MmyDosjjP5U", # 8  Everywhere (1987)
              "https://www.youtube.com/watch?v=ROGEHq1WZqU", # 9  As Long As You Follow
              "https://www.youtube.com/watch?v=mnXsvj4Awa0", # 10 Silver Springs
              "https://www.youtube.com/watch?v=lfgyivefgHE", # 11 Sara (1980)
              "https://www.youtube.com/watch?v=wTi19MPOvDw", # 12 Songbird
              "https://www.youtube.com/watch?v=iNPQx_Bb2Fo", # 13 You Make Loving Fun
              "https://www.youtube.com/watch?v=6ul-cZyuYq4", # 14 Go Your Own Way (HQ)
              "https://www.youtube.com/watch?v=TytGVo1O3_w", # 15 Don't Stop
              "https://www.youtube.com/watch?v=sKj1EFeU-cM", # 16 Never Going Back Again
              "https://www.youtube.com/watch?v=npnGTnupBX0", # 17 Over My Head (The Dance)
              "https://www.youtube.com/watch?v=8scHKFwr0og", # 18 Albatross 
              "https://www.youtube.com/watch?v=InjF8Tuskxj93LU", # 19 Tusk
              "https://www.youtube.com/watch?v=9b4F_ppjnKU", # 20 Seven Wonders (Live Video)
              # Tom Petty
              "https://www.youtube.com/watch?v=aowSGxim_O8", # 1  Mary Jane's Last Dance
              "https://www.youtube.com/watch?v=h0JvF9vpqx8", # 2  Don't Come Around Here No More
              "https://www.youtube.com/watch?v=Y1D3a5eDJIs", # 3  Runnin' Down A Dream
              "https://www.youtube.com/watch?v=s5BJXwNeKsQ", # 4  Learning To Fly
              "https://www.youtube.com/watch?v=1lWJXDG2i0A", # 5  Free Fallin'
              "https://www.youtube.com/watch?v=xqmFxgEGKH0", # 6  Into The Great Wide Open
              "https://www.youtube.com/watch?v=ngYenAbgkr8", # 7  Wildflowers
              "https://www.youtube.com/watch?v=rSvlJe1mwlw", # 8  Something Good Coming
              "https://www.youtube.com/watch?v=3_iBKacXIA4", # 9  I Should Have Known It (Video)
              "https://www.youtube.com/watch?v=tXkblbJqwn0", # 10 American Girl
              "https://www.youtube.com/watch?v=nUTXb-ga1fo", # 11 I Won't Back Down
              "https://www.youtube.com/watch?v=fFnOfpIJL0M", # 12 Refugee
              "https://www.youtube.com/watch?v=-3aGZZueg08", # 13 You Wreck Me
              "https://www.youtube.com/watch?v=vPYFWnzjIy0", # 14 Saving Grace
              "https://www.youtube.com/watch?v=I4vJM4L2D2U", # 15 Swingin
              "https://www.youtube.com/watch?v=nQFCF9KESic", # 16 Room At The Top (Video)
              "https://www.youtube.com/watch?v=ZfS6Nl962Qg", # 17 Walls (Circus)
              "https://www.youtube.com/watch?v=5q3dXiQJukM", # 18 So You Want To Be A Rock and Roll Star
              "https://www.youtube.com/watch?v=EULWqD2t6fM", # 19 Little Bit O'Soul - Live
              "https://www.youtube.com/watch?v=OFGvzRmj0SY", # 20 Baby Please Don't Go
              # 
}

ydl_opts = {}
artists = ["NY","TS","FM","TP"]
songdata=[[0,0],[0,0],[0,0],[0,0]] #initialize the array
#I think we should make each artist in a folder to make it easeir to rename and select them
#for urls in song_list:
 #   command = "youtube-dl --extract-audio --audio-format wav " + urls
  #  call(command.split(), shell=False)
i=0; #variable to incriment through the array
location = "/mnt/c/Users/Valery/424/" #location of where the file is, the music needs to be in the same directory
for file in os.listdir(location):  
    
    if file.endswith(".wav"):
        print(file)
        songdata[i]=wavfile.read(file) #put tthe sampling frequency and the song data as a row in the array
        i=i+1

print(len(song_list)) 

print(songdata[0]) #check that the data was stored properly
#mk now let's split it into smaller ones

clip=songdata[0][1]
print(clip)
print(clip[44100:44200])
plt.plot(clip)
plt.show()
#okay now take the fft



#print('\n'.join([str(pair) for pair in Braver])