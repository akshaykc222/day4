
import 'dart:convert';

List<CountryModel> countryFromJson(String str) => List<CountryModel>.from(json.decode(str).map((x) => CountryModel.fromJson(x)));

String countryToJson(List<CountryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryModel {
  CountryModel({
    required this.name,
    required this.dialCode,
    required this.code,
    required this.currency
  });

  String name;
  int dialCode;
  String code;
  String currency;
  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    name: json["name"],
    dialCode: json["dial_code"],
    code: json["code"],
    currency: json['currency']
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "dial_code": dialCode,
    "code": code,
    "currency":currency
  };
}
