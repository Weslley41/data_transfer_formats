import 'dart:io';

abstract class Data {

  List<String> fieldsList = [];
  final Set<Map> dataSet = {};

  void load(String fileName) {
    File file = File(fileName);

    data = file.readAsStringSync();
  }

  void save(String fileName) {
    File file = File(fileName);

    try {
      file.writeAsStringSync(data);
    } catch (error) {
      file.createSync(recursive: true);
      file.writeAsStringSync(data);
    }
  }

  void clear() {
    fieldsList.clear();
    dataSet.clear();
  }

  set data(String data);
  set fields(List<String> fields);
  String get data;
  List<String> get fields => fieldsList;
  bool get hasData => dataSet.isNotEmpty;

}
