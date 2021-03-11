enum FieldRename { none, kebab, snake, pascal }

class JsonSerializable {
  final bool anyMap;
  final bool checked;
  final bool createFactory;
  final bool createToJson;
  final bool disallowUnrecognizedKeys;
  final bool explicitToJson;
  final FieldRename fieldRename;
  final bool genericArgumentFactories;
  final bool ignoreUnannotated;
  final bool includeIfNull;
  final bool nullable;

  const JsonSerializable({
    this.anyMap,
    this.checked,
    this.createFactory,
    this.createToJson,
    this.disallowUnrecognizedKeys,
    this.explicitToJson,
    this.fieldRename,
    this.ignoreUnannotated,
    this.includeIfNull,
    this.nullable,
    this.genericArgumentFactories,
  });
}

class JsonKey {
  final Object defaultValue;
  final bool disallowNullValue;
  final Function fromJson;
  final bool ignore;
  final bool includeIfNull;
  final String name;
  final bool nullable;
  final bool required;
  final Function toJson;
  final Object unknownEnumValue;

  const JsonKey({
    this.defaultValue,
    this.disallowNullValue,
    this.fromJson,
    this.ignore,
    this.includeIfNull,
    this.name,
    this.nullable,
    this.required,
    this.toJson,
    this.unknownEnumValue,
  });
}

class JsonValue {
  final dynamic value;
  const JsonValue(this.value);
}
