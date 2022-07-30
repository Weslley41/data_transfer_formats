import 'dart:convert';

import 'data.dart';

class JSONData extends Data {

  @override
  set data(String data) {
    dataSet = Set<Map>.from(jsonDecode(data));
    fields = List<String>.from(dataSet.first.keys);
  }

  @override
  String get data {
    if (!hasData) return '';

    JsonEncoder encoder = JsonEncoder.withIndent('\t');
    return encoder.convert(dataSet.toList());
  }

  @override
  set fields(List<String> fields) => fieldsList = fields;

}
