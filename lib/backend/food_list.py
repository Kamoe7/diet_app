from flask import Flask,Blueprint,request,jsonify
from food_json import get_foods_json
#from models.database import db,client
from pymongo import MongoClient

food_blueprint=Blueprint('food',__name__)


client = MongoClient("mongodb://localhost:27017/")

db=client['food_list']

food_collection=db['foods']

@food_blueprint.route('/food',methods=['GET'])
def get_food_list():
    try:
        foods = list(food_collection.find({},{'_id':False}))
        return jsonify({'success': True, 'foods': foods}), 200
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)}), 500
   