
abstract class Data {

  List<String> _fields = [];
  String _data = '';

  void load(String fileName);
  void save(String fileName);
  void clear() {
    _fields = [];
    _data = '';
  }

  set data(String data);
  set fields(List<String> fields);
  String get data => _data;
  List<String> get fields => _fields;
  bool get hasData => _data.isNotEmpty;

}
