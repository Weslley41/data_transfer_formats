part of '../../datas.dart';

abstract class DelimitedData extends Data {

  final String _separator;

  DelimitedData({required separator, required extensionFile})
  : _separator = separator,
    super(extensionFile: extensionFile);

  String get separator => _separator;

  @override
  set data(String data) {
    if (data.isEmpty) throw SetDataErrorFieldsRequired();
    List<String> splitData = data.split('\n');

    for (int indexRow = 0; indexRow < splitData.length; indexRow++) {
      List<String> row = splitData[indexRow].replaceAll('"', '').split(separator);

      if (indexRow == 0) {
        if (row.isEmpty) {
          throw SetDataErrorFieldsRequired();
        }
        fieldsList = row;
        continue;
      }

      Map<String, dynamic> mapRow = {};
      for (int i = 0; i < fields.length; i++) {
        try {
          mapRow[fields[i]] = row[i];
        } on RangeError {
          throw SetDataErrorInvalidFormat();
        }
      }

      dataSet.add(mapRow);
    }
  }

  @override
  String get data {
    if (!hasData) return '';

    List<String> fieldsWithQuotes = fields.map((field) => '"$field"').toList();
    String dataString = fieldsWithQuotes.join(separator);

    for (Map row in dataSet) {
      List<dynamic> rowWithQuotes = row.values.map((value) =>
        num.tryParse(value) != null ? value : '"$value"'
      ).toList();

      dataString += "\n${rowWithQuotes.join(separator)}";
    }

    return dataString;
  }

}
