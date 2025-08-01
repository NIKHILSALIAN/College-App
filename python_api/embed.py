from deepface import DeepFace
import numpy as np

def get_embedding(image):
    # Use DeepFace to get face embedding
    embedding = DeepFace.represent(image, model_name='Facenet', enforce_detection=False)
    return np.array(embedding[0]["embedding"])