class DesingationModel {
  String id;
  String designation;

  DesingationModel({required this.id, required this.designation});

  factory DesingationModel.fromJson(Map<String, dynamic> json) {
    return DesingationModel(id: json['id'], designation: json['designation']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['designation'] = designation;
    return data;
  }
}
