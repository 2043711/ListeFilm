import 'package:flutter/material.dart';
import 'package:liste_film/Objects/film_entity.dart';
import 'package:liste_film/Screens/un_film.dart';

class VitrineFilm extends StatefulWidget {
  final String title;
  final List<Film> films;
  const VitrineFilm({super.key, required this.title, required this.films});

  @override
  State<VitrineFilm> createState() => _VitrineFilmState();
}

class _VitrineFilmState extends State<VitrineFilm> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                width: 400,
                height: 250,
                child: Column(
                  children: [
                    SizedBox(
                      width: 300,
                      height: 25,
                      child: Text( widget.title, style: const TextStyle( fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white, fontStyle: FontStyle.italic, backgroundColor: Colors.red), textAlign: TextAlign.left,),
                    ),
                    Container(
                      width: 300,
                      height: 175,
                      decoration: BoxDecoration(
                        color: Colors.grey[850],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child :
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [ 
                            const Padding(padding: EdgeInsets.all(5)),
                            Row(
                              //for each film in the list, we create a button with the image of the film
                              children: widget.films.map((film) => 
                                Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: SizedBox(
                                    width: 100,
                                    height: 150,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => UnFilm(film: film)));
                                      },
                                      child: Image.network( film.image.toString(), width: 100, height: 150, fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                              ).toList(),
                            ),],
                        ),
                      ),),
                  ],
                )
              );
  }
}