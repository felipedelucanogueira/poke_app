import 'package:flutter/material.dart';

class Pokemon {
  String? nome;
  String? urlImage;
  String? urlShiny;
  String? type1;
  int? id;
  int? weight;
  int? height;
  String? ability;
  late List<Types> types;
  Color? cortipo1 = Colors.deepPurple.shade300;
  Color? cortipo2 = Colors.purple.shade900;
  Pokemon(this.cortipo1, this.cortipo2);

  Pokemon.fromJson(Map<String, dynamic> json) {
    nome = json['name'];
    urlImage = json['sprites']['front_default'];
    urlShiny = json['sprites']['front_shiny'];
    id = json['id'];
    weight = json['weight'];
    height = json['height'];
    ability = json['abilities'][0]['ability']['name'];
    type1 = json['types'][0]['type']['name'];

    var arrayTypes = json['types'] as List;

    types = arrayTypes.map((item) {
      return Types.fromJson(item['type']);
    }).toList();

    if (type1 == 'grass' || type1 == 'bug') {
      cortipo1 = Colors.greenAccent;
      cortipo2 = Colors.green;
    } else if (type1 == 'fire') {
      cortipo1 = Colors.redAccent;
      cortipo2 = Colors.red;
    } else if (type1 == 'rock' || type1 == 'ground') {
      cortipo1 = Colors.brown;
      cortipo2 = Colors.brown.shade300;
    } else if (type1 == 'electric') {
      cortipo1 = Colors.yellowAccent[700];
      cortipo2 = Colors.yellow;
    } else if (type1 == 'steel' || type1 == 'normal') {
      cortipo1 = Colors.grey[300];
      cortipo2 = Colors.grey;
    } else if (type1 == 'water' || type1 == 'ice') {
      cortipo1 = Colors.blue[300];
      cortipo2 = Colors.blue;
    }
  }
}

class Types {
  String? type;
  Types.fromJson(Map<String, dynamic> json) {
    type = json['name'];
  }
}
