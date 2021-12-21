class InterestInModel {
  String name;
  bool isSelected;

  InterestInModel({required this.name, required this.isSelected});

  static List<InterestInModel> items() => [
        InterestInModel(name: "Girls", isSelected: true),
        InterestInModel(name: "Boys", isSelected: false),
        InterestInModel(name: "Both", isSelected: false)
      ];
}
