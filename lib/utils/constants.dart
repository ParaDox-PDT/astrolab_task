import 'package:flutter_defualt_project/data/models/user_model/user_model.dart';

const baseUrl = "https://e-work.up.railway.app";


class TimeOutConstants {
  static int connectTimeout = 30;
  static int receiveTimeout = 25;
  static int sendTimeout = 60;
}

const String token = "";


List<UserModel> users = [
  UserModel(date: "15/09/2003", name: "Farangiz", phone: "990754224"),
  UserModel(date: "14/08/2003", name: "Anvar", phone: "990767284"),
  UserModel(date: "05/05/2004", name: "Bexruz", phone: "990254344"),
  UserModel(date: "20/12/2006", name: "Abdulloh", phone: "933025524"),
  UserModel(date: "23/01/1999", name: "Sevinch", phone: "910234445"),
  UserModel(date: "02/02/2002", name: "John", phone: "992222222"),
  UserModel(date: "22/06/2013", name: "Laylo", phone: "990753113"),
  UserModel(date: "31/08/2003", name: "Toxir", phone: "955105152"),
  UserModel(date: "22/02/2008", name: "Sarvar", phone: "901233211"),
  UserModel(date: "30/05/2007", name: "Bekzod", phone: "902345434"),
];