import 'package:flutter/material.dart';

class Movie {
  String title;
  String img;
  int year;

  Movie(this.title, this.img, this.year);

  factory Movie.fromJson(Map<String, dynamic> json) {
    int releaseDate = -1;
    if (json['release_date'] != null)
      releaseDate = DateTime.parse(json['release_date']).year;
    return Movie(json['original_title'], json['poster_path'], releaseDate);
  }
}
