
part of 'datas.dart';

class UnknownError {
  @override
  String toString() => "Unknown error occurred.";
}


class LoadDataError {
  @override
  String toString() => "Can't load data.";
}

class LoadDataErrorInvalidExtension extends LoadDataError {
  @override
  String toString() => "Can't load data, file extension is invalid.";
}

class LoadDataErrorFileNotFound extends LoadDataError {
  @override
  String toString() => "Can't load data, file not found.";
}


class SetDataError {
  @override
  String toString() => "Can't set data.";
}

class SetDataErrorFieldsRequired extends SetDataError {
  @override
  String toString() => "Can't set data, name of fields are required.";
}

class SetDataErrorInvalidFormat extends SetDataError {
  @override
  String toString() => "Can't set data, data format is invalid.";
}


class SaveFileError {
  @override
  String toString() => "Can't save file.";
}

class SaveFileErrorInvalidExtension extends SaveFileError {
  @override
  String toString() => "Can't save, file extension is invalid.";
}
