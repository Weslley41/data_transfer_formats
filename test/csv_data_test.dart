import 'package:test/test.dart';

import 'package:data_transfer_formats/csv_data.dart';

void main() {
  test('InitializeCSVDataClass', () {
    final csvDataClass = CSVData();
    expect(csvDataClass.data, '');
    expect(csvDataClass.fields, []);
  });

  test('CSVDataGetterSeparator', () {
    expect(CSVData().separator, ',');
  });

  test('CSVDataHasDataFalse', () {
    expect(CSVData().hasData, false);
  });
}
