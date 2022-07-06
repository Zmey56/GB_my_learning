# e5e4cd692a72b0b66ea0a6b80255d1c3
import requests
from pprint import pprint

url = 'http://api.openweathermap.org/data/2.5/weather'
city = 'Moscow,US'
apikey = 'e5e4cd692a72b0b66ea0a6b80255d1c3'
params = {'q': city, 'appid': apikey}

response = requests.get(url, params=params)
# print(type(response.text))

j_data = response.json()
# pprint(j_data)

print(f'В городе {j_data.get("name")} температура {round(j_data.get("main").get("temp") - 273.15,2)} градусов')
