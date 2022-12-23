import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:liste_film/Objects/film_entity.dart';
import 'package:liste_film/Services/sqlite.service.dart';

//insert
//https://docs.flutter.dev/cookbook/persistence/sqlite

Future<bool> insertFilm(Film film) async {
  final db = await SqliteService.database;

  await db.insert(
    'listefilms',
    film.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  return true;
}

//select
Future<List<Film>> getFilms() async {
  final db = await SqliteService.database;

  final List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM listefilms");
  return List.generate(maps.length, (i) {
    return Film.fromMap(maps[i]);
  });
}

//select film where genre -> comedie
Future<List<Film>> getFilmsComedie(String added) async {
  final db = await SqliteService.database;

  final List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM listefilms WHERE genre = 'Comédie' AND added = '$added'");
  return List.generate(maps.length, (i) {
    return Film.fromMap(maps[i]);
  });
}

//select film where genre -> action
Future<List<Film>> getFilmsAction(String added) async {
  final db = await SqliteService.database;

  final List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM listefilms WHERE genre = 'Action' AND added = '$added'");
  return List.generate(maps.length, (i) {
    return Film.fromMap(maps[i]);
  });
}

//select film where genre -> aventures
Future<List<Film>> getFilmsAventure(String added) async {
  final db = await SqliteService.database;

  final List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM listefilms WHERE genre = 'Aventure' AND added = '$added'");
  return List.generate(maps.length, (i) {
    return Film.fromMap(maps[i]);
  });
}

//get three last films
Future<List<Film>> getThreeLastFilms() async {
  final db = await SqliteService.database;

  final List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM listefilms ORDER BY id DESC LIMIT 3");
  return List.generate(maps.length, (i) {
    return Film.fromMap(maps[i]);
  });
}

//delete
//delete an item
Future<void> deleteFilm(int id) async {
  final db = await SqliteService.database;

  await db.delete(
    'listefilms',
    where: "id = ?",
    whereArgs: [id],
  );
}


//update
Future<void> updateFilm(Film film) async {
  final db = await SqliteService.database;

  await db.update(
    'listefilms',
    film.toMap(),
    where: "id = ?",
    whereArgs: [film.id],
  );
}