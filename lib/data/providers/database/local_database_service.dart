import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:simple_getx_clean_arch/data/dto/post_db_dto.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabaseService {
  static final _singleton = LocalDatabaseService();

  static LocalDatabaseService get instance => _singleton;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase("placeholder_db");
    return _database!;
  }

  Future<Database> _initDatabase(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future _createDatabase(Database database, int version) async {
    const idType = "INTEGER PRIMARY KEY";
    const booleanType = "BOOLEAN NOT NULL";
    const integerType = "INTEGER NOT NULL";
    const textType = "TEXT NOT NULL";

    await database.execute("CREATE TABLE $tablePosts(${PostDbFields.id} "
        "$idType,${PostDbFields.title} $textType,${PostDbFields.body} "
        "$textType,${PostDbFields.thumbnail} $textType, ${PostDbFields.type} "
        "$textType, ${PostDbFields.likeCount} $integerType, "
        "${PostDbFields.commentCount} $integerType, ${PostDbFields.isLiked} "
        "$booleanType)");
  }

  Future<void> savePost(PostDbDto post) async {
    final database = await instance.database;
    await database.insert(
      tablePosts,
      post.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<PostDbDto> getPost(int id) async {
    final database = await instance.database;
    final resultMaps = await database.query(
      tablePosts,
      columns: PostDbFields.values,
      where: "${PostDbFields.id} =?",
      whereArgs: [id],
    );

    if (resultMaps.isNotEmpty) {
      return PostDbDto.fromMap(resultMaps.first);
    } else {
      throw Exception("ID $id not found");
    }
  }

  Future<List<PostDbDto>> getAllPosts() async {
    final database = await instance.database;
    final List<Map<String, Object?>> resultMaps =
        await database.query(tablePosts);

    final postDbDtoList = await compute(_parsePostDbDtoList, resultMaps);
    return postDbDtoList;
  }

  Future<List<PostDbDto>> _parsePostDbDtoList(
    List<Map<String, Object?>> resultMaps,
  ) async {
    return resultMaps.map((map) => PostDbDto.fromMap(map)).toList();
  }

  Future close() async {
    final database = await instance.database;
    database.close();
  }
}
