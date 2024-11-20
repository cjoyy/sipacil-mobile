import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(
    json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
  DateTime time;
  String product;
  int price;
  String description;
  double rating;
  String date;
  bool available;

  Fields({
    required this.user,
    required this.time,
    required this.product,
    required this.description,
    required this.price,
    this.rating = 0.0,
    this.date = "2022-01-01",
    this.available = true,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        time: DateTime.parse(json["time"]),
        product: json["product"],
        price: json["price"] ?? 1500000,
        description: json["description"],
        rating: json["rating"] ?? 0.0,
        date: json["date"] ?? "2022-01-01",
        available: json["available"] ?? true,
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "time":
            "${time.year.toString().padLeft(4, '0')}-${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')}",
        "product": product,
        "price": price,
        "description": description,
        "rating": rating,
        "date": date,
        "available": available,
      };
}
