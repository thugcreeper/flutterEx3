class Site {
  final String name;
  final String countryFlag; // emoji 國旗
  final int secretLevel; // 秘境程度 1-5 星星
  final int famousLevel; // 知名度 1-5 腳印
  final List<String> tags;
  final String? description;
  final String? imageUrl;
  final String? address;
  final String? mapUrl;

  const Site({
    required this.name,
    required this.countryFlag,
    required this.secretLevel,
    required this.famousLevel,
    this.tags = const [],
    this.description,
    this.imageUrl,
    this.address,
    this.mapUrl,
  });
}
