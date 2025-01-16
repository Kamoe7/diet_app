from flask import request, Flask, jsonify, Blueprint
from flask_bcrypt import check_password_hash
from models.database import collection, db

login_blueprint = Blueprint('login', __name__)


@login_blueprint.route('/login', methods=['POST'])
def login_user():
    data = request.json

    username = data.get('username')
    password = data.get('password')

    if not username and not password:
        return jsonify({'error': 'Provide Username or Password'}), 400

    # check_if users exits
    user = collection.find_one({'username': username})
    if not user:
        return jsonify({'error': 'username does not exits'}), 404

    if check_password_hash(user['password'], password):
        return jsonify({'message': 'Login Successful'}), 200
    
    return jsonify({'error': 'Invalid username or password'}), 401
