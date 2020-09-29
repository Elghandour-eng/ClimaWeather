import 'location.dart';
import 'networking.dart';
const apiKey ='5ce93f0da3131f3c116918200827dced';
class WeatherModel {
Future<dynamic> getWeatherData() async{
  Location m = new Location();
  await m.getCurrentLocation();
  NetworkingHelper networkingHelper =new NetworkingHelper('https://api.openweathermap.org/data/2.5/weather?lat=${m.latitude}&lon=${m.longtudt}&appid=$apiKey&units=metric');

  var weather = await networkingHelper.getdata();
  return weather;
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
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
