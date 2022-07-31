part of 'datas.dart';

class XMLData extends Data {

  XMLData() : super(extensionFile: 'xml');

  @override
  set data(String data) {
    XmlDocument xmlData = XmlDocument.parse(data);
    final xmlElements = xmlData.rootElement.childElements;

    for (XmlElement row in xmlElements) {
      Map<String, dynamic> mapRow = {};
      for (XmlElement element in row.childElements) {
        mapRow[element.name.toString()] = element.innerText;
      }

      dataSet.add(mapRow);
      fieldsList = List<String>.from(dataSet.first.keys);
    }
  }

  @override
  String get data {
    if (!hasData) return '';

    XmlBuilder builder =  XmlBuilder();
    builder.processing('xml', 'version="1.0"');
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

}
