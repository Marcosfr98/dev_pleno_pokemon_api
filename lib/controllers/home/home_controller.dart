import 'dart:convert';

import 'package:dev_pleno_pokemon_api/models/get_pokemon.dart';
import "package:http/http.dart" as http;

class HomeController {
  static final HomeController _singleton = HomeController._internal();
  factory HomeController() {
    return _singleton;
  }
  HomeController._internal();
  Future<GetPokemon?> get({String? offset}) async {
    try {
      final endpoint = Uri.parse(
          "https://pokeapi.co/api/v2/pokemon/?offset=${offset ?? 0}&limit=20");
      http.Response response = await http.get(endpoint);
      GetPokemon pokemons = GetPokemon.fromJson(jsonDecode(response.body));
      return pokemons;
    } catch (error, stackTrace) {
      print("$error \n $stackTrace");
      return null;
    }
  }
}
