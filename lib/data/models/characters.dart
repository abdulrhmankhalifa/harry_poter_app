import 'package:equatable/equatable.dart';
import 'wand.dart';

class Character extends Equatable {
  final String id;
  final String name;
  final List<String> alternateNames;
  final String species;
  final String gender;
  final String house;
  final String dateOfBirth;
  final int yearOfBirth;
  final bool wizard;
  final String ancestry;
  final String eyeColour;
  final String hairColour;
  final String patronus;
  final Wand wand;
  final bool hogwartsStudent;
  final bool hogwartsStaff;
  final String actor;
  final bool isAlive;
  final String image;
  final List<String> alternateActors;

  const Character({
    required this.id,
    required this.name,
    required this.alternateNames,
    required this.species,
    required this.gender,
    required this.house,
    required this.dateOfBirth,
    required this.yearOfBirth,
    required this.wizard,
    required this.ancestry,
    required this.eyeColour,
    required this.hairColour,
    required this.patronus,
    required this.wand,
    required this.hogwartsStudent,
    required this.hogwartsStaff,
    required this.actor,
    required this.isAlive,
    required this.image,
    required this.alternateActors,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
    id: json['id']?.toString() ?? '',
    name: json['name'] ?? '',
    alternateNames: List<String>.from(
      (json['alternate_names'] ?? []).map((x) => x?.toString() ?? ''),
    ),
    species: json['species'] ?? '',
    gender: json['gender'] ?? '',
    house: json['house'] ?? '',
    dateOfBirth: json['dateOfBirth'] ?? '',
    yearOfBirth: json['yearOfBirth'] ?? 0,
    wizard: json['wizard'] ?? false,
    ancestry: json['ancestry'] ?? '',
    eyeColour: json['eyeColour'] ?? '',
    hairColour: json['hairColour'] ?? '',
    patronus: json['patronus'] ?? '',
    wand: (json['wand'] as Map<String, dynamic>?) != null
        ? Wand.fromJson(json['wand'] as Map<String, dynamic>)
        : const Wand(wood: '', core: '', length: 0.0),
    hogwartsStudent: json['hogwartsStudent'] ?? false,
    hogwartsStaff: json['hogwartsStaff'] ?? false,
    actor: json['actor'] ?? '',
    isAlive: json['alive'] ?? false,
    image: json['image'] ?? '',
    alternateActors: List<String>.from(
      (json['alternate_actors'] ?? []).map((x) => x?.toString() ?? ''),
    ),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'alternate_names': alternateNames,
    'species': species,
    'gender': gender,
    'house': house,
    'dateOfBirth': dateOfBirth,
    'yearOfBirth': yearOfBirth,
    'wizard': wizard,
    'ancestry': ancestry,
    'eyeColour': eyeColour,
    'hairColour': hairColour,
    'patronus': patronus,
    'wand': wand.toJson(),
    'hogwartsStudent': hogwartsStudent,
    'hogwartsStaff': hogwartsStaff,
    'actor': actor,
    'alive': isAlive,
    'image': image,
    'alternate_actors': alternateActors,
  };

  Character copyWith({
    String? id,
    String? name,
    List<String>? alternateNames,
    String? species,
    String? gender,
    String? house,
    String? dateOfBirth,
    int? yearOfBirth,
    bool? wizard,
    String? ancestry,
    String? eyeColour,
    String? hairColour,
    String? patronus,
    Wand? wand,
    bool? hogwartsStudent,
    bool? hogwartsStaff,
    String? actor,
    bool? isAlive,
    String? image,
    List<String>? alternateActors,
  }) => Character(
    id: id ?? this.id,
    name: name ?? this.name,
    alternateNames: alternateNames ?? this.alternateNames,
    species: species ?? this.species,
    gender: gender ?? this.gender,
    house: house ?? this.house,
    dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    yearOfBirth: yearOfBirth ?? this.yearOfBirth,
    wizard: wizard ?? this.wizard,
    ancestry: ancestry ?? this.ancestry,
    eyeColour: eyeColour ?? this.eyeColour,
    hairColour: hairColour ?? this.hairColour,
    patronus: patronus ?? this.patronus,
    wand: wand ?? this.wand,
    hogwartsStudent: hogwartsStudent ?? this.hogwartsStudent,
    hogwartsStaff: hogwartsStaff ?? this.hogwartsStaff,
    actor: actor ?? this.actor,
    isAlive: isAlive ?? this.isAlive,
    image: image ?? this.image,
    alternateActors: alternateActors ?? this.alternateActors,
  );

  @override
  List<Object?> get props => [
    id,
    name,
    alternateNames,
    species,
    gender,
    house,
    dateOfBirth,
    yearOfBirth,
    wizard,
    ancestry,
    eyeColour,
    hairColour,
    patronus,
    wand,
    hogwartsStudent,
    hogwartsStaff,
    actor,
    isAlive,
    image,
    alternateActors,
  ];
}
