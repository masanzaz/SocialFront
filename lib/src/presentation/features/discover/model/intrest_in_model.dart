class InterestInModelOld {
  String name;
  bool isSelected;

  InterestInModelOld({required this.name, required this.isSelected});

  static List<InterestInModelOld> items() => [
    InterestInModelOld(name: "Girls", isSelected: true),
    InterestInModelOld(name: "Boys", isSelected: false),
    InterestInModelOld(name: "Both", isSelected: false)
      ];
}
