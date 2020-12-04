// To parse this JSON data, do
//
//     final multirest = multirestFromJson(jsonString);

import 'dart:convert';

Multirest multirestFromJson(String str) => Multirest.fromJson(json.decode(str));

String multirestToJson(Multirest data) => json.encode(data.toJson());

class Multirest {
    Multirest({
        this.status,
        this.msg,
        this.data,
    });

    int status;
    String msg;
    List<Datum> data;

    factory Multirest.fromJson(Map<String, dynamic> json) => Multirest(
        status: json["status"] == null ? null : json["status"],
        msg: json["msg"] == null ? null : json["msg"],
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "msg": msg == null ? null : msg,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.restaurentAddress,
        this.branchName,
        this.appKey,
        this.isDelivery,
        this.isCollection,
        this.msg,
        this.distance,
    });

    RestaurentAddress restaurentAddress;
    String branchName;
    String appKey;
    int isDelivery;
    int isCollection;
    String msg;
    String distance;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        restaurentAddress: json["restaurent_address"] == null ? null : RestaurentAddress.fromJson(json["restaurent_address"]),
        branchName: json["branch_name"] == null ? null : json["branch_name"],
        appKey: json["app_key"] == null ? null : json["app_key"],
        isDelivery: json["is_delivery"] == null ? null : json["is_delivery"],
        isCollection: json["is_collection"] == null ? null : json["is_collection"],
        msg: json["msg"] == null ? null : json["msg"],
        distance: json["distance"] == null ? null : json["distance"],
    );

    Map<String, dynamic> toJson() => {
        "restaurent_address": restaurentAddress == null ? null : restaurentAddress.toJson(),
        "branch_name": branchName == null ? null : branchName,
        "app_key": appKey == null ? null : appKey,
        "is_delivery": isDelivery == null ? null : isDelivery,
        "is_collection": isCollection == null ? null : isCollection,
        "msg": msg == null ? null : msg,
        "distance": distance == null ? null : distance,
    };
}

class RestaurentAddress {
    RestaurentAddress({
        this.address1,
        this.city,
        this.postcode,
    });

    String address1;
    String city;
    String postcode;

    factory RestaurentAddress.fromJson(Map<String, dynamic> json) => RestaurentAddress(
        address1: json["address1"] == null ? null : json["address1"],
        city: json["city"] == null ? null : json["city"],
        postcode: json["postcode"] == null ? null : json["postcode"],
    );

    Map<String, dynamic> toJson() => {
        "address1": address1 == null ? null : address1,
        "city": city == null ? null : city,
        "postcode": postcode == null ? null : postcode,
    };
}
