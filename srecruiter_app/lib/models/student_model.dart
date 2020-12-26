import 'package:flutter/foundation.dart';

class StudentModel {
  final int id;
  final List<String> categories;
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
    @required this.categories,
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
    this.isFavorite = false,});
}