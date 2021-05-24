import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke_app/poke_view_model.dart';
import 'package:poke_app/pokemon.dart';

class PokeView extends StatefulWidget {
  @override
  _PokeViewState createState() => _PokeViewState();
}

class _PokeViewState extends State<PokeView> {
  final controller = PokeViewModel();

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
  final controller = PokeViewModel();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
      child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          color: Colors.white,
          child: Stack(
            children: [
              StreamBuilder<Pokemon>(
                  stream: controller.streamPokemon.stream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.active) {
                        controller.loadPokemon();
                      return Center(child: CircularProgressIndicator.adaptive(),);




                    }
                    if (snapshot.hasError) {}
                    if (snapshot.hasData) {
                      return Stack(children: [
                        ClipPath(
                          clipper: CustomShape(),
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                  snapshot.data?.cortipo1! ?? Colors.white,
                                  snapshot.data?.cortipo2! ?? Colors.white,
                                ])),
                            height: MediaQuery.of(context).size.height * 0.45,
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    snapshot.data!.nome!.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: 'FredokaOne',
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0,
                                  ),
                                  Text(
                                    '#${snapshot.data!.id.toString()}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        fontFamily: 'FredokaOne',
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              Image.network(
                                snapshot.data!.urlImage!,
                                height: 280,
                                width: 300,
                                fit: BoxFit.fill,
                              ),
                              Row(
                                children: [
                                  for (var types in snapshot.data!.types)
                                    FilterChip(
                                      label: Center(
                                          child: Text(
                                        '       ${types.type}       ',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontFamily: 'FredokaOne',
                                        ),
                                      )),
                                      onSelected: (bool) {},
                                      backgroundColor: snapshot.data!.cortipo1,
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
                                        Text(
                                          snapshot.data!.ability!.toUpperCase(),
                                          style: TextStyle(
                                            fontFamily: 'FredokaOne',
                                          ),
                                        ),
                                        Text(
                                          '\nHABILIDADE',
                                          style: TextStyle(
                                            fontFamily: 'FredokaOne',
                                          ),
                                        ),
                                      ],
                                    ),
                                    VerticalDivider(
                                      thickness: 5,
                                      color: snapshot.data!.cortipo1,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          '${(snapshot.data!.height! / 10).toDouble().toString()} M',
                                          style: TextStyle(
                                            fontFamily: 'FredokaOne',
                                          ),
                                        ),
                                        Text(
                                          '\nALTURA',
                                          style: TextStyle(
                                            fontFamily: 'FredokaOne',
                                          ),
                                        ),
                                      ],
                                    ),
                                    VerticalDivider(
                                      thickness: 5,
                                      color: snapshot.data!.cortipo1,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          '${(snapshot.data!.weight! / 10).toString()} KG',
                                          style: TextStyle(
                                            fontFamily: 'FredokaOne',
                                          ),
                                        ),
                                        Text(
                                          '\nPESO',
                                          style: TextStyle(
                                            fontFamily: 'FredokaOne',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Shiny',
                                    style: TextStyle(
                                        fontFamily: 'FredokaOne',
                                        fontSize: 30,
                                        color: snapshot.data!.cortipo1),
                                  ),
                                  VerticalDivider(
                                    thickness: 5,
                                    color: snapshot.data!.cortipo1,
                                  ),
                                  Image.network(
                                    snapshot.data!.urlShiny!,
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.fill,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: snapshot.data!.cortipo1),
                                onPressed: () {
                                  controller.loadPokemon();
                                },
                                child: Text("Pokemon"),
                              ),
                            ],
                          ),
                        ),
                      ]);
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error as String,
                          style: TextStyle(fontSize: 18, color: Colors.red));
                    }
                    return Container();
                  })
            ],
          )),
    ));
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
