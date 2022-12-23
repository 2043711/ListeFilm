import "package:flutter/material.dart";
import 'package:liste_film/Screens/home.dart';
import 'package:liste_film/Screens/les_films.dart';
import 'package:liste_film/Services/film.service.dart';
import 'package:liste_film/Objects/film_entity.dart';
import "package:liste_film/Widgets/menu_button.dart";
import 'package:liste_film/Widgets/vitrine_film.dart';
import 'package:liste_film/Widgets/menu_button.dart';

List<String> list = <String>['Action', 'Aventure', 'Comédie'];
//make form for add film
class AddFilm extends StatefulWidget {
  AddFilm({Key? key}) : super(key: key);
  @override
  _AddFilmState createState() => _AddFilmState();
}

class _AddFilmState extends State<AddFilm> {


  final TextEditingController titreController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController urlVideoController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titreController.dispose();
    descriptionController.dispose();
    imageController.dispose();
    urlVideoController.dispose();
    super.dispose();
  }


  String dropdownValue = list.first;
  var films = [Film];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        centerTitle: true,
        title: const Text("Ajouter un film",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 30)),
                titleSpacing: 40,
        backgroundColor: Colors.grey[850],
      ),
      body: Stack(
        children: [
          Center(child: Column(children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color.fromARGB(200, 48, 48, 48),
              ),
              margin: const EdgeInsets.all(25.0),
              child: TextField(
                controller: titreController,
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide : const BorderSide(color: Colors.white, width: 2.0),
                  ),
                  labelText: 'Titre',
                  //change color of outline border
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color.fromARGB(200, 48, 48, 48),
              ),
              margin: const EdgeInsets.all(25.0),
              child: TextField(
                controller: descriptionController,
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide : const BorderSide(color: Colors.white, width: 2.0),
                  ),
                  labelText: 'Description',
                  //change color of outline border
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color.fromARGB(200, 48, 48, 48),
              ),
              margin: const EdgeInsets.all(25.0),
              child: TextField(
                controller: imageController,
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide : const BorderSide(color: Colors.white, width: 2.0),
                  ),
                  labelText: 'image url',
                  //change color of outline border
                ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color.fromARGB(200, 48, 48, 48),
              ),
              margin: const EdgeInsets.all(25.0),
              child: TextField(
                controller: urlVideoController,
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide : const BorderSide(color: Colors.white, width: 2.0),
                  ),
                  labelText: 'liens youtube',
                  //change color of outline border
                ),
              ),
            ),

            //make dropdown select genre
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color.fromARGB(200, 48, 48, 48),
                border: Border.all(color: Colors.black, width: 1.0),
              ),
              margin: const EdgeInsets.all(25.0),
              child: DropdownButtonHideUnderline(
                child: Padding(
                  padding: const EdgeInsets.only(left: 11.0, right: 10.0),
                  child:  DropdownButton<String>(
                    dropdownColor: Color.fromARGB(200, 48, 48, 48), 
                    isExpanded: true,
                    itemHeight: 60,
                    borderRadius: BorderRadius.circular(25),
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward, color: Colors.white,),
                    elevation: 8,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                ),
              ),
            ),
            ),
            SizedBox(
              width: 300,
              child: MenuButton(text: "Ajouter", color: Colors.green, textColor: Colors.white, fontWeight: FontWeight.bold, 
              action: () {
                  //take each value of the textfield and add it to the list
                  Film newFilm = Film(
                    id: 0,
                    titre: titreController.text,
                    genre: dropdownValue,
                    description: descriptionController.text,
                    image: imageController.text,
                    urlVideo: urlVideoController.text,
                    added: "no"
                  );
                  insertFilm(newFilm);  
                  Future.delayed(const Duration(milliseconds: 500), () {
                    //go back to list of films
                    Navigator.of(context).push(MaterialPageRoute(builder: 
                  (context) => LesFilms(liste: true)));
                  });         
                },),
            ),
          ]
        ),
        )
        ]
      ),
     backgroundColor: Colors.red, 
    );
    
  }
}
