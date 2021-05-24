import 'package:flutter_test/flutter_test.dart';
import 'package:poke_app/api.dart';
import 'package:poke_app/poke_model.dart';
import 'package:poke_app/pokemon.dart';


void main(){

  test ('FetchPokemon should fill pokemon variable', (){

    final model = PokeModel(api: MockAPI());


    model.fetchPokemon(1);

    expect(model.pokemon, completion(isNotNull));

    model.pokemon!.then((pokemon) {
      expect(pokemon.nome, 'Felipe');
    });
  });
}


class MockAPI extends API {

  @override
  Future<Pokemon> fetchPokemon(int number){
    final pokemon = Pokemon(nome: 'Felipe',types: []);
    return Future.value(pokemon);

  }
}