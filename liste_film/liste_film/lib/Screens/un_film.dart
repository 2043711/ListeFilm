import "package:flutter/material.dart";
import 'package:liste_film/Screens/add_film.dart';
import 'package:liste_film/Screens/home.dart';
import 'package:liste_film/Screens/les_films.dart';
import 'package:liste_film/Services/film.service.dart';
import 'package:liste_film/Objects/film_entity.dart';
import "package:liste_film/Widgets/menu_button.dart";
import 'package:liste_film/Widgets/vitrine_film.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

//make page the shows one film
//it has an image a the top with a link redirecting to a url
//it shows the title in bold and the description and there two buttons
//the first one is to add the film to the list of films to watch the second one is to delete the film
// ignore: must_be_immutable
class UnFilm extends StatefulWidget {
  final Film film;

  const UnFilm({super.key, required this.film});

  @override
  State<UnFilm> createState() => _UnFilmState();
}

class _UnFilmState extends State<UnFilm> {
  late YoutubePlayerController controller;

  @override
  void initState(){
    super.initState();
      controller = YoutubePlayerController(initialVideoId: YoutubePlayer.convertUrlToId(widget.film.urlVideo)!,
    );
  }

  @override
    void deactivate() {
      controller.pause();

      super.deactivate();
    }

    @override 
    void dispose(){
      controller.dispose();

      super.dispose();
    }


  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: controller),
      builder: (context, player) => Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        centerTitle: true,
        title: Text(widget.film.titre,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 30)),
                titleSpacing: 40,
        backgroundColor: Colors.grey[850],
      ),
      body: Column(
        children: [
          player,
          Text(widget.film.description),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Ajouter"),
          ),
          ElevatedButton(
            onPressed: () {
              deleteFilm(widget.film.id);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LesFilms(),
                ),
              );
            },
            child: const Text("Supprimer"),
          ),
        ],
      ),
      backgroundColor: Colors.red,
    ));
  }
}