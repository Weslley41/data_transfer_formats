import 'package:data_transfer_formats/delimeted_data.dart';

class CSVData extends DelimetedData {
  CSVData() : super(separator: ',');

  @override
  set data(String data) {
    // TODO: implement data
  }

  @override
  set fields(List<String> fields) {
    // TODO: implement fields
  }

  @override
  void load(String fileName) {
    // TODO: implement load
  }

  @override
  void save(String fileName) {
    // TODO: implement save
  }

}
