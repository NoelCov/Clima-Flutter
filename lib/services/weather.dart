import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'b5d732431cdd3a388b7635113e1e2419';
const firstPartURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future getCityWeather(cityName) async {
    var url = '$firstPartURL?q=$cityName&units=imperial&appid=$apiKey';

    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$firstPartURL?lat=${location.latitude}&lon=${location.longitude}&units=imperial&appid=$apiKey');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 77) {
      return 'It\'s 🍦 time';
    } else if (temp > 68) {
      return 'Time for shorts and 👕';
    } else if (temp < 50) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
