part of '../datas.dart';

abstract class Data {

  List<String> _fieldsList = [];
  Set<Map> dataSet = {};
  final String _extensionFile;

  Data({required extensionFile}) : _extensionFile = extensionFile;

  void load(String fileName) {
    if (!fileName.endsWith(".$_extensionFile")) {
      throw LoadDataErrorInvalidExtension();
    }
    try {
      File file = File(fileName);
      data = file.readAsStringSync();
    } on FileSystemException {
      throw LoadDataErrorFileNotFound();
    }
  }

  void save(String fileName) {
    if (!fileName.endsWith(".$_extensionFile")) {
      throw SaveFileErrorInvalidExtension();
    }
    File file = File(fileName);

    try {
      file.writeAsStringSync(data);
    } catch (error) {
      file.createSync(recursive: true);
      file.writeAsStringSync(data);
    }
  }

  void clear() {
    try {
      _fieldsList.clear();
      dataSet.clear();
    } catch (e) {
      throw UnknownError();
    }
  }

  set fieldsList(List<String> fields) => _fieldsList = fields;
  List<String> get fields => _fieldsList;
  bool get hasData => dataSet.isNotEmpty;

  // Not implemented methods
  set data(String data);
  String get data;

}
