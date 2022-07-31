import 'dart:io';
import 'package:test/test.dart';
import 'package:data_transfer_formats/datas.dart';

void main() {
  const inputFileTest = 'examples/example.tsv';
  const outputFileTest = 'examples_saves/example.tsv';

  test('InitializeTSVDataClass', () {
    final tsvData = TSVData();
    expect(tsvData.data, '');
    expect(tsvData.fields, []);
  });

  test('TSVDataGetterSeparator', () {
    expect(TSVData().separator, '\t');
  });

  test('TSVDataHasDataFalse', () {
    expect(TSVData().hasData, false);
  });

  test('TSVDataLoadFile', () {
    final tsvData = TSVData();
    tsvData.load(inputFileTest);

    expect(tsvData.hasData, true);
  });

  test('TSVDataClearData', () {
    final tsvData = TSVData();
    tsvData.load(inputFileTest);
    tsvData.clear();

    expect(tsvData.hasData, false);
    expect(tsvData.fields, []);
  });

  test('TSVDataSaveDataInFile', () {
    final tsvData = TSVData();
    tsvData.load(inputFileTest);
    tsvData.save(outputFileTest);
    File inputFile = File(inputFileTest);
    File outputFile = File(outputFileTest);

    expect(inputFile.readAsStringSync(), outputFile.readAsStringSync());
  });
}
