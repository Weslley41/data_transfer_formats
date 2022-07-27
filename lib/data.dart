
abstract class Data {

  void load(String fileName);
  void save(String fileName);
  void clear();

  set data(String data) => data;
  bool get hasData;
  String get data;
  List<String> get fields;

}
