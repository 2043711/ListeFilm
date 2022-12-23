import "package:flutter/material.dart";
import 'package:liste_film/Screens/add_film.dart';
import 'package:liste_film/Screens/home.dart';
import 'package:liste_film/Services/film.service.dart';
import 'package:liste_film/Objects/film_entity.dart';
import "package:liste_film/Widgets/menu_button.dart";
import 'package:liste_film/Widgets/vitrine_film.dart';


// ignore: must_be_immutable
class LesFilms extends StatefulWidget {
  List<Film> filmsAction = [];
  List<Film> filmsAventure = [];
  List<Film> filmsComedie = [];
  bool liste;
  LesFilms({super.key, required this.liste});

  @override
  State<LesFilms> createState() => _LesFilmsState();
}

class _LesFilmsState extends State<LesFilms> {
  var film1 = Film(
  id: 1,
  titre: "leFilm1",
  genre: "Aventure",
  description: "LaDescription1",
  image: "https://www.france.tv/image/vignette_3x4/300/400/6/3/j/62d4c87e-phpkagj36.jpg",
  urlVideo: "https://youtu.be/1P1J3WRV4-s",
  added: "no");

  var films = [Film];

  @override
    void initState() {
    super.initState();
    if ( widget.liste == true) {
      getFilmsAction("no").then((value) {
        setState(() {
          widget.filmsAction = value;
          print(widget.filmsAction);
        });
      });
      getFilmsComedie("no").then((value) {
        setState(() {
          widget.filmsComedie = value;
          print(widget.filmsComedie);
        });
      });
      getFilmsAventure("no").then((value) {
        setState(() {
          widget.filmsAventure = value;
          print(widget.filmsAventure);
        });
      });
    } else {
            getFilmsAction("yes").then((value) {
        setState(() {
          widget.filmsAction = value;
          print(widget.filmsAction);
        });
      });
      getFilmsComedie("yes").then((value) {
        setState(() {
          widget.filmsComedie = value;
          print(widget.filmsComedie);
        });
      });
      getFilmsAventure("yes").then((value) {
        setState(() {
          widget.filmsAventure = value;
          print(widget.filmsAventure);
        });
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: 
                  (context) => Home()));
            },
          ),
          centerTitle: true,
          title: const Text("Les films",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 30)),
                  titleSpacing: 40,
          backgroundColor: Colors.grey[850],

        ),
      body: Stack(children: [
        SingleChildScrollView( 
          child: Center(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(25)),
              MenuButton(
                text: "+ Ajouter un film",
                fontWeight: FontWeight.bold,
                action: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: 
                  (context) => AddFilm()));
                },
              ),
              const Padding(padding: EdgeInsets.all(15)),
              VitrineFilm(title : "Action", films: widget.filmsAction),
              VitrineFilm(title : "Aventure", films: widget.filmsAventure),
              VitrineFilm(title : "Comédie", films: widget.filmsComedie),
            ],
          ),
          ),
        ),
      ]),
      backgroundColor: Colors.red,
    );
  }
}
