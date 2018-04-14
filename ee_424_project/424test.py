import wave,math,os, audioop, scipy
from playsound import playsound
import scipy.io 
from scipy.io import wavfile


print("hello world")
#first open the wave file jk this function is supposed to do both?


#then read the wave file
samp , Braver=wavfile.read('AJJBrave.wav')



print(Braver)

print(Braver[44100:44200])
#print('\n'.join([str(pair) for pair in Braver])