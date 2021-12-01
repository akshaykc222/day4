class Roles {
  String id;
  String roleName;

  Roles({required this.id, required this.roleName});

  factory Roles.fromJson(Map<String, dynamic> json) {
    return Roles(id: json['id'], roleName: json['roleName']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['roleName'] = roleName;
    return data;
  }
}
