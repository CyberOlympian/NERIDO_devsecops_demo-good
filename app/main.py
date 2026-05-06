import os
from fastapi import FastAPI
import uvicorn

app = FastAPI(title="Secure API Service")

@app.get("/")
def read_root():
    # Example of securely checking an environment variable rather than hardcoding logic
    is_production = os.environ.get("PROD_ENV", "false").lower() == "true"
    status = "Production Mode" if is_production else "Development Mode"
    return {"message": "Service is running securely.", "environment": status}

if __name__ == "__main__":
    # In production, this is typically launched via the Dockerfile CMD
    uvicorn.run(app, host="0.0.0.0", port=8080)
