class Wand {
  final String wood;
  final String core;
  final double length;

  const Wand({required this.wood, required this.core, required this.length});

  factory Wand.fromJson(Map<String, dynamic> json) => Wand(
    wood: json['wood'] ?? '',
    core: json['core'] ?? '',
    length: (json['length'] as num?)?.toDouble() ?? 0.0,
  );

  Map<String, dynamic> toJson() => {
    'wood': wood,
    'core': core,
    'length': length,
  };
}
