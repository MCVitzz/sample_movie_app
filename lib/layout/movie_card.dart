import 'package:flutter/material.dart';
import 'package:movieapp/data/movie.dart';
import 'package:movieapp/services/api.dart';

class MovieCard extends StatelessWidget {
  final Movie _movie;

  MovieCard(this._movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Image.network(
              API.getStatic(_movie.img),
              fit: BoxFit.cover,
            ),
          ),
          Text(
            getTitle(),
            style: TextStyle(color: Colors.grey[100]),
          ),
        ],
      ),
    );
  }

  String getTitle() {
    if (_movie.year != -1)
      return _movie.title + ' (' + _movie.year.toString() + ')';
    else
      return _movie.title + ' (Coming Soon)';
  }
}
