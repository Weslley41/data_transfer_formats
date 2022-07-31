import 'dart:io';
import 'package:test/test.dart';
import 'package:data_transfer_formats/datas.dart';

void main() {
  const inputFileTest = 'examples/example.json';
  const outputFileTest = 'examples_saves/example.json';

  test('InitializeJSONDataClass', () {
    final jsonData = JSONData();
    expect(jsonData.data, '');
    expect(jsonData.fields, []);
  });

  test('JSONDataHasDataFalse', () {
    final jsonData = JSONData();
    expect(jsonData.hasData, false);
  });

  test('JSONDataLoadFile', () {
    final jsonData = JSONData();
    jsonData.load(inputFileTest);

    expect(jsonData.hasData, true);
    expect(jsonData.fields,  ['id', 'name', 'sex', 'age', 'height']);
  });

  test('JSONDataClearData', () {
    final jsonData = JSONData();
    jsonData.load(inputFileTest);
    expect(jsonData.hasData, true);
    jsonData.clear();

    expect(jsonData.hasData, false);
    expect(jsonData.fields, []);
  });

  test('JSONDataSaveDataInFile', () {
    final jsonData = JSONData();
    jsonData.load(inputFileTest);
    jsonData.save(outputFileTest);
    File inputFile = File(inputFileTest);
    File outputFile = File(outputFileTest);

    expect(outputFile.readAsStringSync(), inputFile.readAsStringSync());
  });
}
