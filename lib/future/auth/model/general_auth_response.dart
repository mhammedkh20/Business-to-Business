class GeneralAuthResponse<T> {
  bool? status;
  int? code;
  String? message;
  Map<String, dynamic>? data;

  GeneralAuthResponse({this.status, this.code, this.message, this.data});

  GeneralAuthResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data = json['data'];
  }
}
