import pytest
from fastapi.testclient import TestClient
from main import app

client = TestClient(app)

def test_read_info():
    response = client.get("/info")
    assert response.status_code == 200
    assert "version" in response.json()

def test_create_category_valid():
    data = {"name": "Coffee", "type": "expense"}
    response = client.post("/categories", json=data)
    assert response.status_code == 201
    assert response.json()["name"] == "Coffee"

def test_create_category_invalid():
    data = {"name": "A", "type": "invalid"}
    response = client.post("/categories", json=data)
    assert response.status_code == 422