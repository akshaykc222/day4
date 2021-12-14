class BusinessModel {
  BusinessModel({
    this.parentCompany,
    required this.id,
    required this.name,
    required this.address,
    required this.pincode,
    required this.country,
    required this.state,
    required this.city,
    required this.tax,
    required this.tax1,
  });
  String id;
  String? parentCompany;
  String name;
  String address;
  String pincode;
  String country;
  String state;
  String city;
  String tax;
  String tax1;

  factory BusinessModel.fromJson(Map<String, dynamic> json) => BusinessModel(
        id: json["id"],
        parentCompany: json["parent_company"],
        name: json["name"],
        address: json["address"],
        pincode: json["pincode"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        tax: json["tax"],
        tax1: json["tax1"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent_company": parentCompany,
        "name": name,
        "address": address,
        "pincode": pincode,
        "country": country,
        "state": state,
        "city": city,
        "tax": tax,
        "tax1": tax1,
      };
}
