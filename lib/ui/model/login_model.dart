import 'dart:convert';

LoginModel loginModelFromMap(String str) => LoginModel.fromMap(json.decode(str));

String loginModelToMap(LoginModel data) => json.encode(data.toMap());

class LoginModel {
    LoginModel({
        this.status,
        this.msg,
        this.error,
        this.data,
        this.httpResponse,
    });

    int status;
    String msg;
    String error;
    dynamic data;
    String httpResponse;

    factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
        status: json["status"] == null ? null : json["status"],
        msg: json["msg"] == null ? null : json["msg"],
        error: json["error"] == null ? null : json["error"],
        data: json["data"] == null ? null : json["data"],
        httpResponse: json["HTTP_Response"] == null ? null : json["HTTP_Response"],
    );

    Map<String, dynamic> toMap() => {
        "status": status == null ? null : status,
        "msg": msg == null ? null : msg,
        "error": error == null ? null : error,
        "data": data == null ? null : data,
        "HTTP_Response": httpResponse == null ? null : httpResponse,
    };
}

// import 'dart:convert';

// LoginModel loginModelFromMap(String str) => LoginModel.fromMap(json.decode(str));

// // String loginModelToMap(LoginModel data) => json.encode(data.toMap());

// class LoginModel {
//     LoginModel({
//         this.status,
//         this.msg,
//         this.customerDetails,
//     });

//     dynamic status;
//     String msg;
//     dynamic customerDetails;

//     factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
//         status: json["status"] == null ? null : json["status"],
//         msg: json["msg"] == null ? null : json["msg"],
//         customerDetails: json["customerDetails"] == null ? null :json["customerDetails"],
//     );

//     // Map<String, dynamic> toMap() => {
//     //     "status": status == null ? null : status,
//     //     "msg": msg == null ? null : msg,
//     //     "customerDetails": customerDetails == null ? null : customerDetails.toMap(),
//     // };
// }

