part of report_library;

class ReportModel {
  String id;
  String? refId;
  String name;
  String type;
  double reportLong;
  double reportLat;
  String reportDate;
  bool? isVisible;
  bool? isDeleted;
  String? email;
  String? address;
  String status;
  String? phone;
  String? comment;
  String? workingHours;
  String? moreInformation;
  List<String>? imageUrls;
  List<String>? officerImageUrls;
  List<HistoryData>? historyData;
  List<StatusRecords>? statusRecords;

  ReportModel({
    required this.id,
    required this.name,
    required this.type,
    required this.reportLong,
    required this.reportLat,
    required this.reportDate,
    required this.isVisible,
    this.email,
    this.address,
    required this.isDeleted,
    this.historyData,
    required this.refId,
    required this.status,
    this.phone,
    this.comment,
    this.workingHours,
    this.moreInformation,
    this.officerImageUrls,
    this.imageUrls,
    this.statusRecords,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
      id: json["_id"],
      refId: json["refId"],
      name: json["name"],
      type: json["type"],
      reportLong: json["reportLong"],
      reportLat: json["reportLat"],
      reportDate: json["reportDate"],
      isVisible: json["isVisible"],
      isDeleted: json["isDeleted"],
      email: json["email"],
      address: json["address"],
      status: json["status"],
      phone: json["phone"],
      comment: json["comment"],
      workingHours: json["workingHours"],
      moreInformation: json["moreInformation"],
      officerImageUrls: List<String>.from(json["officerImageUrls"].map((x) => x)),
      imageUrls: List<String>.from(json["imageUrls"].map((x) => x)),
      statusRecords: List<StatusRecords>.from(json["statusRecords"]
          .map((x) => StatusRecords.fromJson(x))).toList(),
      historyData: json['historyData']!=null?List<HistoryData>.from(json["historyData"]
          .map((x) => HistoryData.fromJson(x))).toList():[]
      );
}

class HistoryData {
  String? user;
  String? date;
  List<Edits>? edits;

  HistoryData({
    this.user,
    this.date,
    this.edits,
  });

  factory HistoryData.fromJson(Map<String, dynamic> json) =>
      HistoryData(user: json["user"], date: json["date"],
          edits: List<Edits>.from(json["edits"]
          .map((x) => Edits.fromJson(x))).toList()
          );
}

class Edits {
  String? field;
  String? change;

  Edits({
    this.field,
    this.change,
  });

  factory Edits.fromJson(Map<String, dynamic> json) => Edits(
        field: json["field"],
        change: json["change"],
      );
}

class StatusRecords {
  String? status;
  String? date;

  StatusRecords({
    this.status,
    this.date,
  });

  factory StatusRecords.fromJson(Map<String, dynamic> json) => StatusRecords(
    status: json["status"],
    date: json["date"],
  );
}