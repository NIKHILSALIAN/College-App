from fastapi import FastAPI, UploadFile, File
from fastapi.responses import JSONResponse
import cv2
import numpy as np
import shutil
import os
from detect import detect_face  # Your face detection function (returns bounding box)
from embed import get_embedding  # Your embedding function (takes cropped face)

app = FastAPI()

@app.get("/")
async def home():
    return {"message": "FastAPI is running successfully!"}

@app.post("/process-frame/")
async def process_frame(file: UploadFile = File(...)):
    try:
        # Save frame temporarily
        temp_filename = f"frame_{file.filename}"
        with open(temp_filename, "wb") as buffer:
            shutil.copyfileobj(file.file, buffer)

        # Load image with OpenCV
        image = cv2.imread(temp_filename)

        # Detect face
        bbox = detect_face(image)  # Should return (x, y, w, h)

        if bbox is None:
            os.remove(temp_filename)
            return JSONResponse(content={"error": "No face detected"}, status_code=404)

        x, y, w, h = bbox
        face_img = image[y:y+h, x:x+w]

        # Save cropped face temporarily
        cropped_path = f"cropped_{file.filename}"
        cv2.imwrite(cropped_path, face_img)

        # Get embedding
        embedding = get_embedding(cropped_path)

        # Clean up
        os.remove(temp_filename)
        os.remove(cropped_path)

        return JSONResponse(content={"embedding": embedding})

    except Exception as e:
        return JSONResponse(content={"error": str(e)}, status_code=500)

import requests
import json

def send_embedding_to_java(user_id, embedding):
    url = "http://localhost:8080/api/students/embedding"  # Java Spring Boot endpoint
    data = {
        "userId": user_id,
        "embedding": embedding.tolist() if hasattr(embedding, "tolist") else embedding
    }
    headers = {"Content-Type": "application/json"}
    
    try:
        response = requests.post(url, data=json.dumps(data), headers=headers)
        print("Sent to Java backend:", response.status_code, response.text)
    except Exception as e:
        print("Error sending to Java backend:", e)
