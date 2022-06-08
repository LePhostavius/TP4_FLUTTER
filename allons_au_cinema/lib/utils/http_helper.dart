import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:allons_au_cinema/modeles/film.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlCmd = '/upcoming?';
  final String urlKey = 'api_key=fa678c58ebb4687cbdb02f592eeabebb';
  final String urlLangage = '&language=fr-FR';

  Future<List> recevoirNouveauxFilms() async {
    final String urlNouveauxFilms = (urlBase + urlCmd + urlKey + urlLangage);
    http.Response resultat = await http.get(Uri.parse(urlNouveauxFilms));
    if (resultat.statusCode == HttpStatus.ok) {
      final chaineJson = json.decode(resultat.body);
      final filmsMap = chaineJson['results'];
      List films = filmsMap.map((i) => Film.fromJson(i)).toList();
      return films;
    } else {
      return [];
    }
  }
}
