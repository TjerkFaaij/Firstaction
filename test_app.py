from app.app import app

def test_homepage():
    with app.test_client() as client:
        response = client.get('/')
        assert response.status_code == 200
        assert b"Hello, world!" in response.data
