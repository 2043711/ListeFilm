import "package:flutter/material.dart";
import 'package:liste_film/Screens/les_films.dart';
import 'package:liste_film/Objects/film_entity.dart';
import 'package:liste_film/Services/film.service.dart';
import "package:liste_film/Widgets/menu_button.dart";


// ignore: must_be_immutable
class Home extends StatefulWidget {
  List<Film> lastFilms = [
    Film(
      id: 1,
      titre: "leFilm1",
      genre: "Aventure",
      description: "LaDescription1",
      image: "https://www.france.tv/image/vignette_3x4/300/400/6/3/j/62d4c87e-phpkagj36.jpg",
      urlVideo: "https://youtu.be/1P1J3WRV4-s",
      added: "no",
    ),
    Film(
      id: 2,
      titre: "leFilm2",
      genre: "Action",
      description: "LaDescription2",
      image: "https://m.media-amazon.com/images/I/8129a7-9A7L._AC_SX425_.jpg",
      urlVideo: "https://youtu.be/kVrqfYjkTdQ",
      added: "no",
    ),
    Film(
      id: 3,
      titre: "leFilm3",
      genre: "Action",
      description: "LaDescription3",
      image: "https://www.cinemasguzzo.com/DATA/FILM/7731_fr.jpg",
      urlVideo: "https://youtu.be/X0tOpBuYasI",
      added: "no",
    ),
  ];
  Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    var film1 = Film(
    id: 1,
    titre: "leFilm1",
    genre: "Aventure",
    description: "LaDescription1",
    image: "https://www.france.tv/image/vignette_3x4/300/400/6/3/j/62d4c87e-phpkagj36.jpg",
    urlVideo: "https://youtu.be/1P1J3WRV4-s",
    added: "no");

    var film2 = Film(
    id: 2,
    titre: "leFilm2",
    genre: "Action",
    description: "LaDescription2",
    image: "https://m.media-amazon.com/images/I/8129a7-9A7L._AC_SX425_.jpg",
    urlVideo: "https://youtu.be/kVrqfYjkTdQ",
    added: "no");

    var film3 = Film(
    id: 3,
    titre: "leFilm3",
    genre: "Action",
    description: "LaDescription3",
    image: "https://www.cinemasguzzo.com/DATA/FILM/7731_fr.jpg",
    urlVideo: "https://youtu.be/X0tOpBuYasI",
    added: "no");

  @override
    void initState() {
    super.initState();
    getThreeLastFilms().then((value) {
      setState(() {
        widget.lastFilms = value;
        print(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Center(
          child: Column(
            children: [
              const Spacer(),
              const Text(
                "FIMLIS",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 50),
              ),
              const Padding(padding: EdgeInsets.all(45)),
              MenuButton(
                text: "Les films",
                fontWeight: FontWeight.bold,
                color: Colors.white,
                action: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: 
                  (context) => LesFilms(liste: true)));
                },
              ),
              const Padding(padding: EdgeInsets.all(25)),
              MenuButton(
                text: "Mes listes",
                fontWeight: FontWeight.bold,
                color: Colors.white,
                action: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: 
                  (context) => LesFilms(liste: false)));
                },
              ),
              const Spacer(),
              //draw a grey rectangle with 3 images inside
              Container(
                width: 400,
                height: 233,
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                ),
                child: Column(children: 
                [ 
                  const Padding(padding: EdgeInsets.all(20), child: Text("Les nouveautés", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20, fontStyle: FontStyle.italic))),
                  Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: 
                    [
                      Image.network( widget.lastFilms[0].image.toString(), width: 100, height: 150, fit: BoxFit.fill),
                      Image.network( widget.lastFilms[1].image.toString(), width: 100, height: 150, fit: BoxFit.fill),
                      Image.network( widget.lastFilms[2].image.toString(), width: 100, height: 150, fit: BoxFit.fill),                    
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(10),)
                ],                 
              ),
            ),
            const Spacer(),
            ],
          ),
        ),
      ]),
      backgroundColor: Colors.red,
    );
  }
}
