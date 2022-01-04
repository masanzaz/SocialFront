class UpdatePersonModel {
  int? id;
  String? firstName;
  String? lasName;
  String? about;
  String? image;
  String? dateOfBirth;

  UpdatePersonModel({
    this.id,
    this.firstName,
    this.lasName,
    this.about,
    this.image,
    this.dateOfBirth
  });

  factory UpdatePersonModel.fromJson(Map<String, dynamic> parsedJson) {
    return new UpdatePersonModel(
        id: parsedJson['id'] ?? 0,
        firstName: parsedJson['firstName'] ?? "",
        lasName: parsedJson['lasName'] ?? "",
        image: parsedJson['image'] ?? "",
        about: parsedJson['about'] ?? "",
        dateOfBirth: parsedJson['dateOfBirth']
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lasName": lasName,
    "image": image,
    "about": about,
    "dateOfBirth": dateOfBirth
  };
}
