"""
A Neural Network in 11 Lines of Python (Part 1)
https://iamtrask.github.io/2015/07/12/basic-python-network/

A Study of Back Propagation

"""
import numpy as np

# sigmoid function

def nonlin(x, deriv=False):
    if(deriv==True):
        return x*(1-x)
    return 1/(1+np.exp(-x))

# input dataset

# each column is an input node

X = np.array([  [0, 0, 1],
                [0, 1, 1],
                [1, 0, 1],
                [1, 1, 1]  ])

# output dataset

#This column is the output node.

y = np.array([[0,0,1,1]]).T

# seed random numbers to make calculation
# deterministic (just a good practice)

np.random.seed(1)

# initialize weights randomly with mean 0

# Since we only have 2 layers - input and output,
# we only need 1 connecting matrix or synapse.

syn0 = 2*np.random.random((3,1)) - 1

# The Network Training

for iter in range(10000):

    #forward propagation
    l0 = X # "Full Batch Training"
    
    l1 = nonlin(np.dot(l0, syn0))

  
    # how much did we miss?
    l1_error = y - l1

    # multiply how we missed by the
    # slope of the sigmoid at the values in l1

    l1_delta = l1_error * nonlin(l1,True)

    # update weights
    syn0 += np.dot(l0.T, l1_delta)

print("Output After Training:")
print(l1)
