part of 'datas.dart';

class JSONData extends Data {

  JSONData() : super(extensionFile: 'json');

  @override
  set data(String data) {
    dataSet = Set<Map>.from(jsonDecode(data));
    fieldsList = List<String>.from(dataSet.first.keys);
  }

  @override
  String get data {
    if (!hasData) return '';

    JsonEncoder encoder = JsonEncoder.withIndent('\t');
    return encoder.convert(dataSet.toList());
  }

}
