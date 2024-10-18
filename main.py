from flask import Flask, jsonify
from flask_cors import CORS
from pet_data import get_pet_data

app = Flask(__name__)

CORS(app)

@app.route('/api/pets', methods=['GET'])
def get_pets():
    # Fetch the hardcoded data from pet_data.py
    pets = get_pet_data()
    return jsonify(pets)


# Get details of a particular pet by name
@app.route('/api/pets/<string:name>', methods=['GET'])
def get_by_name(name):
    # Fetch the hardcoded data from pet_data.py
    pets = get_pet_data()
    # Find the pet with the matching name
    pet = next((pet for pet in pets if pet["name"].lower() == name.lower()), None)
    if pet:
        return jsonify(pet), 200  # Return the pet details if found
    else:
        return jsonify({"error": "Pet not found"}), 404  # Return 404 if not found

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)

    