from mtcnn import MTCNN
import cv2

detector = MTCNN()

def detect_face(image):
    result = detector.detect_faces(image)
    if len(result) != 1:
        return None  # Either no face or multiple faces
    x, y, w, h = result[0]['box']
    x, y = max(0, x), max(0, y)
    cropped_face = image[y:y+h, x:x+w]
    return cv2.resize(cropped_face, (160, 160))  # Resize as per your model input
