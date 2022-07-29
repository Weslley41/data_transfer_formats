import 'dart:io';
import 'package:test/test.dart';

import 'package:data_transfer_formats/csv_data.dart';

void main() {
  const inputFileTest = 'examples/example.csv';
  const outputFileTest = 'examples_saves/example.csv';

  test('InitializeCSVDataClass', () {
    final csvData = CSVData();
    expect(csvData.data, '');
    expect(csvData.fields, []);
  });

  test('CSVDataGetterSeparator', () {
    expect(CSVData().separator, ',');
  });

  test('CSVDataHasDataFalse', () {
    expect(CSVData().hasData, false);
  });

  test('CSVDataLoadFile', () {
    final csvData = CSVData();
    csvData.load(inputFileTest);

    expect(csvData.hasData, true);
  });

  test('CSVDataClearData', () {
    final csvData = CSVData();
    csvData.load(inputFileTest);
    csvData.clear();

    expect(csvData.hasData, false);
    expect(csvData.fields, []);
  });

  test('CSVDataSaveDataInFile', () {
    final csvData = CSVData();
    csvData.load(inputFileTest);
    csvData.save(outputFileTest);
    File outputFile = File(outputFileTest);

    expect(csvData.data, outputFile.readAsStringSync());
  });
}
