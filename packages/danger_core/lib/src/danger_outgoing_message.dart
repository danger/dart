// To parse this JSON data, do
//
//     final dangerOutgoingMessages = dangerOutgoingMessagesFromJson(jsonString);

import 'dart:convert';

/**
 * The representation of what running a Dangerfile generates.
 * This needs to be passed between processes, so data only please.
 */
class DangerOutgoingMessages {
    DangerOutgoingMessages({
        this.fails,
        this.markdowns,
        this.messages,
        this.meta,
        this.warnings,
    });

    List<Violation> fails;
    List<Violation> markdowns;
    List<Violation> messages;
    Meta meta;
    List<Violation> warnings;

    factory DangerOutgoingMessages.fromRawJson(String str) => DangerOutgoingMessages.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DangerOutgoingMessages.fromJson(Map<String, dynamic> json) => DangerOutgoingMessages(
        fails: json["fails"] == null ? null : List<Violation>.from(json["fails"].map((x) => Violation.fromJson(x))),
        markdowns: json["markdowns"] == null ? null : List<Violation>.from(json["markdowns"].map((x) => Violation.fromJson(x))),
        messages: json["messages"] == null ? null : List<Violation>.from(json["messages"].map((x) => Violation.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        warnings: json["warnings"] == null ? null : List<Violation>.from(json["warnings"].map((x) => Violation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "fails": fails == null ? null : List<dynamic>.from(fails.map((x) => x.toJson())),
        "markdowns": markdowns == null ? null : List<dynamic>.from(markdowns.map((x) => x.toJson())),
        "messages": messages == null ? null : List<dynamic>.from(messages.map((x) => x.toJson())),
        "meta": meta == null ? null : meta.toJson(),
        "warnings": warnings == null ? null : List<dynamic>.from(warnings.map((x) => x.toJson())),
    };
}

/**
 * The result of user doing warn, message or fail, built this way for
 * expansion later.
 */
class Violation {
    Violation({
        this.file,
        this.icon,
        this.line,
        this.message,
    });

    String file;
    String icon;
    double line;
    String message;

    factory Violation.fromRawJson(String str) => Violation.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Violation.fromJson(Map<String, dynamic> json) => Violation(
        file: json["file"] == null ? null : json["file"],
        icon: json["icon"] == null ? null : json["icon"],
        line: json["line"] == null ? null : json["line"].toDouble(),
        message: json["message"] == null ? null : json["message"],
    );

    Map<String, dynamic> toJson() => {
        "file": file == null ? null : file,
        "icon": icon == null ? null : icon,
        "line": line == null ? null : line,
        "message": message == null ? null : message,
    };
}

/**
 * Meta information about the runtime evaluation
 */
class Meta {
    Meta({
        this.runtimeHref,
        this.runtimeName,
    });

    String runtimeHref;
    String runtimeName;

    factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        runtimeHref: json["runtimeHref"] == null ? null : json["runtimeHref"],
        runtimeName: json["runtimeName"] == null ? null : json["runtimeName"],
    );

    Map<String, dynamic> toJson() => {
        "runtimeHref": runtimeHref == null ? null : runtimeHref,
        "runtimeName": runtimeName == null ? null : runtimeName,
    };
}
