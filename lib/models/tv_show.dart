class TvShow {
  final int id;

  final String name;

  final String poster;

  final String overview;

  final String firstAirDate;

  TvShow({
    required this.id,
    required this.name,
    required this.poster,
    required this.overview,
    required this.firstAirDate, 
  });

  factory TvShow.fromJson(Map<String, dynamic> json) {
    return TvShow(
      id: json['id'],
      name: json['name'],
      poster: json['poster_path'],
      firstAirDate: json['first_air_date'],
      overview: json['overview'] 
    );
  }
}