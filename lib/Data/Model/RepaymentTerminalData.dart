// To parse this JSON data, do
//
//     final repaymentTerminalData = repaymentTerminalDataFromMap(jsonString);

import 'dart:convert';

RepaymentTerminalData repaymentTerminalDataFromMap(String str) =>
    RepaymentTerminalData.fromMap(json.decode(str));

String repaymentTerminalDataToMap(RepaymentTerminalData data) =>
    json.encode(data.toMap());

class RepaymentTerminalData {
  dynamic status;
  dynamic message;
  List<Terminal>? terminals;

  RepaymentTerminalData({
    this.status,
    this.message,
    this.terminals,
  });

  factory RepaymentTerminalData.fromMap(Map<String, dynamic> json) =>
      RepaymentTerminalData(
        status: json["status"],
        message: json["message"],
        terminals: json["terminals"] == null
            ? []
            : List<Terminal>.from(
                json["terminals"]!.map((x) => Terminal.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "terminals": terminals == null
            ? []
            : List<dynamic>.from(terminals!.map((x) => x.toMap())),
      };
}

class Terminal {
  dynamic name;

  Terminal({
    this.name,
  });

  bool districtFilterByName(String filter) {
    return name.toString().toLowerCase().trim().contains(filter);
  }

  factory Terminal.fromMap(Map<String, dynamic> json) => Terminal(
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}
