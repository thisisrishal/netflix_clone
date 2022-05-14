import 'dart:convert';

import 'package:http/http.dart' as http;

import '../domain/get_movie_details/get_movie_details.dart';

//listType == which list of movies we need
Future<List> getEveryoneWatching(String listType) async {
  http.Response res = await http.get(Uri.parse(listType));
  // print('=====res======${res.body }================');
  if (res.statusCode == 200) {

      final decoded = jsonDecode (res.body);
    List<dynamic> list =
        decoded['results'].map((item) => TopRated.fromJson(item)).toList();
    return list;

  }
  else {
    throw "Can't get list";
  }
}
Future<List> getUpComing(String listType) async {
  http.Response res = await http.get(Uri.parse(listType));
  // print('=====res======${res.body }================');
  if (res.statusCode == 200) {
    final decoded = jsonDecode(res.body);
    List<dynamic> list =
        decoded['results'].map((item) => UpComing.fromJson(item)).toList();
    return list;
  } else {
    throw "Can't get list";
  }
}
Future<List> getAllMovies(String listType) async {
  http.Response res = await http.get(Uri.parse(listType));
  // print('=====res======${res.body }================');
  if (res.statusCode == 200) {
    final decoded = jsonDecode(res.body);
    List<dynamic> list =
        decoded['results'].map((item) => AllMovies.fromJson(item)).toList();
    return list;
  } else {
    throw "Can't get list";
  }
}
