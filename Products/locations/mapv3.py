import requests

from Products.locations import Location, calculate_distances


def all_locations_nearby(location: str) -> []:
    key = "AIzaSyD1e-zFJQelAu5mbgOpuyYuN3QGajNYXuM"
    # location = "21.330209732055664,39.95214080810547"
    #lat=21.330209732055664, lng=39.95214080810547
    radius = "500000"  # Search within a 50,000 meter radius
    keyword = "Jarir Bookstore | مكتبة جرير"
    url = f"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location={location}&radius={radius}&keyword={keyword}&key={key}"

    response = requests.get(url)
    data = response.json()
    locations: [Location] = []

    if data['status'] == 'OK':
        for place in data['results']:
            if keyword.lower() not in place['name'].lower():
                continue
            locations.append(Location(
                name=place['name'],
                address=place.get('vicinity'),
                location=place['geometry']['location'],
                distance=calculate_distances(
                    f'{place["geometry"]["location"]["lat"]},{place["geometry"]["location"]["lng"]}')
            ))

    else:
        print("No results found or error encountered.")
    locations.sort(key=lambda x: x.distance)
    # put the locations in a list json
    json_list = []
    for location in locations:
        json_list.append({
            "name": location.name,
            "address": location.address,
            "location": location.location,
            "distance": location.distance
        })
#     convert the list to json
    return json_list
