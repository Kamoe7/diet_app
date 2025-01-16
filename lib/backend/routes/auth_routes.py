from flask import Blueprint, request, jsonify
from models.models import User

auth_routes = Blueprint("auth_routes", __name__)


@auth_routes.route("/signup", methods=["POST"])
def signup():
    data = request.get_json()
    email = data.get("email")
    password = data.get("password")

    if not email or not password:
        return jsonify({"error": "Email and password are required"}), 400

    # check if user already exists
    if User.find_by_email(email):
        return jsonify({"error": "User already exists"}), 400

    # create user
    User.create_user(email, password)
    return jsonify({"message": "User created successfully"}), 201


@auth_routes.route("/login", methods=["POST"])
def login():
    data = request.get_json()
    email = data.get('email')
    password = data.get('password')

    user = User.find_by_email(email)
    if user and User.verify_password(password, user['password']):
        return jsonify({"message": "Login successful"}), 200

    return jsonify({"error": "Invalid email or password"}), 401
