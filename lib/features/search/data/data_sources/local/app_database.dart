import 'package:floor/floor.dart';

import '../../models/search_model.dart';
import 'DAO/search_dao.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_database.g.dart';

@Database(version: 1, entities: [SearchModel])
abstract class AppDatabase extends FloorDatabase{
  SearchDao get searchDAO;
}