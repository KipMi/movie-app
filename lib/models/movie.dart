class Movie {
  final String keyword;
  final String imdb_id;
  final int year;
  final String actors;
  final String title;

  Movie(
      {required this.imdb_id,
      required this.year,
      required this.actors,
      required this.title,
      required this.keyword});
}
