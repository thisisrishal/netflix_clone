import 'package:netflix_ui/core/strings.dart';
import 'package:netflix_ui/domain/get_movie_details/get_movie_details.dart';
import 'package:netflix_ui/infrastructure/api_key.dart';

class ApiEndPoints {
  static const String imageId = 'https://image.tmdb.org/t/p/original';
  static const pastYear =
      '$kBaseUrl/trending/all/day?api_key=$apiKey&language=en-US&page=3#';
  static const trending =
      '$kBaseUrl/trending/all/day?api_key=$apiKey&language=en-US&page=3#';
  static const topRating =
      '$kBaseUrl/movie/top_rated?api_key=$apiKey&language=en-US&page=3#';

  static const upComing =
      '$kBaseUrl/movie/upcoming?api_key=$apiKey&language=en-US&page=3#';
  static const everyoneWatching =
      '$kBaseUrl/account/{account_id}/rated/movies?api_key$apiKey&language=en-US&page=3#';
  static const topTen =
      '$kBaseUrl/trending/all/day?api_key=$apiKey&language=en-US&page=3#';
  static const allMovies =
      '$kBaseUrl/discover/movie?api_key=$apiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate';
  // '$kBaseUrl/movie/{movie_id}?api_key=$apiKey&language=en-US';
}
