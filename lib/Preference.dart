import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

 class Preferences {
  static SharedPreferences? preferences;



  static init() async {
    preferences = await SharedPreferences.getInstance();
  }

}
