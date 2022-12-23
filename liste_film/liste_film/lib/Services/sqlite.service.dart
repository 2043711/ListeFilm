import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class SqliteService {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initializeDB();
    return _database!;
  }

  static Future<Database> _initializeDB() async {

    return openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'film.db'),
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE listefilms(id INTEGER PRIMARY KEY , titre TEXT, genre TEXT, description TEXT, image TEXT, urlVideo TEXT, added BOOLEAN)',
        );
      },
      onUpgrade: (db, oldVersion, newVersion) => db.execute(
        //create new one
        'CREATE TABLE listefilms(id INTEGER PRIMARY KEY , titre TEXT, genre TEXT, description TEXT, image TEXT, urlVideo TEXT, added TEXT)', 
        //create new table
      ),


      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 5,
    );
  }
}