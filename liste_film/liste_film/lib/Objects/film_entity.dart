class Film{
  final int id;
  final String titre;
  final String genre;
  final String description;
  final String image;
  final String urlVideo;
  final String added;

  const Film({required this.id, required this.titre, required this.genre, required this.description, required this.image, required this.urlVideo, required this.added});

  Map<String, dynamic> toMap() {
    return {
      'titre': titre,
      'genre': genre,
      'description': description,
      'image': image,
      'urlVideo': urlVideo,
      'added': added,
    };
  }

  @override
  String toString() {
    return 'Film{titre: $titre, genre: $genre, description: $description, image: $image, urlVideo: $urlVideo, added: $added}';
  }

    factory Film.fromMap(Map<String, dynamic> map) {
    return Film(
      id: map['id'],
      titre: map['titre'],
      genre: map['genre'],
      description: map['description'],
      image: map['image'],
      urlVideo: map['urlVideo'],
      added: map['added'],
    );
  }
}

