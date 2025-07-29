from fastapi import FastAPI, UploadFile, File
from fastapi.responses import JSONResponse
import cv2
import numpy as np
import shutil
import os
from detect import detect_face  # Returns cropped face image as np.array
from embed import get_embedding  # Takes image path or array and returns embedding

app = FastAPI()

@app.post("/process-frame/")
async def process_frame(file: UploadFile = File(...),
    user_id: int = Form(...)):
    try:
        # Save the uploaded frame temporarily
        temp_filename = f"frame_{file.filename}"
        with open(temp_filename, "wb") as buffer:
            shutil.copyfileobj(file.file, buffer)

        # Load the image using OpenCV
        image = cv2.imread(temp_filename)

        # Detect and crop face using your custom logic
        face_img = detect_face(image)  # Should return cropped face (np.array)

        if face_img is None:
            os.remove(temp_filename)
            return JSONResponse(content={"error": "No face or multiple faces detected"}, status_code=400)

        # Save cropped face temporarily to get embedding (if embedding requires file)
        cropped_path = f"cropped_{file.filename}"
        cv2.imwrite(cropped_path, face_img)

        # Generate embedding
        embedding = get_embedding(cropped_path)

        # Convert to JSON serializable format (list of floats)
        embedding_list = embedding.tolist() if hasattr(embedding, "tolist") else embedding

        # Clean up temp files
        os.remove(temp_filename)
        os.remove(cropped_path)

        return JSONResponse(content={"embedding": embedding_list})

    except Exception as e:
        return JSONResponse(content={"error": str(e)}, status_code=500)
