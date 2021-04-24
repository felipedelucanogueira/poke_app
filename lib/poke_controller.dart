import 'dart:math';

import 'package:poke_app/poke_model.dart';
import 'package:poke_app/pokemon.dart';

class PokeController {
  final model = PokeModel();

  Future<Pokemon> get pokemon => model.pokemon;

  loadPokemon() {
    model.fetchPokemon(Random().nextInt(892));
    //Random().nextInt(892)
  }
}
