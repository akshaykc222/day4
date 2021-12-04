class CustomerModel {
  CustomerModel({
    required this.name,
    required this.billingAddress,
    required this.shippingAddress,
    required this.email,
    required this.phone1,
    required this.phone2,
    required this.cashType,
    required this.cashTypeRate,
    required this.country,
    required this.state,
    required this.region,
    required this.zipcode,
    required this.taxNumber,
    required this.payTermNum,
    required this.payTermType,
    required this.creditLimit,
  });

  String name;
  String billingAddress;
  String shippingAddress;
  String email;
  String phone1;
  String phone2;
  String cashType;
  String cashTypeRate;
  String country;
  String state;
  String region;
  String zipcode;
  String taxNumber;
  String payTermNum;
  String payTermType;
  String creditLimit;

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
    name: json["name"],
    billingAddress: json["billing_address"],
    shippingAddress: json["shipping_address"],
    email: json["email"],
    phone1: json["phone1"],
    phone2: json["phone2"],
    cashType: json["cash_type"],
    cashTypeRate: json["cash_type_rate"],
    country: json["country"],
    state: json["state"],
    region: json["region"],
    zipcode: json["zipcode"],
    taxNumber: json["tax_number"],
    payTermNum: json["pay_term_num"],
    payTermType: json["pay_term_type"],
    creditLimit: json["credit_limit"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "billing_address": billingAddress,
    "shipping_address": shippingAddress,
    "email": email,
    "phone1": phone1,
    "phone2": phone2,
    "cash_type": cashType,
    "cash_type_rate": cashTypeRate,
    "country": country,
    "state": state,
    "region": region,
    "zipcode": zipcode,
    "tax_number": taxNumber,
    "pay_term_num": payTermNum,
    "pay_term_type": payTermType,
    "credit_limit": creditLimit,
  };
}
