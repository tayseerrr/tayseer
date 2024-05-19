import requests


def calculate_distances(destinations):
    origin_str = "21.330209732055664,39.95214080810547"
    api_key = "AIzaSyD1e-zFJQelAu5mbgOpuyYuN3QGajNYXuM"

    # Prepare the origin and destination parameters for the API request
    # make it for one location


    url = "https://maps.googleapis.com/maps/api/distancematrix/json"
    params = {
        "origins": origin_str,
        "destinations": destinations,
        "key": api_key
    }

    # Make the request to the Google Maps Distance Matrix API
    response = requests.get(url, params=params)
    data = response.json()

    # Check if the request was successful
    if data['status'] == 'OK':
        # Extract the distance information for each destination
        for element in data['rows'][0]['elements']:
            if element['status'] == 'OK':
                distance_text = element['distance']['text']
                return distance_text
            else:
                print("Error:", element['status'])
                return []

    else:
        print("Error:", data['status'])
        return []
# Location: {'lat': 21.3603028, 'lng': 39.9024366}
# Distance: ['2.2 km']

