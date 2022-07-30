import 'package:xml/xml.dart';

import 'package:data_transfer_formats/data.dart';

class XMLData extends Data {

  @override
  set data(String data) {
    XmlDocument xmlData = XmlDocument.parse(data);
    final xmlElements = xmlData.rootElement.childElements;
    List<String> xmlFields = [];

    for (var row in xmlElements) {
      Map<String, dynamic> mapRow = {};
      for (var element in row.childElements) {
        mapRow[element.name.toString()] = element.innerText;

        if (row == xmlElements.first) {
          xmlFields.add(element.name.toString());
        }
      }

      dataSet.add(mapRow);
      fields = xmlFields;
    }
  }

  @override
  String get data {
    XmlBuilder builder =  XmlBuilder();
    builder.processing('xml', 'version=1.0');
    builder.element('root', nest: () {
      for (var row in dataSet) {
        builder.element('row', nest: () {
          row.forEach((key, value) {
            builder.element(key, nest: value);
          });
        });
      }
    });

    return builder.buildDocument().toXmlString(pretty: true, indent: '\t');
  }

  @override
  set fields(List<String> fields) => fieldsList = fields;
}
