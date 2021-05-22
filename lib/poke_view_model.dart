import 'dart:async';
import 'dart:math';

import 'package:poke_app/poke_model.dart';
import 'package:poke_app/pokemon.dart';

class PokeViewModel {
  PokeModel model = PokeModel();

  StreamController<Pokemon> streamPokemon = StreamController();

  loadPokemon() {
    model.fetchPokemon(Random().nextInt(892));
    model.pokemon!.then((value) {
      streamPokemon.add(value);
    });
  }
}
