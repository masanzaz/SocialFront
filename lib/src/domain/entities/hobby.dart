import 'package:equatable/equatable.dart';

class Hobby extends Equatable {
  final int id;
  final String image;
  final String name;


  const Hobby({
    required this.id,
    required this.image,
    required this.name
  });

  @override
  List<Object> get props {
    return [
      id,
      image,
      name
    ];
  }

  @override
  bool get stringify => true;
}