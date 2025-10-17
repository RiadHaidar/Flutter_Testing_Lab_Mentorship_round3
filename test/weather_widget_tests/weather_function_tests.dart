

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_lab/helpers/temperature_helper.dart';
import 'package:flutter_testing_lab/services/weather_api_service.dart';

void main(){

   test('C to F test', () {
    // arrange
    double celsiusDegree= 22.5;
    //act
  var matcher=  TemperatureHelper.celsiusToFahrenheit(celsiusDegree);
    //assert
    expect(72.5, matcher);
   });



   test('F to C test', () {
    // arrange
    double fahrenheit= 72.5;
    //act
  var matcher=  TemperatureHelper.fahrenheitToCelsius(fahrenheit);
    //assert
    expect(22.5, matcher);
   });


   test('Api Call test', () async{
    // arrange

    String city = "London";
    Map <String, dynamic> actualResponse =  {
    'city': 'London',
    'temperature': 15.0,
    'description': 'Rainy',
    'humidity': 85,
    'windSpeed': 8.5,
    'icon': '🌧️'
  };

 Map <String, dynamic>? matcherResponse;
   //act

await WeatherApiService.fetchWeatherData(city).then((weather){
matcherResponse =weather;
   });
   //assert

   expect(actualResponse, matcherResponse);
   });
}