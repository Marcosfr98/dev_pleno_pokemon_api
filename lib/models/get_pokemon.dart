import 'package:dev_pleno_pokemon_api/models/details_pokemon.dart';

class GetPokemon {
  int? _count;
  String? _next;
  String? _previous;
  List<Results>? _results;

  GetPokemon(
      {int? count, String? next, String? previous, List<Results>? results}) {
    if (count != null) {
      this._count = count;
    }
    if (next != null) {
      this._next = next;
    }
    if (previous != null) {
      this._previous = previous;
    }
    if (results != null) {
      this._results = results;
    }
  }

  int? get count => _count;
  set count(int? count) => _count = count;
  String? get next => _next;
  set next(String? next) => _next = next;
  String? get previous => _previous;
  set previous(String? previous) => _previous = previous;
  List<Results>? get results => _results;
  set results(List<Results>? results) => _results = results;

  GetPokemon.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    _next = json['next'];
    _previous = json['previous'];
    if (json['results'] != null) {
      _results = <Results>[];
      json['results'].forEach((v) {
        _results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this._count;
    data['next'] = this._next;
    data['previous'] = this._previous;
    if (this._results != null) {
      data['results'] = this._results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
