import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider {
  String _apiKey = env['MOVIEDB_API_KEY'];
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, "3/movie/now_playing",
        {'api_key': _apiKey, 'language': _language});

    return await _getPeliculasResponse(url);
  }

  Future<List<Pelicula>> getPopulares() async {
    final url = Uri.https(
        _url, "3/movie/popular", {'api_key': _apiKey, 'language': _language});

    return await _getPeliculasResponse(url);
  }

  Future<List<Pelicula>> _getPeliculasResponse(Uri url) async {
    final response = await http.get(url);

    print(response);

    final decodedData = json.decode(response.body);

    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;
  }
}
