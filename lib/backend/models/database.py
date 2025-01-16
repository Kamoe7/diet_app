"""
from pymongo import MongoClient
from dotenv import load_dotenv, find_dotenv
import os
import pprint

load_dotenv(find_dotenv())  # load the env file

# connect to mongodb

username = os.environ.get("MONGODB_USER")
password = os.environ.get("MONGODB_PWD")

CONNECTION_UTI = f"mongodb+srv://{username}:{password}@dietapp.tjght.mongodb.net/?retryWrites=true&w=majority&appName=DietApp"
client = MongoClient(CONNECTION_UTI)

db = client['authentication']
user_collections = db['login_users']


def test_connection():
    try:
        client.admin.command("ping")
        print("Connected to MongoDB")
    except Exception as e:
        print("Failed to connect to MongoDB")
        print(e)


test_connection()
"""

from pymongo import MongoClient

client = MongoClient("mongodb://localhost:27017/")
db = client['flutterDatabase']
collection = db['sign_in']
