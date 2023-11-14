import 'dart:html';
import 'package:hive/hive.dart';

void saveData(String key, String value) async {
  var _box = await Hive.openBox('testBox');

  _box.put(key, value);

  var name = _box.get(key);

  print('Name: $name');
}

void loadData(String key) async {
  var _box = await Hive.openBox('testBox');
  print(_box.get(key));
}
