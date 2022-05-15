class Fashion {
  final int id;
  final String url;
  final String name;
  final String location;
  final String description;
   bool isFavorite;
  Fashion(this.id, this.url, this.name, this.location, this.description, this.isFavorite);
  static List<Fashion> fashionList = [
    Fashion(1, "assets/img_1.png", "Khabibulloh", "Uzbekistan", "This boy now 16 years old", true),
    Fashion(2, "assets/img_1.png", "Khabibulloh", "Uzbekistan", "This boy now 16 years old", true),
    Fashion(3, "assets/img_1.png", "Khabibulloh", "Uzbekistan", "This boy now 16 years old", false),
    Fashion(4, "assets/img_1.png", "Khabibulloh", "Uzbekistan", "This boy now 16 years old", true),
    Fashion(5, "assets/img_1.png", "Khabibulloh", "Uzbekistan", "This boy now 16 years old",  false),
  ];



}