import logging
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field
from config import settings

class CategoryCreate(BaseModel):
    name: str = Field(..., min_length=2, max_length=50)
    type: str = Field(..., pattern="^(income|expense)$")


logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("FinanceApi")

app = FastAPI(
    title="Finance Manager Api",
    version=settings.APPLICATION_VERSION
)

categories = []

@app.post("/categories", status_code=201)
def create_category(category: CategoryCreate):
    new_category = {"id": len(categories) + 1, "name": category.name, "type": category.type}
    categories.append(new_category)
    logger.info(f"Створено категорію: {category.name}")
    return new_category

@app.get("/info")
def get_info():
    logger.info("Отримано запит на інформацію про версію")
    return {"version": settings.APPLICATION_VERSION}

@app.get("/categories")
def get_categories():
    return categories