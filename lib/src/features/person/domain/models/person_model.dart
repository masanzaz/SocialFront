import 'dart:convert';
class PersonModel {
  int? id;
  String? email;
  String? phoneNumber;
  int? genreId;
  int? interestedId;
  String? firstName;
  String? lasName;
  String? image;
  DateTime? dateOfBirth;
  List<int>? hobbies  = [];
  List<int>? disabilities = [];

  PersonModel({
    this.id,
    this.email,
    this.phoneNumber,
    this.genreId,
    this.interestedId,
    this.firstName,
    this.lasName,
    this.image,
    this.dateOfBirth,
    this.hobbies,
    this.disabilities
  });

  factory PersonModel.fromJson(Map<String, dynamic> parsedJson) {
    return new PersonModel(
        email: parsedJson['email'] ?? "",
        phoneNumber: parsedJson['phoneNumber'] ?? "",
        genreId: parsedJson['genreId'] ?? 0,
        interestedId: parsedJson['interestedId'] ?? 0,
        firstName: parsedJson['firstName'] ?? "",
        lasName: parsedJson['lasName'] ?? "",
        dateOfBirth: parsedJson['dateOfBirth'],
        hobbies: parsedJson['hobbies']?.cast<int>(),
        disabilities: parsedJson['disabilities']?.cast<int>());
  }

  Map<String, dynamic> toJson() => {
    "email": email,
    "phoneNumber": phoneNumber,
    "genreId": genreId,
    "interestedId": interestedId,
    "firstName": firstName,
    "lasName": lasName,
    "image": image,
    "dateOfBirth": dateOfBirth,
    "hobbies": hobbies,
    "disabilities": disabilities
  };
}