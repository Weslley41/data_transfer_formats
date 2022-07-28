import 'package:data_transfer_formats/data.dart';

abstract class DelimetedData extends Data {

  final String _separator;

  DelimetedData({required separator}) : _separator = separator;

  String get separator => _separator;

}
