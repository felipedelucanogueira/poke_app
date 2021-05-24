import 'package:poke_app/api.dart';
import 'package:poke_app/pokemon.dart';

class PokeModel {
  Future<Pokemon>? _pokemon;
  Future<Pokemon>? get pokemon => _pokemon;

  final API api;

  PokeModel({this.api = const  API()});

  fetchPokemon(int number) {
    _pokemon = api.fetchPokemon(number);
  }
}
