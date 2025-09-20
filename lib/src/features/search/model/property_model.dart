class Property {
  final int id;
  final String ownerName;
  final String ownerPhone;
  final String type;
  final String title;
  final String description;
  final String price;
  final String rate;
  final List<String> images;
  final String address;
  final int viewsCount;
  final bool isFavourite;

  Property({
    required this.id,
    required this.ownerName,
    required this.ownerPhone,
    required this.type,
    required this.title,
    required this.description,
    required this.price,
    required this.rate,
    required this.images,
    required this.address,
    required this.viewsCount,
    required this.isFavourite,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'],
      ownerName: json['owner_name'] ?? '',
      ownerPhone: json['owner_phone'] ?? '',
      type: json['type'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '0',
      rate: json['rate'] ?? '0',
      images: (json['images'] as List? ?? []).map((e) => e.toString()).toList(),
      address: json['address'] ?? '',
      viewsCount: json['views_count'] ?? 0,
      isFavourite: json['is_favourite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'owner_name': ownerName,
      'owner_phone': ownerPhone,
      'type': type,
      'title': title,
      'description': description,
      'price': price,
      'rate': rate,
      'images': images,
      'address': address,
      'views_count': viewsCount,
      'is_favourite': isFavourite,
    };
  }
}
