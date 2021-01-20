import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier{
  String _token;
  DateTime _expiredDate;
  String _userId;

  // String firstName, String lastName,

  Future<void> signUp( String email, String password) async{
    final url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDfqYlR4UH1Qd5dTftsxIFv79sST-Fp8No';
    try{
      final response = await http.post(url, body: json.encode({
        // 'firstName': firstName,
        // 'lastName': lastName,
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }));
      print(json.decode(response.body));
    }catch(error){
      throw error;
    }
  }

  Future<void> login(String email, String password) async{
    final url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDfqYlR4UH1Qd5dTftsxIFv79sST-Fp8No';
    try{
      final response = await http.post(url, body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }));
      print(json.decode(response.body));
    }catch(error){
      throw error;
    }
  }
}