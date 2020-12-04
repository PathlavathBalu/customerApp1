// To parse this JSON data, do
//
//     final contact = contactFromJson(jsonString);

import 'dart:convert';

Contact contactFromJson(String str) => Contact.fromJson(json.decode(str));

String contactToJson(Contact data) => json.encode(data.toJson());

class Contact {
    Contact({
        this.status,
        this.msg, 
        this.error,
        this.data,
        this.httpResponse,
    });

    int status;
    String msg;
    String error;
    Data data;
    String httpResponse;

    factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        status: json["Status"] == null ? null : json["Status"],
        msg: json["msg"] == null ? null : json["msg"],
        error: json["error"] == null ? null : json["error"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        httpResponse: json["HTTP_Response"] == null ? null : json["HTTP_Response"],
    );

    Map<String, dynamic> toJson() => {
        "Status": status == null ? null : status,
        "msg": msg == null ? null : msg,
        "error": error == null ? null : error,
        "data": data == null ? null : data.toJson(),
        "HTTP_Response": httpResponse == null ? null : httpResponse,
    };
}

class Data {
    Data({
        this.restaurantDetails,
        this.slots,
        this.workingHours,
    });

    List<RestaurantDetail> restaurantDetails;
    List<Slot> slots;
    List<WorkingHour> workingHours;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        restaurantDetails: json["restaurant_details"] == null ? null : List<RestaurantDetail>.from(json["restaurant_details"].map((x) => RestaurantDetail.fromJson(x))),
        slots: json["slots"] == null ? null : List<Slot>.from(json["slots"].map((x) => Slot.fromJson(x))),
        workingHours: json["Working_hours"] == null ? null : List<WorkingHour>.from(json["Working_hours"].map((x) => WorkingHour.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "restaurant_details": restaurantDetails == null ? null : List<dynamic>.from(restaurantDetails.map((x) => x.toJson())),
        "slots": slots == null ? null : List<dynamic>.from(slots.map((x) => x.toJson())),
        "Working_hours": workingHours == null ? null : List<dynamic>.from(workingHours.map((x) => x.toJson())),
    };
}

class RestaurantDetail {
    RestaurantDetail({
        this.id,
        this.restaurantCode,
        this.restaurantName,
        this.ownerName,
        this.ownerEmail,
        this.phoneNumber,
        this.logo,
        this.receiptLogo,
        this.address1,
        this.address2,
        this.city,
        this.county,
        this.country,
        this.postcode,
        this.vatFlag,
        this.latitude,
        this.langitude,
        this.timezone,
        this.enteredOn,
        this.activationFlag,
        this.inactiveCount,
        this.updatedOn,
        this.tableSetupFlag,
        this.activeTableLayout,
        this.dateFormat,
        this.askForTakeaway,
        this.askForDrivethru,
        this.safeDrop,
        this.paySetting,
        this.onlineOrderStatus,
        this.servicePriceStatus,
        this.itemNumberingFlag,
        this.subcatNumberingFlag,
        this.menuNumberingFlag,
        this.defEatinPopupFlag,
        this.previousOrdersFlag,
        this.itemAmountSettings,
        this.menuDisplayType,
        this.menuCatDisplayType,
        this.bgImage,
        this.termsConditionUrl,
        this.workingHours,
        this.locationImg,
        this.contact,
        this.email,
        this.address,
        this.deliveryTime,
        this.collectionTime,
        this.websiteUrl,
        this.queriesEmail,
        this.openingHrsMsg,
        this.isTermsConditionsUrl,
        this.termsConditionsText,
        this.autoPrivacyPolicyInfo,
    });

    int id;
    String restaurantCode;
    String restaurantName;
    String ownerName;
    String ownerEmail;
    int phoneNumber;
    String logo;
    String receiptLogo;
    String address1;
    String address2;
    String city;
    String county;
    String country;
    String postcode;
    int vatFlag;
    String latitude;
    String langitude;
    String timezone;
    DateTime enteredOn;
    String activationFlag;
    int inactiveCount;
    DateTime updatedOn;
    String tableSetupFlag;
    String activeTableLayout;
    String dateFormat;
    String askForTakeaway;
    String askForDrivethru;
    String safeDrop;
    int paySetting;
    int onlineOrderStatus;
    int servicePriceStatus;
    int itemNumberingFlag;
    int subcatNumberingFlag;
    int menuNumberingFlag;
    int defEatinPopupFlag;
    int previousOrdersFlag;
    String itemAmountSettings;
    String menuDisplayType;
    String menuCatDisplayType;
    String bgImage;
    String termsConditionUrl;
    String workingHours;
    String locationImg;
    String contact;
    String email;
    String address;
    int deliveryTime;
    int collectionTime;
    String websiteUrl;
    String queriesEmail;
    String openingHrsMsg;
    dynamic isTermsConditionsUrl;
    dynamic termsConditionsText;
    String autoPrivacyPolicyInfo;

    factory RestaurantDetail.fromJson(Map<String, dynamic> json) => RestaurantDetail(
        id: json["id"] == null ? null : json["id"],
        restaurantCode: json["restaurant_code"] == null ? null : json["restaurant_code"],
        restaurantName: json["restaurant_name"] == null ? null : json["restaurant_name"],
        ownerName: json["owner_name"] == null ? null : json["owner_name"],
        ownerEmail: json["owner_email"] == null ? null : json["owner_email"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        logo: json["logo"] == null ? null : json["logo"],
        receiptLogo: json["receipt_logo"] == null ? null : json["receipt_logo"],
        address1: json["address1"] == null ? null : json["address1"],
        address2: json["address2"] == null ? null : json["address2"],
        city: json["city"] == null ? null : json["city"],
        county: json["county"] == null ? null : json["county"],
        country: json["country"] == null ? null : json["country"],
        postcode: json["postcode"] == null ? null : json["postcode"],
        vatFlag: json["vat_flag"] == null ? null : json["vat_flag"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        langitude: json["langitude"] == null ? null : json["langitude"],
        timezone: json["timezone"] == null ? null : json["timezone"],
        enteredOn: json["entered_on"] == null ? null : DateTime.parse(json["entered_on"]),
        activationFlag: json["activation_flag"] == null ? null : json["activation_flag"],
        inactiveCount: json["inactive_count"] == null ? null : json["inactive_count"],
        updatedOn: json["updated_on"] == null ? null : DateTime.parse(json["updated_on"]),
        tableSetupFlag: json["table_setup_flag"] == null ? null : json["table_setup_flag"],
        activeTableLayout: json["active_table_layout"] == null ? null : json["active_table_layout"],
        dateFormat: json["date_format"] == null ? null : json["date_format"],
        askForTakeaway: json["ask_for_takeaway"] == null ? null : json["ask_for_takeaway"],
        askForDrivethru: json["ask_for_drivethru"] == null ? null : json["ask_for_drivethru"],
        safeDrop: json["safe_drop"] == null ? null : json["safe_drop"],
        paySetting: json["pay_setting"] == null ? null : json["pay_setting"],
        onlineOrderStatus: json["online_order_status"] == null ? null : json["online_order_status"],
        servicePriceStatus: json["service_price_status"] == null ? null : json["service_price_status"],
        itemNumberingFlag: json["item_numbering_flag"] == null ? null : json["item_numbering_flag"],
        subcatNumberingFlag: json["subcat_numbering_flag"] == null ? null : json["subcat_numbering_flag"],
        menuNumberingFlag: json["menu_numbering_flag"] == null ? null : json["menu_numbering_flag"],
        defEatinPopupFlag: json["def_eatin_popup_flag"] == null ? null : json["def_eatin_popup_flag"],
        previousOrdersFlag: json["previous_orders_flag"] == null ? null : json["previous_orders_flag"],
        itemAmountSettings: json["item_amount_settings"] == null ? null : json["item_amount_settings"],
        menuDisplayType: json["menu_display_type"] == null ? null : json["menu_display_type"],
        menuCatDisplayType: json["menu_cat_display_type"] == null ? null : json["menu_cat_display_type"],
        bgImage: json["bg_image"] == null ? null : json["bg_image"],
        termsConditionUrl: json["terms_condition_url"] == null ? null : json["terms_condition_url"],
        workingHours: json["working_hours"] == null ? null : json["working_hours"],
        locationImg: json["location_img"] == null ? null : json["location_img"],
        contact: json["contact"] == null ? null : json["contact"],
        email: json["email"] == null ? null : json["email"],
        address: json["address"] == null ? null : json["address"],
        deliveryTime: json["delivery_time"] == null ? null : json["delivery_time"],
        collectionTime: json["collection_time"] == null ? null : json["collection_time"],
        websiteUrl: json["website_url"] == null ? null : json["website_url"],
        queriesEmail: json["queries_email"] == null ? null : json["queries_email"],
        openingHrsMsg: json["opening_hrs_msg"] == null ? null : json["opening_hrs_msg"],
        isTermsConditionsUrl: json["is_terms_conditions_url"],
        termsConditionsText: json["terms_conditions_text"],
        autoPrivacyPolicyInfo: json["auto_privacy_policy_info"] == null ? null : json["auto_privacy_policy_info"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "restaurant_code": restaurantCode == null ? null : restaurantCode,
        "restaurant_name": restaurantName == null ? null : restaurantName,
        "owner_name": ownerName == null ? null : ownerName,
        "owner_email": ownerEmail == null ? null : ownerEmail,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "logo": logo == null ? null : logo,
        "receipt_logo": receiptLogo == null ? null : receiptLogo,
        "address1": address1 == null ? null : address1,
        "address2": address2 == null ? null : address2,
        "city": city == null ? null : city,
        "county": county == null ? null : county,
        "country": country == null ? null : country,
        "postcode": postcode == null ? null : postcode,
        "vat_flag": vatFlag == null ? null : vatFlag,
        "latitude": latitude == null ? null : latitude,
        "langitude": langitude == null ? null : langitude,
        "timezone": timezone == null ? null : timezone,
        "entered_on": enteredOn == null ? null : enteredOn.toIso8601String(),
        "activation_flag": activationFlag == null ? null : activationFlag,
        "inactive_count": inactiveCount == null ? null : inactiveCount,
        "updated_on": updatedOn == null ? null : updatedOn.toIso8601String(),
        "table_setup_flag": tableSetupFlag == null ? null : tableSetupFlag,
        "active_table_layout": activeTableLayout == null ? null : activeTableLayout,
        "date_format": dateFormat == null ? null : dateFormat,
        "ask_for_takeaway": askForTakeaway == null ? null : askForTakeaway,
        "ask_for_drivethru": askForDrivethru == null ? null : askForDrivethru,
        "safe_drop": safeDrop == null ? null : safeDrop,
        "pay_setting": paySetting == null ? null : paySetting,
        "online_order_status": onlineOrderStatus == null ? null : onlineOrderStatus,
        "service_price_status": servicePriceStatus == null ? null : servicePriceStatus,
        "item_numbering_flag": itemNumberingFlag == null ? null : itemNumberingFlag,
        "subcat_numbering_flag": subcatNumberingFlag == null ? null : subcatNumberingFlag,
        "menu_numbering_flag": menuNumberingFlag == null ? null : menuNumberingFlag,
        "def_eatin_popup_flag": defEatinPopupFlag == null ? null : defEatinPopupFlag,
        "previous_orders_flag": previousOrdersFlag == null ? null : previousOrdersFlag,
        "item_amount_settings": itemAmountSettings == null ? null : itemAmountSettings,
        "menu_display_type": menuDisplayType == null ? null : menuDisplayType,
        "menu_cat_display_type": menuCatDisplayType == null ? null : menuCatDisplayType,
        "bg_image": bgImage == null ? null : bgImage,
        "terms_condition_url": termsConditionUrl == null ? null : termsConditionUrl,
        "working_hours": workingHours == null ? null : workingHours,
        "location_img": locationImg == null ? null : locationImg,
        "contact": contact == null ? null : contact,
        "email": email == null ? null : email,
        "address": address == null ? null : address,
        "delivery_time": deliveryTime == null ? null : deliveryTime,
        "collection_time": collectionTime == null ? null : collectionTime,
        "website_url": websiteUrl == null ? null : websiteUrl,
        "queries_email": queriesEmail == null ? null : queriesEmail,
        "opening_hrs_msg": openingHrsMsg == null ? null : openingHrsMsg,
        "is_terms_conditions_url": isTermsConditionsUrl,
        "terms_conditions_text": termsConditionsText,
        "auto_privacy_policy_info": autoPrivacyPolicyInfo == null ? null : autoPrivacyPolicyInfo,
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

class WorkingHour {
    WorkingHour({
        this.sunday,
        this.monday,
        this.tuesday,
        this.wednesday,
        this.thursday,
        this.friday,
        this.saturday,
    });

    String sunday;
    String monday;
    String tuesday;
    String wednesday;
    String thursday;
    String friday;
    String saturday;

    factory WorkingHour.fromJson(Map<String, dynamic> json) => WorkingHour(
        sunday: json["Sunday"] == null ? null : json["Sunday"],
        monday: json["Monday"] == null ? null : json["Monday"],
        tuesday: json["Tuesday"] == null ? null : json["Tuesday"],
        wednesday: json["Wednesday"] == null ? null : json["Wednesday"],
        thursday: json["thursday"] == null ? null : json["thursday"],
        friday: json["Friday"] == null ? null : json["Friday"],
        saturday: json["Saturday"] == null ? null : json["Saturday"],
    );

    Map<String, dynamic> toJson() => {
        "Sunday": sunday == null ? null : sunday,
        "Monday": monday == null ? null : monday,
        "Tuesday": tuesday == null ? null : tuesday,
        "Wednesday": wednesday == null ? null : wednesday,
        "thursday": thursday == null ? null : thursday,
        "Friday": friday == null ? null : friday,
        "Saturday": saturday == null ? null : saturday,
    };
}
