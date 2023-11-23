from flask import Flask, request, jsonify

app = Flask(__name__)

# Variable to store POST data
POST_Data = {}

# Define a secret token for authentication
SECRET_TOKEN = "PQj!DhkyLz49qV&7&o$dTDE*$bvNZxL@"

@app.route('/webhook', methods=['POST'])
def webhook():
    global POST_Data
    if request.method == 'POST':
        # Check if the 'Authorization' header is present
        if 'Authorization' not in request.headers:
            return jsonify({"error": "Unauthorized"}), 401
        
        # Get the token from the 'Authorization' header
        auth_header = request.headers.get('Authorization')
        provided_token = auth_header.split(' ')[1] if auth_header.startswith('Bearer ') else None
        
        # Validate the token
        if provided_token != SECRET_TOKEN:
            return jsonify({"error": "Unauthorized"}), 401
        
        # Capture incoming POST data
        POST_Data = request.json
        
        # You can perform further processing with the captured data here
        print("Received POST data:", POST_Data)
        
        return jsonify({"message": "Data received successfully"}), 200

if __name__ == '__main__':
    # Run the Flask app with Gunicorn
    app.run(host='0.0.0.0', port=5000)
