// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String name;
    int price;
    String description;
    String thumbnail;
    Category category;
    bool isFeatured;
    
    String id;
    int productViews;
    DateTime createdAt;
    int stock;
    int? userId;

    ProductEntry({
        required this.id,
        required this.name,
        required this.description,
        required this.category,
        required this.thumbnail,
        required this.productViews,
        required this.createdAt,
        required this.isFeatured,
        required this.userId,
        required this.price,
        required this.stock
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        category: categoryValues.map[json["category"]]!,
        thumbnail: json["thumbnail"],
        productViews: json["product_views"],
        createdAt: DateTime.parse(json["created_at"]),
        isFeatured: json["is_featured"],
        userId: json["user_id"],
        price: json["price"],
        stock: json["stock"]
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "category": categoryValues.reverse[category],
        "thumbnail": thumbnail,
        "product_views": productViews,
        "created_at": createdAt.toIso8601String(),
        "is_featured": isFeatured,
        "user_id": userId,
    };
}

enum Category {
    JACKETS,
    JERSEYS,
    SHOES
}

final categoryValues = EnumValues({
    "jackets": Category.JACKETS,
    "jerseys": Category.JERSEYS,
    "shoes": Category.SHOES
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
