//
// !! DO NOT EDIT
//
// This file was generated from https://github.com/dart-lang/test/blob/3c3891633641e70269534aac54f4ab370266b68d/pkgs/test/doc/json_reporter.schema.json
// Using http://quicktype.io
//
// @dart=2.7
// ignore_for_file: prefer_single_quotes, prefer_if_null_operators, prefer_conditional_assignment

import 'dart:convert';

class DartTestResultClass {
  DartTestResultClass({
    this.time,
    this.type,
    this.pid,
    this.protocolVersion,
    this.runnerVersion,
    this.test,
    this.count,
    this.suite,
    this.observatory,
    this.remoteDebugger,
    this.suiteId,
    this.group,
    this.message,
    this.messageType,
    this.testId,
    this.error,
    this.isFailure,
    this.stackTrace,
    this.hidden,
    this.result,
    this.skipped,
    this.success,
  });

  int time;
  String type;
  int pid;
  String protocolVersion;
  String runnerVersion;
  TestClass test;
  int count;
  SuiteClass suite;
  String observatory;
  String remoteDebugger;
  int suiteId;
  GroupClass group;
  String message;
  MessageType messageType;
  int testId;
  String error;
  bool isFailure;
  String stackTrace;
  bool hidden;
  Result result;
  bool skipped;
  bool success;

  factory DartTestResultClass.fromRawJson(String str) =>
      DartTestResultClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DartTestResultClass.fromJson(Map<String, dynamic> json) =>
      DartTestResultClass(
        time: json["time"],
        type: json["type"],
        // ignore:
        pid: json["pid"] == null ? null : json["pid"],
        protocolVersion:
            json["protocolVersion"] == null ? null : json["protocolVersion"],
        runnerVersion:
            json["runnerVersion"] == null ? null : json["runnerVersion"],
        test: json["test"] == null ? null : TestClass.fromJson(json["test"]),
        count: json["count"] == null ? null : json["count"],
        suite:
            json["suite"] == null ? null : SuiteClass.fromJson(json["suite"]),
        observatory: json["observatory"] == null ? null : json["observatory"],
        remoteDebugger:
            json["remoteDebugger"] == null ? null : json["remoteDebugger"],
        suiteId: json["suiteID"] == null ? null : json["suiteID"],
        group:
            json["group"] == null ? null : GroupClass.fromJson(json["group"]),
        message: json["message"] == null ? null : json["message"],
        messageType: json["messageType"] == null
            ? null
            : messageTypeValues.map[json["messageType"]],
        testId: json["testID"] == null ? null : json["testID"],
        error: json["error"] == null ? null : json["error"],
        isFailure: json["isFailure"] == null ? null : json["isFailure"],
        stackTrace: json["stackTrace"] == null ? null : json["stackTrace"],
        hidden: json["hidden"] == null ? null : json["hidden"],
        result:
            json["result"] == null ? null : resultValues.map[json["result"]],
        skipped: json["skipped"] == null ? null : json["skipped"],
        success: json["success"] == null ? null : json["success"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "type": type,
        "pid": pid == null ? null : pid,
        "protocolVersion": protocolVersion == null ? null : protocolVersion,
        "runnerVersion": runnerVersion == null ? null : runnerVersion,
        "test": test,
        "count": count == null ? null : count,
        "suite": suite,
        "observatory": observatory == null ? null : observatory,
        "remoteDebugger": remoteDebugger == null ? null : remoteDebugger,
        "suiteID": suiteId == null ? null : suiteId,
        "group": group,
        "message": message == null ? null : message,
        "messageType":
            messageType == null ? null : messageTypeValues.reverse[messageType],
        "testID": testId == null ? null : testId,
        "error": error == null ? null : error,
        "isFailure": isFailure == null ? null : isFailure,
        "stackTrace": stackTrace == null ? null : stackTrace,
        "hidden": hidden == null ? null : hidden,
        "result": result == null ? null : resultValues.reverse[result],
        "skipped": skipped == null ? null : skipped,
        "success": success == null ? null : success,
      };
}

class GroupClass {
  GroupClass({
    this.name,
    this.parentId,
    this.testCount,
    this.id,
    this.metadata,
    this.suiteId,
    this.line,
    this.column,
    this.url,
  });

  String name;
  int parentId;
  int testCount;
  int id;
  MetadataClass metadata;
  int suiteId;
  int line;
  int column;
  String url;

  factory GroupClass.fromRawJson(String str) =>
      GroupClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GroupClass.fromJson(Map<String, dynamic> json) => GroupClass(
        name: json["name"] == null ? null : json["name"],
        parentId: json["parentID"] == null ? null : json["parentID"],
        testCount: json["testCount"] == null ? null : json["testCount"],
        id: json["id"],
        metadata: json["metadata"] == null
            ? null
            : MetadataClass.fromJson(json["metadata"]),
        suiteId: json["suiteID"],
        line: json["line"] == null ? null : json["line"],
        column: json["column"] == null ? null : json["column"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "parentID": parentId == null ? null : parentId,
        "testCount": testCount == null ? null : testCount,
        "id": id,
        "metadata": metadata,
        "suiteID": suiteId,
        "line": line == null ? null : line,
        "column": column == null ? null : column,
        "url": url == null ? null : url,
      };
}

class MetadataClass {
  MetadataClass({
    this.skip,
    this.skipReason,
  });

  bool skip;
  String skipReason;

  factory MetadataClass.fromRawJson(String str) =>
      MetadataClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MetadataClass.fromJson(Map<String, dynamic> json) => MetadataClass(
        skip: json["skip"],
        skipReason: json["skipReason"] == null ? null : json["skipReason"],
      );

  Map<String, dynamic> toJson() => {
        "skip": skip,
        "skipReason": skipReason == null ? null : skipReason,
      };
}

enum MessageType { PRINT, SKIP }

final messageTypeValues =
    EnumValues({"print": MessageType.PRINT, "skip": MessageType.SKIP});

enum Result { SUCCESS, FAILURE, ERROR }

final resultValues = EnumValues({
  "error": Result.ERROR,
  "failure": Result.FAILURE,
  "success": Result.SUCCESS
});

class SuiteClass {
  SuiteClass({
    this.id,
    this.path,
    this.platform,
  });

  int id;
  String path;
  String platform;

  factory SuiteClass.fromRawJson(String str) =>
      SuiteClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SuiteClass.fromJson(Map<String, dynamic> json) => SuiteClass(
        id: json["id"],
        path: json["path"],
        platform: json["platform"] == null ? null : json["platform"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "path": path,
        "platform": platform == null ? null : platform,
      };
}

class TestClass {
  TestClass({
    this.groupIDs,
    this.name,
    this.id,
    this.metadata,
    this.suiteId,
    this.line,
    this.column,
    this.url,
  });

  List<int> groupIDs;
  String name;
  int id;
  MetadataClass metadata;
  int suiteId;
  int line;
  int column;
  String url;

  factory TestClass.fromRawJson(String str) =>
      TestClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TestClass.fromJson(Map<String, dynamic> json) => TestClass(
        groupIDs: List<int>.from(json["groupIDs"].map((x) => x)),
        name: json["name"],
        id: json["id"],
        metadata: json["metadata"] == null
            ? null
            : MetadataClass.fromJson(json["metadata"]),
        suiteId: json["suiteID"],
        line: json["line"] == null ? null : json["line"],
        column: json["column"] == null ? null : json["column"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "groupIDs": List<dynamic>.from(groupIDs.map((x) => x)),
        "name": name,
        "id": id,
        "metadata": metadata,
        "suiteID": suiteId,
        "line": line == null ? null : line,
        "column": column == null ? null : column,
        "url": url == null ? null : url,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
