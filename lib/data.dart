part of 'datas.dart';

abstract class Data {

  List<String> _fieldsList = [];
  Set<Map> dataSet = {};
  final String _extensionFile;

  Data({required extensionFile}) : _extensionFile = extensionFile;

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
    _fieldsList.clear();
    dataSet.clear();
  }

  set data(String data);
  set fieldsList(List<String> fields) => _fieldsList = fields;
  String get data;
  List<String> get fields => _fieldsList;
  bool get hasData => dataSet.isNotEmpty;

}
