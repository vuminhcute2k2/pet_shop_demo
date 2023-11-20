// ignore_for_file: no_leading_underscores_for_local_identifiers

class UserResponse {
  String? responseCode;
  String? message;
  Data? data;

  UserResponse({this.responseCode, this.message, this.data});

  UserResponse.fromJson(Map<String, dynamic> json) {
    responseCode = json["responseCode"];
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["responseCode"] = responseCode;
    _data["message"] = message;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }

  UserResponse copyWith({
    String? responseCode,
    String? message,
    Data? data,
  }) =>
      UserResponse(
        responseCode: responseCode ?? this.responseCode,
        message: message ?? this.message,
        data: data ?? this.data,
      );
}

class Data {
  String? username;
  String? password;
  bool? isMale;
  PartnerData? partnerData;

  Data({this.username, this.password, this.isMale, this.partnerData});

  Data.fromJson(Map<String, dynamic> json) {
    username = json["username"];
    password = json["password"];
    isMale = json["isMale"];
    partnerData = json["partnerData"] == null
        ? null
        : PartnerData.fromJson(json["partnerData"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["username"] = username;
    _data["password"] = password;
    _data["isMale"] = isMale;
    if (partnerData != null) {
      _data["partnerData"] = partnerData?.toJson();
    }
    return _data;
  }

  Data copyWith({
    String? username,
    String? password,
    bool? isMale,
    PartnerData? partnerData,
  }) =>
      Data(
        username: username ?? this.username,
        password: password ?? this.password,
        isMale: isMale ?? this.isMale,
        partnerData: partnerData ?? this.partnerData,
      );
}

class PartnerData {
  String? username;
  int? bondLevel;

  PartnerData({this.username, this.bondLevel});

  PartnerData.fromJson(Map<String, dynamic> json) {
    username = json["username"];
    bondLevel = json["bondLevel"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["username"] = username;
    _data["bondLevel"] = bondLevel;
    return _data;
  }

  PartnerData copyWith({
    String? username,
    int? bondLevel,
  }) =>
      PartnerData(
        username: username ?? this.username,
        bondLevel: bondLevel ?? this.bondLevel,
      );
}
