import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class StudentModel with ChangeNotifier {
  final String id;
  final String categoriesId;
  final String imageUrl;
  final String firstName;
  final String lastName;
  final String profession;
  final String grade;
  final String email;
  final String phoneNumber;
  final String biography;
  final String instagram;
  final String facebook;
  final String linkedIn;
  final String twitter;
  bool isPromoted;
  bool isFavorite;

  StudentModel({
    @required this.id,
    @required this.categoriesId,
    @required this.imageUrl,
    @required this.firstName,
    @required this.lastName,
    @required this.profession,
    @required this.grade,
    @required this.email,
    @required this.phoneNumber,
    @required this.biography,
    this.instagram,
    this.facebook,
    this.linkedIn,
    this.twitter,
    this.isPromoted = false,
    this.isFavorite = false,
  });

  void _isFavStat(bool newFavStat) {
    isFavorite = newFavStat;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus(String authToken) async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url =
        'https://srecruiter-96183-default-rtdb.firebaseio.com/students/$id.json?auth=$authToken';
    try {
      final response =
          await http.patch(url, body: json.encode({'isFavorite': isFavorite}));
      if (response.statusCode >= 400) {
        _isFavStat(oldStatus);
      }
    } catch (error) {
      _isFavStat(oldStatus);
    }
  }
}
