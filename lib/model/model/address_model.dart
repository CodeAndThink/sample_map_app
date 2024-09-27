class Address {
  String label;
  String countryCode;
  String countryName;
  String county;
  String city;
  String? district;
  String? postalCode;
  String? street;

  Address({
    required this.label,
    required this.countryCode,
    required this.countryName,
    required this.county,
    required this.city,
    this.district,
    this.postalCode,
    this.street,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      label: json['label'] ?? '',
      countryCode: json['countryCode'] ?? '',
      countryName: json['countryName'] ?? '',
      county: json['county'] ?? '',
      city: json['city'] ?? '',
      district: json['district'],
      postalCode: json['postalCode'],
      street: json['street'],
    );
  }

  Map<String, dynamic> toJson() => {
        'label': label,
        'countryCode': countryCode,
        'countryName': countryName,
        'county': county,
        'city': city,
        'district': district,
        'postalCode': postalCode,
        'street': street,
      };
}
