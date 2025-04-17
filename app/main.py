from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
   return {"message": "Hello world, 🚀 CI/CD is working!"}

