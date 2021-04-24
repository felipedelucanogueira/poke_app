import 'package:poke_app/api.dart';
import 'package:poke_app/pokemon.dart';

class PokeModel {
  Future<Pokemon> _pokemon;
  Future<Pokemon> get pokemon => _pokemon;

  fetchPokemon(int number) {
    _pokemon = API().fetchPokemon(number);
  }
}
