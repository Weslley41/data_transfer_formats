import 'package:data_transfer_formats/csv_data.dart';

void main() {
  CSVData csvData = CSVData();

  csvData.load('examples/example.csv');
  print("*data fields*");
  print(csvData.fields);
  print("*data content*");
  print(csvData.data);

  /*
  csvData.clear();
  print("\n*clear data*");
  print(csvData.fields);
  print(csvData.data);
  */

  csvData.save('examples_saves/example.csv');
}
