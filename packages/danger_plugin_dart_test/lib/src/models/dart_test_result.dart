// This file was created from https://github.com/dart-lang/test/blob/3c3891633641e70269534aac54f4ab370266b68d/pkgs/test/doc/json_reporter.schema.json
// Using http://quicktype.io

import 'dart:convert';

abstract class DartTestEvent {
  // The type of the event.
  //
  // This is always one of the subclass types listed below.
  final String type;

  // The time (in milliseconds) that has elapsed since the test runner started.
  final int time;

  DartTestEvent._(this.type, this.time);

  static DartTestEvent? fromJsonString(String jsonString) {
    final json = jsonDecode(jsonString);
    if (json == null || json['type'] == null || json['time'] == null) {
      return null;
    }

    final type = json['type'];
    switch (type) {
      case DartTestStartEvent.thisType:
        return DartTestStartEvent.fromJson(json);

      case DartTestAllSuitesEvent.thisType:
        return DartTestAllSuitesEvent.fromJson(json);

      case DartTestSuiteEvent.thisType:
        return DartTestSuiteEvent.fromJson(json);

      case DartTestDebugEvent.thisType:
        return DartTestDebugEvent.fromJson(json);

      case DartTestGroupEvent.thisType:
        return DartTestGroupEvent.fromJson(json);

      case DartTestTestStartEvent.thisType:
        return DartTestTestStartEvent.fromJson(json);

      case DartTestMessageEvent.thisType:
        return DartTestMessageEvent.fromJson(json);

      case DartTestErrorEvent.thisType:
        return DartTestErrorEvent.fromJson(json);

      case DartTestTestDoneEvent.thisType:
        return DartTestTestDoneEvent.fromJson(json);

      case DartTestDoneEvent.thisType:
        return DartTestDoneEvent.fromJson(json);

      default:
        return null;
    }
  }
}

class DartTestStartEvent extends DartTestEvent {
  static const thisType = "start";

  // The version of the JSON reporter protocol being used.
  //
  // This is a semantic version, but it reflects only the version of the
  // protocol—it's not identical to the version of the test runner itself.
  final String protocolVersion;

  // The version of the test runner being used.
  //
  // This is null if for some reason the version couldn't be loaded.
  final String? runnerVersion;

  // The pid of the VM process running the tests.
  final int pid;

  DartTestStartEvent(
      {required this.protocolVersion,
      this.runnerVersion,
      required this.pid,
      required String type,
      required int time})
      : super._(type, time);

  factory DartTestStartEvent.fromJson(Map<String, dynamic> json) =>
      DartTestStartEvent(
        protocolVersion: json["protocolVersion"],
        runnerVersion: json["runnerVersion"],
        pid: json["pid"],
        type: json["type"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "protocolVersion": protocolVersion,
        "runnerVersion": runnerVersion,
        "pid": pid,
        "type": type,
        "time": time,
      };
}

class DartTestAllSuitesEvent extends DartTestEvent {
  static const thisType = "allSuites";

  /// The total number of suites that will be loaded.
  final int count;

  DartTestAllSuitesEvent(
      {required this.count, required String type, required int time})
      : super._(type, time);

  factory DartTestAllSuitesEvent.fromJson(Map<String, dynamic> json) =>
      DartTestAllSuitesEvent(
        count: json["count"],
        type: json["type"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "type": type,
        "time": time,
      };
}

class DartTestSuiteEvent extends DartTestEvent {
  static const thisType = "suite";

  /// Metadata about the suite.
  final DartTestEntitySuite suite;

  DartTestSuiteEvent(
      {required this.suite, required String type, required int time})
      : super._(type, time);

  factory DartTestSuiteEvent.fromJson(Map<String, dynamic> json) =>
      DartTestSuiteEvent(
        suite: DartTestEntitySuite.fromJson(json["suite"]),
        type: json["type"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "test": suite.toJson(),
        "type": type,
        "time": time,
      };
}

class DartTestDebugEvent extends DartTestEvent {
  static const thisType = "debug";

  /// The suite for which debug information is reported.
  final int suiteID;

  /// The HTTP URL for the Dart Observatory, or `null` if the Observatory isn't
  /// available for this suite.
  final String? observatory;

  /// The HTTP URL for the remote debugger for this suite's host page, or `null`
  /// if no remote debugger is available for this suite.
  final String? remoteDebugger;

  DartTestDebugEvent(
      {required this.suiteID,
      this.observatory,
      this.remoteDebugger,
      required String type,
      required int time})
      : super._(type, time);

  factory DartTestDebugEvent.fromJson(Map<String, dynamic> json) =>
      DartTestDebugEvent(
        suiteID: json["suiteID"],
        observatory: json["observatory"],
        remoteDebugger: json["remoteDebugger"],
        type: json["type"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "suiteID": suiteID,
        "remoteDebugger": remoteDebugger,
        "observatory": observatory,
        "type": type,
        "time": time,
      };
}

class DartTestGroupEvent extends DartTestEvent {
  static const thisType = "group";

  /// Metadata about the group.
  final DartTestEntityGroup group;

  DartTestGroupEvent(
      {required this.group, required String type, required int time})
      : super._(type, time);

  factory DartTestGroupEvent.fromJson(Map<String, dynamic> json) =>
      DartTestGroupEvent(
        group: DartTestEntityGroup.fromJson(json["group"]),
        type: json["type"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "group": group.toJson(),
        "type": type,
        "time": time,
      };
}

class DartTestTestStartEvent extends DartTestEvent {
  static const thisType = "testStart";

  // Metadata about the test that started.
  final DartTestEntityTest test;

  DartTestTestStartEvent(
      {required this.test, required String type, required int time})
      : super._(type, time);

  factory DartTestTestStartEvent.fromJson(Map<String, dynamic> json) =>
      DartTestTestStartEvent(
        test: DartTestEntityTest.fromJson(json["test"]),
        type: json["type"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "test": test.toJson(),
        "type": type,
        "time": time,
      };
}

class DartTestMessageEvent extends DartTestEvent {
  static const thisType = "print";

  // The ID of the test that printed a message.
  final int testID;

  // The type of message being printed.
  final String messageType;

  // The message that was printed.
  final String message;

  DartTestMessageEvent(
      {required this.testID,
      required this.messageType,
      required this.message,
      required String type,
      required int time})
      : super._(type, time);

  factory DartTestMessageEvent.fromJson(Map<String, dynamic> json) =>
      DartTestMessageEvent(
        testID: json["testID"],
        messageType: json["messageType"],
        message: json["message"],
        type: json["type"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "testID": testID,
        "messageType": messageType,
        "message": message,
        "type": type,
        "time": time,
      };
}

class DartTestErrorEvent extends DartTestEvent {
  static const thisType = "error";

  // The ID of the test that experienced the error.
  final int testID;

  // The result of calling toString() on the error object.
  final String error;

  // The error's stack trace, in the stack_trace package format.
  final String stackTrace;

  // Whether the error was a TestFailure.
  final bool isFailure;

  DartTestErrorEvent(
      {required this.testID,
      required this.error,
      required this.stackTrace,
      required this.isFailure,
      required String type,
      required int time})
      : super._(type, time);

  factory DartTestErrorEvent.fromJson(Map<String, dynamic> json) =>
      DartTestErrorEvent(
        testID: json["testID"],
        error: json["error"],
        stackTrace: json["stackTrace"],
        isFailure: json["isFailure"],
        type: json["type"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "testID": testID,
        "error": error,
        "stackTrace": stackTrace,
        "isFailure": isFailure,
        "type": type,
        "time": time,
      };
}

class DartTestTestDoneEvent extends DartTestEvent {
  static const thisType = "testDone";

  // The ID of the test that completed.
  final int testID;

  // The result of the test.
  final String result;

  // Whether the test's result should be hidden.
  final bool hidden;

  // Whether the test (or some part of it) was skipped.
  final bool skipped;

  DartTestTestDoneEvent(
      {required this.testID,
      required this.result,
      required this.hidden,
      required this.skipped,
      required String type,
      required int time})
      : super._(type, time);

  factory DartTestTestDoneEvent.fromJson(Map<String, dynamic> json) =>
      DartTestTestDoneEvent(
        testID: json["testID"],
        result: json["result"],
        hidden: json["hidden"],
        skipped: json["skipped"],
        type: json["type"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "testID": testID,
        "result": result,
        "hidden": hidden,
        "skipped": skipped,
        "type": type,
        "time": time,
      };
}

class DartTestDoneEvent extends DartTestEvent {
  static const thisType = "done";

  // Whether all tests succeeded (or were skipped).
  //
  // Will be `null` if the test runner was close before all tests completed
  // running.
  bool? success;

  DartTestDoneEvent({this.success, required String type, required int time})
      : super._(type, time);

  factory DartTestDoneEvent.fromJson(Map<String, dynamic> json) =>
      DartTestDoneEvent(
        success: json["success"],
        type: json["type"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "type": type,
        "time": time,
      };
}

class DartTestEntityTest {
  // An opaque ID for the test.
  final int id;

  // The name of the test, including prefixes from any containing groups.
  final String name;

  // The ID of the suite containing this test.
  final int suiteID;

  // The IDs of groups containing this test, in order from outermost to
  // innermost.
  final List<int> groupIDs;

  // The (1-based) line on which the test was defined, or `null`.
  final int? line;

  // The (1-based) column on which the test was defined, or `null`.
  final int? column;

  // The URL for the file in which the test was defined, or `null`.
  final String? url;

  // The (1-based) line in the original test suite from which the test
  // originated.
  //
  // Will only be present if `root_url` is different from `url`.
  final int? rootLine;

  // The (1-based) line on in the original test suite from which the test
  // originated.
  //
  // Will only be present if `root_url` is different from `url`.
  final int? rootColumn;

  // The URL for the original test suite in which the test was defined.
  //
  // Will only be present if different from `url`.
  final String? rootUrl;

  // This field is deprecated and should not be used.
  final DartTestEntityMetadata metadata;

  DartTestEntityTest(
      {required this.id,
      required this.name,
      required this.suiteID,
      required this.groupIDs,
      this.line,
      this.column,
      this.url,
      this.rootLine,
      this.rootColumn,
      this.rootUrl,
      required this.metadata});

  factory DartTestEntityTest.fromJson(Map<String, dynamic> json) =>
      DartTestEntityTest(
        groupIDs: List<int>.from(json["groupIDs"].map((x) => x)),
        name: json["name"],
        id: json["id"],
        metadata: DartTestEntityMetadata.fromJson(json["metadata"]),
        suiteID: json["suiteID"],
        line: json["line"],
        column: json["column"],
        url: json["url"],
        rootLine: json["root_line"],
        rootColumn: json["root_column"],
        rootUrl: json["root_url"],
      );

  Map<String, dynamic> toJson() => {
        "groupIDs": List<dynamic>.from(groupIDs.map((x) => x)),
        "name": name,
        "id": id,
        "metadata": metadata.toJson(),
        "suiteID": suiteID,
        "line": line,
        "column": column,
        "url": url,
      };
}

class DartTestEntitySuite {
  // An opaque ID for the group.
  final int id;

  // The platform on which the suite is running.
  final String platform;

  // The path to the suite's file, or `null` if that path is unknown.
  final String? path;

  DartTestEntitySuite({required this.id, required this.platform, this.path});

  factory DartTestEntitySuite.fromJson(Map<String, dynamic> json) =>
      DartTestEntitySuite(
        id: json["id"],
        path: json["path"],
        platform: json["platform"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "path": path,
        "platform": platform,
      };
}

class DartTestEntityGroup {
  // An opaque ID for the group.
  final int id;

  // The name of the group, including prefixes from any containing groups.
  final String name;

  // The ID of the suite containing this group.
  final int suiteID;

  // The ID of the group's parent group, unless it's the root group.
  final int? parentID;

  // The number of tests (recursively) within this group.
  final int testCount;

  // The (1-based) line on which the group was defined, or `null`.
  final int? line;

  // The (1-based) column on which the group was defined, or `null`.
  final int? column;

  // The URL for the file in which the group was defined, or `null`.
  final String? url;

  // This field is deprecated and should not be used.
  final DartTestEntityMetadata metadata;

  DartTestEntityGroup(
      {required this.id,
      required this.name,
      required this.suiteID,
      this.parentID,
      required this.testCount,
      this.line,
      this.column,
      this.url,
      required this.metadata});

  factory DartTestEntityGroup.fromJson(Map<String, dynamic> json) =>
      DartTestEntityGroup(
        name: json["name"],
        parentID: json["parentID"],
        testCount: json["testCount"],
        id: json["id"],
        metadata: DartTestEntityMetadata.fromJson(json["metadata"]),
        suiteID: json["suiteID"],
        line: json["line"],
        column: json["column"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "parentID": parentID,
        "testCount": testCount,
        "id": id,
        "metadata": metadata.toJson(),
        "suiteID": parentID,
        "line": line,
        "column": column,
        "url": url,
      };
}

class DartTestEntityMetadata {
  final bool skip;

  // The reason the tests was skipped, or `null` if it wasn't skipped.
  final String? skipReason;

  DartTestEntityMetadata({required this.skip, this.skipReason});

  factory DartTestEntityMetadata.fromJson(Map<String, dynamic> json) =>
      DartTestEntityMetadata(
        skip: json["skip"],
        skipReason: json["skipReason"],
      );

  Map<String, dynamic> toJson() => {
        "skip": skip,
        "skipReason": skipReason,
      };
}
