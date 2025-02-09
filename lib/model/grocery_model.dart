import 'dart:convert';

GroceryModel groceryModelFromJson(String str) => GroceryModel.fromJson(json.decode(str));

String groceryModelToJson(GroceryModel data) => json.encode(data.toJson());

class GroceryModel {
    bool? success;
    Data? data;
    String? msg;

    GroceryModel({
        this.success,
        this.data,
        this.msg,
    });

    factory GroceryModel.fromJson(Map<String, dynamic> json) => GroceryModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
        "msg": msg,
    };
}

class Data {
    String? title;
    String? status;
    List<Product>? products;
    Pagination? pagination;
    List<Category>? categories;

    Data({
        this.title,
        this.status,
        this.products,
        this.pagination,
        this.categories,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json["title"],
        status: json["status"],
        products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
        categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "status": status,
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
    };
}

class Category {
    String? id;
    String? title;
    String? image;
    bool? isSelected;

    Category({
        this.id,
        this.title,
        this.image,
        this.isSelected,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        title: json["title"],
        image: json["image"],
        isSelected: json["isSelected"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "image": image,
        "isSelected": isSelected,
    };
}

class Pagination {
    int? currentPage;
    int? totalPages;
    int? totalItems;
    int? itemsPerPage;

    Pagination({
        this.currentPage,
        this.totalPages,
        this.totalItems,
        this.itemsPerPage,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
        totalItems: json["totalItems"],
        itemsPerPage: json["itemsPerPage"],
    );

    Map<String, dynamic> toJson() => {
        "currentPage": currentPage,
        "totalPages": totalPages,
        "totalItems": totalItems,
        "itemsPerPage": itemsPerPage,
    };
}

class Product {
    Id? id;
    int? price;
    int? discountPrice;
    String? title;
    int? quantity;
    int? maxQuantity;
    List<Image>? image;
    bool? status;
    StatusText? statusText;
    List<dynamic>? discounts;
    Type? type;
    bool? isCustomisable;
    List<Choice>? choice;

    Product({
        this.id,
        this.price,
        this.discountPrice,
        this.title,
        this.quantity,
        this.maxQuantity,
        this.image,
        this.status,
        this.statusText,
        this.discounts,
        this.type,
        this.isCustomisable,
        this.choice,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: idValues.map[json["_id"]]!,
        price: json["price"],
        discountPrice: json["discountPrice"],
        title: json["title"],
        quantity: json["quantity"],
        maxQuantity: json["maxQuantity"],
        image: json["image"] == null ? [] : List<Image>.from(json["image"]!.map((x) => Image.fromJson(x))),
        status: json["status"],
        statusText: statusTextValues.map[json["statusText"]]!,
        discounts: json["discounts"] == null ? [] : List<dynamic>.from(json["discounts"]!.map((x) => x)),
        type: typeValues.map[json["type"]]!,
        isCustomisable: json["isCustomisable"],
        choice: json["choice"] == null ? [] : List<Choice>.from(json["choice"]!.map((x) => Choice.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": idValues.reverse[id],
        "price": price,
        "discountPrice": discountPrice,
        "title": title,
        "quantity": quantity,
        "maxQuantity": maxQuantity,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x.toJson())),
        "status": status,
        "statusText": statusTextValues.reverse[statusText],
        "discounts": discounts == null ? [] : List<dynamic>.from(discounts!.map((x) => x)),
        "type": typeValues.reverse[type],
        "isCustomisable": isCustomisable,
        "choice": choice == null ? [] : List<dynamic>.from(choice!.map((x) => x.toJson())),
    };
}

class Choice {
    String? id;
    String? type;
    String? title;
    String? des;
    bool? isBasePrice;
    List<ListElement>? list;

    Choice({
        this.id,
        this.type,
        this.title,
        this.des,
        this.isBasePrice,
        this.list,
    });

    factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        id: json["id"],
        type: json["type"],
        title: json["title"],
        des: json["des"],
        isBasePrice: json["isBasePrice"],
        list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "title": title,
        "des": des,
        "isBasePrice": isBasePrice,
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
    };
}

class ListElement {
    String? id;
    String? title;
    String? des;
    bool? isActive;
    int? price;
    int? discount;
    bool? isSelected;

    ListElement({
        this.id,
        this.title,
        this.des,
        this.isActive,
        this.price,
        this.discount,
        this.isSelected,
    });

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        title: json["title"],
        des: json["des"],
        isActive: json["isActive"],
        price: json["price"],
        discount: json["discount"],
        isSelected: json["isSelected"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "des": des,
        "isActive": isActive,
        "price": price,
        "discount": discount,
        "isSelected": isSelected,
    };
}

enum Id {
    THE_643_C775_BFF1_BF0_B233_A1_B0_EE
}

final idValues = EnumValues({
    "643c775bff1bf0b233a1b0ee": Id.THE_643_C775_BFF1_BF0_B233_A1_B0_EE
});

class Image {
    String? url;

    Image({
        this.url,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
    };
}

enum StatusText {
    EMPTY,
    UNAVAILABLE
}

final statusTextValues = EnumValues({
    "": StatusText.EMPTY,
    "Unavailable": StatusText.UNAVAILABLE
});

enum Type {
    FRESH
}

final typeValues = EnumValues({
    "fresh": Type.FRESH
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
