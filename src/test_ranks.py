from scipy.spatial import distance

import numpy as np

coords = [(35.0456, -85.2672),
          (35.1174, -89.9711),
          (35.9728, -83.9422),
          (36.1667, -86.7833)]

distances = distance.cdist(coords, coords, 'euclidean')


correct_elements = np.expand_dims(np.diag(distances), axis=-1)

ranks = np.sum(distances <= correct_elements, axis=-1)