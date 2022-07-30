import 'dart:io';
import 'package:test/test.dart';

import 'package:data_transfer_formats/xml_data.dart';

void main() {
  const inputFileTest = 'examples/example.xml';
  const outputFileTest = 'examples_saves/example.xml';

  test('InitializexmlDataClass', () {
    final xmlData = XMLData();
    expect(xmlData.data, '');
    expect(xmlData.fields, []);
  });

  test('xmlDataHasDataFalse', () {
    final xmlData = XMLData();
    expect(xmlData.hasData, false);
  });

  test('xmlDataLoadFile', () {
    final xmlData = XMLData();
    xmlData.load(inputFileTest);

    expect(xmlData.hasData, true);
    expect(xmlData.fields, ['id', 'name', 'sex', 'age', 'height']);
  });

  test('xmlDataClearData', () {
    final xmlData = XMLData();
    xmlData.load(inputFileTest);
    xmlData.clear();

    expect(xmlData.hasData, false);
    expect(xmlData.fields, []);
  });

  test('xmlDataSaveDataInFile', () {
    final xmlData = XMLData();
    xmlData.load(inputFileTest);
    xmlData.save(outputFileTest);
    int inputFile = File(inputFileTest).readAsLinesSync().length;
    int outputFile = File(outputFileTest).readAsLinesSync().length;

    expect(inputFile, outputFile);
  });
}
