from flask import Flask
from flask_cors import CORS
from login import login_blueprint
from signup import sign_blueprint
from food_list import food_blueprint

app = Flask(__name__)
cors = CORS(app)

# Register blueprints
app.register_blueprint(login_blueprint,url_prefix='/auth')
app.register_blueprint(sign_blueprint,url_prefix='/auth')
app.register_blueprint(food_blueprint,url_prefix='/auth')

if __name__ == "__main__":
    app.run(host='0.0.0.0',port=5000,debug=True)
