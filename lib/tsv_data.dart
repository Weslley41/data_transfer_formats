import 'package:data_transfer_formats/delimited_data.dart';

class TSVData extends DelimitedData {
  TSVData() : super(separator: '\t', extensionFile: 'tsv');
}
