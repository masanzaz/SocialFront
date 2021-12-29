class GenderModel {
  String gender;
  int id;
  bool isSelected;

  GenderModel({
    required this.gender,
    required this.id,
    this.isSelected = false,
  });

  factory GenderModel.fromJson(Map<String, dynamic> json) => GenderModel(
    id: json["id"],
      gender: json["name"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": gender,
  };
}
