
import 'package:data_transfer_formats/datas.dart';

void main() {
  /*
  CSVData csvData = CSVData();

  csvData.load('examples/example.csv');
  print("*data fields*");
  print(csvData.fields);
  print("*data content*");
  print(csvData.data);

  csvData.clear();
  print("\n*clear data*");
  print(csvData.fields);
  print(csvData.data);

  csvData.save('examples_saves/example.csv');
  */

  /* 
  XMLData xmlData = XMLData();
  xmlData.load('examples/example.xml');
  print(xmlData.data);
  print("*xml fields*");
  print(xmlData.fields);
   */

  JSONData jsonData = JSONData();
  try {
    jsonData.load('examples/example.json');
  } catch (e) {
    print(e);
  }
  jsonData.save('examples_saves/example.json');
  // print(jsonData.fields);

}
