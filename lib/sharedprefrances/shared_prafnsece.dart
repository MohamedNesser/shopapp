// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/material.dart';
// class CachemeHelper{
//   static  SharedPreferences sharedPreferences ;
//
//   static init() async
//   {
//     sharedPreferences =  await SharedPreferences.getInstance() ;
//   }
//
//   static Future<bool> putBoool(
//       {
//         @required String key,
//         @required bool value,
//       }) async
//   {
//     return await sharedPreferences.setBool(key ,value);
//   }
//
//
//
//   static dynamic getDaeta({@required String key,})
//   {
//     return sharedPreferences.get(key);
//   }
//
//
//
//   static Future<bool> saveDaeta(
//       {
//         @required String key,
//         @required dynamic value,
//       })async
//   {
//     if(value is String)  return await sharedPreferences.setString(key ,value);
//     if(value is bool)  return await sharedPreferences.setBool(key ,value);
//     if(value is int)  return await sharedPreferences.setInt(key ,value);
//
//     return await sharedPreferences.setDouble(key, value);
//   }
//
//   static Future<bool> removeDaeta(String key) async {
//
//     return await sharedPreferences.remove(key);
//   }
//
// }