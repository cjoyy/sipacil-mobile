// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String model;
    String pk;
    Fields fields;

    ProductEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String product;
    int price;
    String description;
    String rating;
    DateTime date;
    bool available;

    Fields({
        required this.user,
        required this.product,
        required this.price,
        required this.description,
        required this.rating,
        required this.date,
        required this.available,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        product: json["product"],
        price: json["price"],
        description: json["description"],
        rating: json["rating"],
        date: DateTime.parse(json["date"]),
        available: json["available"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "product": product,
        "price": price,
        "description": description,
        "rating": rating,
        "date": date.toIso8601String(),
        "available": available,
    };
}
