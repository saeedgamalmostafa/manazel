class FilterResponse {
  final List<DropDownItem> cities;
  final List<DropDownItem> type;
  final List<DropDownItem> purpose;
  final double priceMax;
  final double priceMin;

  FilterResponse({
    required this.cities,
    required this.type,
    required this.purpose,
    required this.priceMax,
    required this.priceMin,
  });

  factory FilterResponse.fromJson(Map<String, dynamic> json) {
    return FilterResponse(
      cities: (json['cities'] as List)
          .map((e) => DropDownItem.fromJson(e))
          .toList(),
      type:
          (json['type'] as List).map((e) => DropDownItem.fromJson(e)).toList(),
      purpose: (json['purpose'] as List)
          .map((e) => DropDownItem.fromJson(e))
          .toList(),
      priceMax: double.tryParse(json['price_max'].toString()) ?? 0.0,
      priceMin: double.tryParse(json['price_min'].toString()) ?? 0.0,
    );
  }
}

class DropDownItem {
  final int id;
  final String name;

  DropDownItem({
    required this.id,
    required this.name,
  });

  factory DropDownItem.fromJson(Map<String, dynamic> json) => DropDownItem(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
