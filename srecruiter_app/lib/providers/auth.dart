import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:srecruiter_app/models/http_exception.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiredDate;
  String _userId;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expiredDate != null &&
        _expiredDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<void> _authenticateUser(
      String email, String password, String urlSegment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyDfqYlR4UH1Qd5dTftsxIFv79sST-Fp8No';
    try {
      final response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiredDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> signUp(String email, String password) async {
    // final url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDfqYlR4UH1Qd5dTftsxIFv79sST-Fp8No';
    await _authenticateUser(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    // final url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDfqYlR4UH1Qd5dTftsxIFv79sST-Fp8No';
    await _authenticateUser(email, password, 'signInWithPassword');
  }
}
