class Film {
  dynamic id;
  dynamic titre;
  dynamic note;
  dynamic dateDeSortie;
  dynamic resume;
  dynamic urlAffiche;

  Film.fromJson(Map<String, dynamic> chaineJson) {
    id = chaineJson['id'];

    titre = chaineJson['title'];

    note = chaineJson['vote_average'] * 1.0;
    dateDeSortie = chaineJson['release_date'];
    resume = chaineJson['overview'];
    urlAffiche = chaineJson['poster_path'];
  }
}
