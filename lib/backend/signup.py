from flask import Blueprint, jsonify, request
from models.database import collection
from flask_bcrypt import generate_password_hash

sign_blueprint = Blueprint('signup', __name__)


@sign_blueprint.route('/register', methods=['POST'])
def register_user():
    data = request.json
    # print(f"Received data: {data}")  # debug

    username = data.get('username')
    password = data.get('password')

    if collection.find_one({'username': username}):
        return jsonify({'message': 'User already exists'}), 201

    if username and password:
        hashed_password = generate_password_hash(password)
        collection.insert_one(
            {'username': username, 'password': hashed_password})
      #  print(hashed_password)

        return jsonify({'message': 'User added successfully'}), 201
    return jsonify({'error': 'Invalid data'}), 400
