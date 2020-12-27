import 'package:flutter/foundation.dart';

class PromotedModel {
  final String id;
  final String imageUrl;
  final String firstName;
  final String lastName;
  final String profession;
  final double grade;
  final String email;
  final String phoneNumber;
  final String biography;
  final String instagram;
  final String facebook;
  final String linkedIn;
  final String twitter;
  bool isFavorite;

  PromotedModel({
    @required this.id,
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
    this.isFavorite = false,
  });
}
