import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke_app/poke_controller.dart';
import 'package:poke_app/pokemon.dart';

class PokeView extends StatefulWidget {
  @override
  _PokeViewState createState() => _PokeViewState();
}

class _PokeViewState extends State<PokeView> {
  final controller = PokeController();

  @override
  Widget build(BuildContext context) {
    return Material(child: PokedexScreen());
  }
}

class PokedexScreen extends StatefulWidget {
  @override
  _PokedexScreenState createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  final controller = PokeController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            color: Colors.white,
            child: Stack(
              children: [FutureBuilder<Pokemon>(
                  future:controller.pokemon,
                  builder: (context,snapshot){
                    return ClipPath(
                      clipper: CustomShape(),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                 snapshot.data.cortipo1,
                                 snapshot.data.cortipo2,
                                ])),
                        height: MediaQuery.of(context).size.height * 0.45,),
                    );

              }),

                Padding(
                  padding: const EdgeInsets.only(
                    top: 60.0,
                  ),
                  child: FutureBuilder<Pokemon>(
                      future: controller.pokemon,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {}
                        if(snapshot.hasError){

                        }
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    snapshot.data.nome.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontFamily:'Roboto',
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                  ),
                                  Text(
                                    '#${snapshot.data.id.toString()}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              Image.network(
                                snapshot.data.urlImage,
                                height: 280,
                                width: 300,
                                fit: BoxFit.fill,
                              ),
                              Row(
                                children: [
                                  for(var types in snapshot.data.types)
                                    FilterChip(
                                      label: Center(
                                          child: Text(
                                            '       ${types.type}       ',
                                            style: TextStyle(
                                                fontSize: 20, color: Colors.white),
                                          )),
                                      onSelected: (bool) {},
                                         backgroundColor: snapshot.data.cortipo1,
                                      selectedColor: Colors.red,
                                    ),

                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text(snapshot.data.ability
                                            .toUpperCase()),
                                        Text('\nHABILIDADE'),
                                      ],
                                    ),
                                    VerticalDivider(
                                      thickness: 5,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                            '${(snapshot.data.height / 10).toDouble().toString()} M'),
                                        Text('\nALTURA'),
                                      ],
                                    ),
                                    VerticalDivider(
                                      thickness: 5,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                            '${(snapshot.data.weight / 10).toString()} KG'),
                                        Text('\nPESO'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Text(snapshot.data.types.length.toString()),

                              Row(


                              )


                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text(snapshot.error,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.red));
                        }
                        return Container();
                      }),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        controller.loadPokemon();
                      });
                    },
                    child: Text("Pokemon")),
              ],
            )));
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
