// import 'dart:convert';

// RegistrationModel registrationModelFromMap(String str) =>
//     RegistrationModel.fromMap(json.decode(str));

// String registrationModelToMap(RegistrationModel data) =>
//     json.encode(data.toMap());

// class RegistrationModel {
//   RegistrationModel({
//     this.status,
//     this.msg,
//   });

//   String status;
//   String msg;

//   factory RegistrationModel.fromMap(Map<String, dynamic> json) =>
//       RegistrationModel(
//         status: json["status"] == null ? null : json["status"],
//         msg: json["msg"] == null ? null : json["msg"],
//       );

//   Map<String, dynamic> toMap() => {
//         "status": status == null ? null : status,
//         "msg": msg == null ? null : msg,
//       };
// }


import 'dart:convert';

RegistrationModel registrationModelFromMap(String str) => RegistrationModel.fromMap(json.decode(str));

String registrationModelToMap(RegistrationModel data) => json.encode(data.toMap());

class RegistrationModel {
    RegistrationModel({
        this.status,
        this.msg,
    });

    int status;
    String msg;

    factory RegistrationModel.fromMap(Map<String, dynamic> json) => RegistrationModel(
        status: json["status"] == null ? null : json["status"],
        msg: json["msg"] == null ? null : json["msg"],
    );

    Map<String, dynamic> toMap() => {
        "status": status == null ? null : status,
        "msg": msg == null ? null : msg,
    };
}
