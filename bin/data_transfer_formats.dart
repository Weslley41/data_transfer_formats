
import 'package:data_transfer_formats/datas.dart';

void testDataClass(Data instance, String type) {
  const String pathToSave = 'examples_saves/example';
  const Map<String, String> inputFilesPath = {
    "ExampleSuccess": "examples/example",
    "ExampleExtensionInvalid": "examples/example.txt",
    "ExampleFormatInvalid": "examples/example_format_invalid",
    "ExampleEmpty": "examples/example_empty",
    "ExampleNotFound": "not/exists"
  };

  inputFilesPath.forEach((typeExample, filePath) {
    try {
      print('\n*Tests in ${type.toUpperCase()}Data*');
      print('Type example file: $typeExample\n');

      print('The object has data? ${instance.hasData}');
      print('Loading file...');
      if (typeExample == 'ExampleExtensionInvalid') {
        instance.load(filePath);
      } else {
        instance.load('$filePath.$type');
      }
      print('The object has data? ${instance.hasData}');
      print('\nData in object: ');
      print(instance.data);
      print('\nFields of object');
      print(instance.fields);
      print('\nSaving data on file...');
      instance.save('$pathToSave.$type');
      print('Saved in $pathToSave.$type');
      print('Cleaning up object instance...');
      instance.clear();
      print('The object has data? ${instance.hasData}');
    } catch (e) {
      print('An error occurred: $e');
      instance.clear();
    }
  });
}

void main() {

  CSVData csvData = CSVData();
  testDataClass(csvData, 'csv');

  TSVData tsvData = TSVData();
  testDataClass(tsvData, 'tsv');

  JSONData jsonData = JSONData();
  testDataClass(jsonData, 'json');

  XMLData xmlData = XMLData();
  testDataClass(xmlData, 'xml');

  print('\nDeveloped by:\nAntônio Ivo\nWeslley de Jesus');

}
