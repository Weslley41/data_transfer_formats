// import 'package:data_transfer_formats/csv_data.dart';
// import 'package:data_transfer_formats/xml_data.dart';
import 'package:data_transfer_formats/json_data.dart';

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
  jsonData.load('examples/example.json');
  jsonData.save('examples_saves/example.json');
  print(jsonData.fields);

}
