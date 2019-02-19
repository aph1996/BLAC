import 'package:flutter/material.dart';



class ScoreReport {
  DateTime dateCalculated;
  DateTime dateOfForcast;
  double finalScore;
  double tempScore;
  double windScore;
  double waterTemperatureScore;
  double humidityScore;

  //the following may be of type int
  double temperature;   //in fahrenheit
  double windSpeed;     //in mph
  double waterTemperature;    //in fahrenheit
  double humidity;    //percent decimal

  ScoreReport(double _temperature, double _windSpeed, double _waterTemperature, double _humidity)
  {
    temperature = _temperature;
    windSpeed = _windSpeed;
    waterTemperature = _waterTemperature;
    humidity = _humidity;
    dateCalculated = DateTime.now();

    tempScore = calculateTempScore();
    windScore = calculateWindScore();
    waterTemperatureScore = calculateWaterTempScore();
    humidityScore = calculateHumidityScore();
    finalScore = calculateFinalScore();

  }

  //functions:
  //TODO: fill in following "calculate<scoreType>" functions according to determined sub-score functions
  double calculateTempScore() {             //temp units: fahrenheit
    return 5;
  }

  double calculateWindScore() {        //windSpeed units: mph
    return 5;
  }

  double calculateWaterTempScore() {   //waterTemp units: fahrenheit
    return 5;
  }

  double calculateHumidityScore() {     //humidity expressed as percentage decimal (0.0 - 1.0)
    return 5;
  }

  //add any extra variables matching format as shown above

  //TODO: fill in following function (finalScore) to evaluate a final score based on previous sub-scores

  double calculateFinalScore()
  {
    return 8;
  }


}