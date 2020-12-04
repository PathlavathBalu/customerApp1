// To parse this JSON data, do
//
//     final restDetail = restDetailFromJson(jsonString);

import 'dart:convert';

RestDetail restDetailFromJson(String str) => RestDetail.fromJson(json.decode(str));

String restDetailToJson(RestDetail data) => json.encode(data.toJson());

class RestDetail {
    RestDetail({
        this.status,
        this.restDetails,
        this.msg,
    });

    int status;
    RestDetails restDetails;
    String msg;

    factory RestDetail.fromJson(Map<String, dynamic> json) => RestDetail(
        status: json["status"] == null ? null : json["status"],
        restDetails: json["rest_details"] == null ? null : RestDetails.fromJson(json["rest_details"]),
        msg: json["msg"] == null ? null : json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "rest_details": restDetails == null ? null : restDetails.toJson(),
        "msg": msg == null ? null : msg,
    };
}

class RestDetails {
    RestDetails({
        this.multipleRestFlag,
        this.restaurantName,
        this.email,
        this.phoneNumber,
        this.address1,
        this.address2,
        this.city,
        this.county,
        this.country,
        this.postCode,
        this.managerName,
        this.website,
        this.actualRestaurantName,
        this.restaurantCode,
        this.ownerName,
        this.symbol,
        this.vatFlag,
        this.vatType,
        this.emailReceipt,
        this.adminReserHrs,
        this.primaryImage,
        this.secondaryImage,
        this.askTakeaway,
        this.askDrivethru,
        this.onlineTable,
        this.activeTableLayout,
        this.vatNum,
        this.logo,
        this.latitude,
        this.langitude,
        this.countryCode,
        this.dateFormat,
        this.timezone,
        this.activeFlag,
        this.refundDays,
        this.idleTime,
        this.maxCashhold,
        this.cqmFlag,
        this.takeAwayFlag,
        this.deliveryFlag,
        this.multiRestLogo,
        this.multiCaption1,
        this.multiCaption2,
        this.isMultiBgColor,
        this.multiBgColor,
        this.multiBgImage,
        this.workingSts,
        this.workingMsg,
        this.termsConditionUrl,
        this.preorderFlag,
        this.promotionVideoFlag,
        this.promotionVideoUrl,
        this.workingHours,
        this.fromTime,
        this.toTime,
        this.isAvailable,
        this.isAvailableTimeFlag,
        this.driverTrackingStatus,
        this.driverTrackingKey,
        this.deliveryTime,
        this.collectionTime,
        this.locationImg,
        this.extraNotes,
        this.screen,
        this.slotEnabled,
        this.slots,
        this.isMealDealAvailable,
        this.defaultOrderType,
        this.tableSetupFlag,
        this.custommenuFlag,
        this.loyalty,
    });

    int multipleRestFlag;
    String restaurantName;
    String email;
    String phoneNumber;
    String address1;
    String address2;
    String city;
    String county;
    String country;
    String postCode;
    String managerName;
    String website;
    String actualRestaurantName;
    String restaurantCode;
    String ownerName;
    String symbol;
    String vatFlag;
    String vatType;
    String emailReceipt;
    String adminReserHrs;
    String primaryImage;
    String secondaryImage;
    String askTakeaway;
    String askDrivethru;
    String onlineTable;
    int activeTableLayout;
    String vatNum;
    String logo;
    String latitude;
    String langitude;
    String countryCode;
    String dateFormat;
    String timezone;
    int activeFlag;
    String refundDays;
    String idleTime;
    String maxCashhold;
    String cqmFlag;
    String takeAwayFlag;
    String deliveryFlag;
    String multiRestLogo;
    String multiCaption1;
    String multiCaption2;
    String isMultiBgColor;
    String multiBgColor;
    String multiBgImage;
    int workingSts;
    String workingMsg;
    String termsConditionUrl;
    String preorderFlag;
    int promotionVideoFlag;
    String promotionVideoUrl;
    List<String> workingHours;
    String fromTime;
    String toTime;
    int isAvailable;
    int isAvailableTimeFlag;
    String driverTrackingStatus;
    String driverTrackingKey;
    String deliveryTime;
    String collectionTime;
    String locationImg;
    String extraNotes;
    int screen;
    String slotEnabled;
    List<Slot> slots;
    int isMealDealAvailable;
    int defaultOrderType;
    String tableSetupFlag;
    int custommenuFlag;
    int loyalty;

    factory RestDetails.fromJson(Map<String, dynamic> json) => RestDetails(
        multipleRestFlag: json["multiple_rest_flag"] == null ? null : json["multiple_rest_flag"],
        restaurantName: json["restaurant_name"] == null ? null : json["restaurant_name"],
        email: json["email"] == null ? null : json["email"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        address1: json["address1"] == null ? null : json["address1"],
        address2: json["address2"] == null ? null : json["address2"],
        city: json["city"] == null ? null : json["city"],
        county: json["county"] == null ? null : json["county"],
        country: json["country"] == null ? null : json["country"],
        postCode: json["post_code"] == null ? null : json["post_code"],
        managerName: json["manager_name"] == null ? null : json["manager_name"],
        website: json["website"] == null ? null : json["website"],
        actualRestaurantName: json["actual_restaurant_name"] == null ? null : json["actual_restaurant_name"],
        restaurantCode: json["restaurant_code"] == null ? null : json["restaurant_code"],
        ownerName: json["owner_name"] == null ? null : json["owner_name"],
        symbol: json["symbol"] == null ? null : json["symbol"],
        vatFlag: json["vat_flag"] == null ? null : json["vat_flag"],
        vatType: json["vat_type"] == null ? null : json["vat_type"],
        emailReceipt: json["email_receipt"] == null ? null : json["email_receipt"],
        adminReserHrs: json["admin_reser_hrs"] == null ? null : json["admin_reser_hrs"],
        primaryImage: json["primary_image"] == null ? null : json["primary_image"],
        secondaryImage: json["secondary_image"] == null ? null : json["secondary_image"],
        askTakeaway: json["ask_takeaway"] == null ? null : json["ask_takeaway"],
        askDrivethru: json["ask_drivethru"] == null ? null : json["ask_drivethru"],
        onlineTable: json["online_table"] == null ? null : json["online_table"],
        activeTableLayout: json["active_table_layout"] == null ? null : json["active_table_layout"],
        vatNum: json["vat_num"] == null ? null : json["vat_num"],
        logo: json["logo"] == null ? null : json["logo"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        langitude: json["langitude"] == null ? null : json["langitude"],
        countryCode: json["country_code"] == null ? null : json["country_code"],
        dateFormat: json["date_format"] == null ? null : json["date_format"],
        timezone: json["timezone"] == null ? null : json["timezone"],
        activeFlag: json["active_flag"] == null ? null : json["active_flag"],
        refundDays: json["refund_days"] == null ? null : json["refund_days"],
        idleTime: json["idle_time"] == null ? null : json["idle_time"],
        maxCashhold: json["max_cashhold"] == null ? null : json["max_cashhold"],
        cqmFlag: json["cqm_flag"] == null ? null : json["cqm_flag"],
        takeAwayFlag: json["take_away_flag"] == null ? null : json["take_away_flag"],
        deliveryFlag: json["delivery_flag"] == null ? null : json["delivery_flag"],
        multiRestLogo: json["multi_rest_logo"] == null ? null : json["multi_rest_logo"],
        multiCaption1: json["multi_caption1"] == null ? null : json["multi_caption1"],
        multiCaption2: json["multi_caption2"] == null ? null : json["multi_caption2"],
        isMultiBgColor: json["is_multi_bg_color"] == null ? null : json["is_multi_bg_color"],
        multiBgColor: json["multi_bg_color"] == null ? null : json["multi_bg_color"],
        multiBgImage: json["multi_bg_image"] == null ? null : json["multi_bg_image"],
        workingSts: json["working_sts"] == null ? null : json["working_sts"],
        workingMsg: json["working_msg"] == null ? null : json["working_msg"],
        termsConditionUrl: json["terms_condition_url"] == null ? null : json["terms_condition_url"],
        preorderFlag: json["preorder_flag"] == null ? null : json["preorder_flag"],
        promotionVideoFlag: json["promotion_video_flag"] == null ? null : json["promotion_video_flag"],
        promotionVideoUrl: json["promotion_video_url"] == null ? null : json["promotion_video_url"],
        workingHours: json["workingHours"] == null ? null : List<String>.from(json["workingHours"].map((x) => x)),
        fromTime: json["fromTime"] == null ? null : json["fromTime"],
        toTime: json["ToTime"] == null ? null : json["ToTime"],
        isAvailable: json["isAvailable"] == null ? null : json["isAvailable"],
        isAvailableTimeFlag: json["isAvailable_time_flag"] == null ? null : json["isAvailable_time_flag"],
        driverTrackingStatus: json["DriverTrackingStatus"] == null ? null : json["DriverTrackingStatus"],
        driverTrackingKey: json["DriverTrackingKey"] == null ? null : json["DriverTrackingKey"],
        deliveryTime: json["DeliveryTime"] == null ? null : json["DeliveryTime"],
        collectionTime: json["collectionTime"] == null ? null : json["collectionTime"],
        locationImg: json["locationImg"] == null ? null : json["locationImg"],
        extraNotes: json["extraNotes"] == null ? null : json["extraNotes"],
        screen: json["screen"] == null ? null : json["screen"],
        slotEnabled: json["slot_enabled"] == null ? null : json["slot_enabled"],
        slots: json["slots"] == null ? null : List<Slot>.from(json["slots"].map((x) => Slot.fromJson(x))),
        isMealDealAvailable: json["isMealDealAvailable"] == null ? null : json["isMealDealAvailable"],
        defaultOrderType: json["default_order_type"] == null ? null : json["default_order_type"],
        tableSetupFlag: json["table_setup_flag"] == null ? null : json["table_setup_flag"],
        custommenuFlag: json["custommenu_flag"] == null ? null : json["custommenu_flag"],
        loyalty: json["loyalty"] == null ? null : json["loyalty"],
    );

    Map<String, dynamic> toJson() => {
        "multiple_rest_flag": multipleRestFlag == null ? null : multipleRestFlag,
        "restaurant_name": restaurantName == null ? null : restaurantName,
        "email": email == null ? null : email,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "address1": address1 == null ? null : address1,
        "address2": address2 == null ? null : address2,
        "city": city == null ? null : city,
        "county": county == null ? null : county,
        "country": country == null ? null : country,
        "post_code": postCode == null ? null : postCode,
        "manager_name": managerName == null ? null : managerName,
        "website": website == null ? null : website,
        "actual_restaurant_name": actualRestaurantName == null ? null : actualRestaurantName,
        "restaurant_code": restaurantCode == null ? null : restaurantCode,
        "owner_name": ownerName == null ? null : ownerName,
        "symbol": symbol == null ? null : symbol,
        "vat_flag": vatFlag == null ? null : vatFlag,
        "vat_type": vatType == null ? null : vatType,
        "email_receipt": emailReceipt == null ? null : emailReceipt,
        "admin_reser_hrs": adminReserHrs == null ? null : adminReserHrs,
        "primary_image": primaryImage == null ? null : primaryImage,
        "secondary_image": secondaryImage == null ? null : secondaryImage,
        "ask_takeaway": askTakeaway == null ? null : askTakeaway,
        "ask_drivethru": askDrivethru == null ? null : askDrivethru,
        "online_table": onlineTable == null ? null : onlineTable,
        "active_table_layout": activeTableLayout == null ? null : activeTableLayout,
        "vat_num": vatNum == null ? null : vatNum,
        "logo": logo == null ? null : logo,
        "latitude": latitude == null ? null : latitude,
        "langitude": langitude == null ? null : langitude,
        "country_code": countryCode == null ? null : countryCode,
        "date_format": dateFormat == null ? null : dateFormat,
        "timezone": timezone == null ? null : timezone,
        "active_flag": activeFlag == null ? null : activeFlag,
        "refund_days": refundDays == null ? null : refundDays,
        "idle_time": idleTime == null ? null : idleTime,
        "max_cashhold": maxCashhold == null ? null : maxCashhold,
        "cqm_flag": cqmFlag == null ? null : cqmFlag,
        "take_away_flag": takeAwayFlag == null ? null : takeAwayFlag,
        "delivery_flag": deliveryFlag == null ? null : deliveryFlag,
        "multi_rest_logo": multiRestLogo == null ? null : multiRestLogo,
        "multi_caption1": multiCaption1 == null ? null : multiCaption1,
        "multi_caption2": multiCaption2 == null ? null : multiCaption2,
        "is_multi_bg_color": isMultiBgColor == null ? null : isMultiBgColor,
        "multi_bg_color": multiBgColor == null ? null : multiBgColor,
        "multi_bg_image": multiBgImage == null ? null : multiBgImage,
        "working_sts": workingSts == null ? null : workingSts,
        "working_msg": workingMsg == null ? null : workingMsg,
        "terms_condition_url": termsConditionUrl == null ? null : termsConditionUrl,
        "preorder_flag": preorderFlag == null ? null : preorderFlag,
        "promotion_video_flag": promotionVideoFlag == null ? null : promotionVideoFlag,
        "promotion_video_url": promotionVideoUrl == null ? null : promotionVideoUrl,
        "workingHours": workingHours == null ? null : List<dynamic>.from(workingHours.map((x) => x)),
        "fromTime": fromTime == null ? null : fromTime,
        "ToTime": toTime == null ? null : toTime,
        "isAvailable": isAvailable == null ? null : isAvailable,
        "isAvailable_time_flag": isAvailableTimeFlag == null ? null : isAvailableTimeFlag,
        "DriverTrackingStatus": driverTrackingStatus == null ? null : driverTrackingStatus,
        "DriverTrackingKey": driverTrackingKey == null ? null : driverTrackingKey,
        "DeliveryTime": deliveryTime == null ? null : deliveryTime,
        "collectionTime": collectionTime == null ? null : collectionTime,
        "locationImg": locationImg == null ? null : locationImg,
        "extraNotes": extraNotes == null ? null : extraNotes,
        "screen": screen == null ? null : screen,
        "slot_enabled": slotEnabled == null ? null : slotEnabled,
        "slots": slots == null ? null : List<dynamic>.from(slots.map((x) => x.toJson())),
        "isMealDealAvailable": isMealDealAvailable == null ? null : isMealDealAvailable,
        "default_order_type": defaultOrderType == null ? null : defaultOrderType,
        "table_setup_flag": tableSetupFlag == null ? null : tableSetupFlag,
        "custommenu_flag": custommenuFlag == null ? null : custommenuFlag,
        "loyalty": loyalty == null ? null : loyalty,
    };
}

class Slot {
    Slot({
        this.fromTime,
        this.toTime,
    });

    String fromTime;
    String toTime;

    factory Slot.fromJson(Map<String, dynamic> json) => Slot(
        fromTime: json["from_time"] == null ? null : json["from_time"],
        toTime: json["to_time"] == null ? null : json["to_time"],
    );

    Map<String, dynamic> toJson() => {
        "from_time": fromTime == null ? null : fromTime,
        "to_time": toTime == null ? null : toTime,
    };
}
