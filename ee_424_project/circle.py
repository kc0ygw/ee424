from keras.models import Sequential
from keras.layers.core import Dense, Dropout, Activation
from keras.optimizers import SGD
from keras import metrics
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.patches as pat


# Circle Center:
x_center = 0
y_center = 0

# Circle Radius:
r = 5

# Size of Dataset
N = 5000

# Random Seed
np.random.seed(123)

# Generate Data

X = np.random.randint(-20, 20, size=(N, 2))

dist_from_center = np.zeros((N, 1))
num_less_than_16 = 0

y = np.ones((N, 1))


for i in range(0, N):
    dist_from_center[i] = np.power((X[i, 0]-x_center), 2) + np.power((X[i, 1]-y_center), 2)
    if dist_from_center[i] <= r*r:
        num_less_than_16 = num_less_than_16 + 1
        y[i] = 0
    
# create model
model = Sequential()
# model.add(Dense(8, input_dim=2))
# model.add(Dense(16, input_dim=2))
model.add(Dense(32, input_dim=2))
model.add(Activation('tanh'))
# model.add(Activation('sigmoid'))
model.add(Dense(1))
model.add(Activation('sigmoid'))

sgd = SGD(lr=0.1)
model.compile(loss='binary_crossentropy', optimizer=sgd, metrics=['accuracy'])

# train model
history = model.fit(X, y, batch_size=1, validation_split=0.5, nb_epoch=1000)

# evaluate model

eval = model.evaluate(X, y, batch_size=1, verbose=0)

print(model.metrics_names)
print("Evaluation: "+str(eval))

# predict model

predict = model.predict(X, batch_size=1, verbose=0)

ax=plt.gca()
c = pat.Circle((x_center, y_center), radius=r, fill=0)
ax.add_patch(c)
for i in range(0, N):
    if predict[i] <= .5:
        plt.plot(X[i, 0], X[i, 1], marker='o', color='r')
        
    else:
        plt.plot(X[i, 0], X[i, 1], marker='o', color='b')
plt.grid()
plt.axis('scaled')
plt.show()

