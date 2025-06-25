class CharacterDataModel {
  int id;
  String name;
  String image;
  String status;
  String species;
  String gender;
  String birthday;
  String location;
  String origin;

  CharacterDataModel({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.species,
    required this.gender,
    required this.birthday,
    required this.location,
    required this.origin,
  });

  factory CharacterDataModel.fromJson(Map<String, dynamic> json) {
    return CharacterDataModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      status: json['status'],
      species: json['species'],
      gender: json['gender'],
      birthday: json['created'],
      location: json['location']['name'],
      origin: json['origin']['name'],
    );
  }
}
