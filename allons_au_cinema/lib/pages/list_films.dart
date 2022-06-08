import 'package:flutter/material.dart';
import 'package:allons_au_cinema/utils/http_helper.dart';
import 'package:allons_au_cinema/modeles/film.dart';
import 'package:allons_au_cinema/pages/detail.dart';

class ListeFilms extends StatefulWidget {
  const ListeFilms({Key? key}) : super(key: key);

  @override
  State<ListeFilms> createState() => _ListeFilmsState();
}

class _ListeFilmsState extends State<ListeFilms> {
  late HttpHelper httpHelper;
  late String helper;
  // ignore: non_constant_identifier_names
  List liste_films = [];
  int nombreFilms = 0;
  int compteur = 0;

  final String iconBase = 'https://image.tmdb.org/t/p/w92/';
  final String imageParDefaut =
      'https://images.freeimages.com/images/large-previews/5eb/movieclapboard-1184339.jpg';

  @override
  void initState() {
    helper = "initialisé";
    httpHelper = HttpHelper();
    initialiser();
    super.initState();
  }

  Future initialiser() async {
    httpHelper.recevoirNouveauxFilms().then((value) {
      setState(() {
        liste_films = value;
        nombreFilms = value.length;
        if (nombreFilms != null) {
          compteur = nombreFilms;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Films')),
        body: ListView.builder(
            itemCount: compteur,
            itemBuilder: (context, int index) {
              return Card(
                  color: Color.fromARGB(255, 241, 239, 239),
                  child: ListTile(
                    onTap: () {
                      MaterialPageRoute route = MaterialPageRoute(
                          builder: (_) => DetailFilm(
                                film: liste_films[index],
                              ));
                      Navigator.push(context, route);
                    },
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            iconBase + liste_films[index].urlAffiche)),
                    title: Text(liste_films[index].titre.toString()),
                    subtitle: Text("Date de sortie : " +
                        liste_films[index].dateDeSortie.toString() +
                        "- Note " +
                        liste_films[index].note.toString() +
                        "/10"),
                  ));
            }));
  }
}
