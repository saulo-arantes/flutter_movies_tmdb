class Movie {
  final int id;

  final String title;

  final String poster;

  final String releaseDate;

  final String? tagline;

  final String overview;

  Movie({
    required this.id,
    required this.title,
    required this.poster,
    required this.releaseDate, 
    this.tagline,
    required this.overview,
  });
  
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      poster: 'https://image.tmdb.org/t/p/w500${json['poster_path']}',
      releaseDate: json['release_date'],
      tagline: json['tagline'],
      overview: json['overview'],
    );
  }
}