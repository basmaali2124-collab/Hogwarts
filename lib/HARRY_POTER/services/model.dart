class HogartsFamily {
  final String name;
  final List<String> alternateNames;  
  final String species;
  final String gender;
  final String house;
  final String yearOfBirth;
  final String ancestry;
  final String eyeColour;
  final String hairColour;
  final String image;
  final String patronus;

  HogartsFamily(
    this.name,
    this.alternateNames,
    this.species,
    this.gender,
    this.house,
    this.yearOfBirth,
    this.ancestry,
    this.eyeColour,
    this.hairColour,
    this.image,
    this.patronus,
  );

  factory HogartsFamily.fromJson(Map<String, dynamic> json) {
    return HogartsFamily(
      json['name'] ?? '',
      List<String>.from(json['alternate_names'] ?? []),  
      json['species'] ?? '',
      json['gender'] ?? '',
      json['house'] ?? '',
      json['yearOfBirth']?.toString() ?? 'Unknown', 
      json['ancestry'] ?? '',
      json['eyeColour'] ?? '',  
      json['hairColour'] ?? '',  
      json['image'] ?? '',
      json['patronus'] ?? '',  
    );
  }
}