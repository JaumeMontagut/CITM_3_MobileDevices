import 'package:flutter/cupertino.dart';

class Movie {
  String title, pg, overview;
  int year, duration; //Duration in minutes
  String posterURL;
  List<String> genres;
  List<String> directors, writers, actors;

  Movie(this.title, this.pg, this.overview, this.year, this.duration,
      this.posterURL, this.genres, this.directors, this.writers, this.actors);
}

// final lotr = Movie('The Lord of the Rings', 'PG-13', 'asdfadafa',
// 2001, 178,'', )