import 'package:flutter/material.dart';

class Pokemon{
  String nome;
  String urlImage;
  String type1;
  String type2;
  int id;
  int weight;
  int height;
  String ability;
  var cortipo1 = Colors.deepPurple.shade300;
  var cortipo2 = Colors.purple.shade900;


  Pokemon.fromJson(Map< String,dynamic> json){
    nome = json['name'];
    urlImage = json['sprites']['front_default'];
    type1 = json['types'][0]['type']['name'];
    type2 = json['types'][1]['type']['name'];
    id = json['id'];
    weight = json['weight'];
    height = json['height'];
    ability = json['abilities'][0]['ability']['name'];

       if(type1 == 'grass'){
         cortipo1 = Colors.lightGreenAccent;

       }

      }
    }



