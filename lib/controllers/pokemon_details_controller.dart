import 'dart:convert';

import 'package:dev_pleno_pokemon_api/models/details_pokemon.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class PokemonDetailsScreenController extends ChangeNotifier {
  static final PokemonDetailsScreenController _singleton =
      PokemonDetailsScreenController._internal();
  factory PokemonDetailsScreenController() {
    return _singleton;
  }
  PokemonDetailsScreenController._internal();
  Future<PokemonDetails?> get({String? id, String? name}) async {
    try {
      final endpoint = Uri.parse(
          "https://pokeapi.co/api/v2/pokemon/${id != null ? id : name}");
      http.Response response = await http.get(endpoint);
      PokemonDetails pokemons =
          PokemonDetails.fromJson(jsonDecode(response.body));
      return pokemons;
    } catch (error, stackTrace) {
      print("$error \n $stackTrace");
      return null;
    }
  }

  Future<List<PokemonDetails?>> getAllDetails({String? url}) async {
    try {
      List<PokemonDetails> pokemons = [];
      for (int i = 1; i <= 20; i++) {
        final endpoint = Uri.parse("https://pokeapi.co/api/v2/pokemon/$i");
        http.Response response = await http.get(endpoint);
        pokemons.add(PokemonDetails.fromJson(jsonDecode(response.body)));
        print(pokemons);
      }
      return pokemons;
    } catch (error, stackTrace) {
      print("$error \n $stackTrace");
      return [];
    }
  }
}
