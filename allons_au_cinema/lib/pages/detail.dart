import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:allons_au_cinema/modeles/film.dart';

class DetailFilm extends StatelessWidget {
  const DetailFilm({Key? key, required this.film}) : super(key: key);

  final Film film;
  final String urlBaseAffiche = "https://image.tmdb.org/t/p/w500/";

  @override
  Widget build(BuildContext context) {
    String chemin;
    if (film.urlAffiche != null) {
      chemin = urlBaseAffiche + (film.urlAffiche ?? "");
    } else {
      chemin =
          'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard1184339.jpg';
    }
    return Scaffold(
      appBar: AppBar(title: Text(film.titre.toString())),
      body: SingleChildScrollView(
          child: Center(
        child: Column(children: [
          Container(
            child: Image.network(
              chemin,
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height / 1.5,
            ),
            padding: const EdgeInsets.all(36.0),
          ),
          Text(film.resume.toString())
        ]),
      )),
    );
  }
}
