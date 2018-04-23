
##whelp here goes
from __future__ import unicode_literals #there's a shitton of dependancies make sure you have them all
from __future__ import absolute_import
from __future__ import division
from __future__ import print_function
import pandas as pd
import argparse
import tensorflow as tf
import wave,math,os, audioop, scipy
import os
from playsound import playsound
import scipy.io 
from scipy.io import wavfile
import youtube_dl
from subprocess import call
from numpy import fft
import numpy 
import plotly
from plotly.graph_objs import Scatter, Layout #this is for plotting maybe unessecary
import pandas as pd
import tensorflow as tfs

def eval_input_fn(features, labels, batch_size):
    """An input function for evaluation or prediction"""
    features=dict(features)
    if labels is None:
        # No labels, use only features.
        inputs = features
    else:
        inputs = (features, labels)

    # Convert the inputs to a Dataset.
    dataset = tf.data.Dataset.from_tensor_slices(inputs)

    # Batch the examples
    assert batch_size is not None, "batch_size must not be None"
    dataset = dataset.batch(batch_size)

    # Return the dataset.
    return dataset

def train_input_fn(features, labels, batch_size):
    """An input function for training"""
    # Convert the inputs to a Dataset.
    dataset = tf.data.Dataset.from_tensor_slices((dict(features), labels))

    # Shuffle, repeat, and batch the examples.
    dataset = dataset.shuffle(1000).repeat().batch(batch_size)

    # Return the dataset.
    return dataset

#there are 4 artists with 0-19 songs each

trainingDic={"NY":[],"TS":[],"FM":[],"TP":[]}
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
#and we are done reading the wave files
print('done reading the wave files' )

parser = argparse.ArgumentParser()
parser.add_argument('--batch_size', default=100, type=int, help='batch size')
parser.add_argument('--train_steps', default=1000, type=int,
                    help='number of training steps')
def main(argv):
    args = parser.parse_args(argv[1:])

    # Fetch the data
    (train_x, train_y), (test_x) = (trainingDic, trainingDic.keys()), trainingDic['FM'][1][1]

    # Feature columns describe how to use the input.
    my_feature_columns = []
    for key in train_x.keys():
        my_feature_columns.append(tf.feature_column.numeric_column(key=key))
 # Build 2 hidden layer DNN with 10, 10 units respectively.
    classifier = tf.estimator.DNNClassifier(
        feature_columns=my_feature_columns,
        # Two hidden layers of 10 nodes each.
        hidden_units=[10, 10],
        # The model must choose between 3 classes.
        n_classes=3)

    # Train the Model.
    classifier.train(
        input_fn=lambda:train_input_fn(train_x, train_y, args.batch_size),
        steps=args.train_steps)

    # Evaluate the model.
    eval_result = classifier.evaluate(
        input_fn=lambda:eval_input_fn(test_x, test_y,
                                                args.batch_size))
    print('\nTest set accuracy: {accuracy:0.3f}\n'.format(**eval_result))

if __name__ == '__main__':
    tf.logging.set_verbosity(tf.logging.INFO)
    tf.app.run(main)